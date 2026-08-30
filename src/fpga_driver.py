import serial
import time
import numpy as np
import logging

logging.basicConfig(level=logging.INFO, format='%(levelname)s: %(message)s')

class FpgaHostBridge:
    def __init__(self, port="COM8", baudrate=115200, mock=False):
        self.port = port
        self.baudrate = baudrate
        self.mock = mock
        self.serial = None
        
        if not self.mock:
            try:
                self.serial = serial.Serial(self.port, self.baudrate, timeout=1.0)
                logging.info(f"Connecté au FPGA sur {self.port} à {self.baudrate} baud.")
            except Exception as e:
                logging.warning(f"Impossible de se connecter à {self.port} : {e}")
                logging.warning("Passage en mode MOCK (simulation logicielle) pour l'interface.")
                self.mock = True

    def close(self):
        if self.serial and self.serial.is_open:
            self.serial.close()

    def write_csr(self, addr, value):
        """
        Ecrit un registre AXI-Lite 32 bits.
        Format Python Host: 'C' + ADDR_LSB + VAL_LSB
        """
        if self.mock:
            logging.info(f"[MOCK] AXI-Lite Write: ADDR=0x{addr:08X} VAL=0x{value:08X}")
            return
            
        header = b'C'
        addr_bytes = addr.to_bytes(4, byteorder='little')
        val_bytes = value.to_bytes(4, byteorder='little')
        
        packet = header + addr_bytes + val_bytes
        self.serial.write(packet)
        self.serial.flush()

    def _fp8Bits(self, f):
        import math
        if f == 0.0: return 0
        sign = 0x80 if f < 0 else 0
        a = abs(f)
        if a >= (2.0 ** -6):
            e = int(math.floor(math.log2(a)))
            mF = a / (2.0 ** e)
            if mF >= 2.0:
                mF /= 2.0
                e += 1
            m = int(math.floor((mF - 1) * 8 + 0.5))
            if m == 8:
                m = 0
                e += 1
            eb = e + 7
            return sign | (eb << 3) | m
        else:
            m = int(math.floor(a * 512 + 0.5))
            return sign | m

    def load_weights(self, filepath):
        """
        Charge et formate les poids depuis le fichier texte,
        puis les envoie à l'adresse 0x20000.
        """
        import math
        import ast
        logging.info(f"Chargement des poids depuis {filepath}...")
        
        with open(filepath, "r") as f:
            content = f.read()
        
        # Astuce pour extraire les variables facilement
        d = {}
        exec(content, {}, d)
        
        def flatten(lst):
            for item in lst:
                if isinstance(item, list):
                    yield from flatten(item)
                else:
                    yield item

        # 1. ConvW (I4 packed into bytes, 50 elements -> 25 bytes, pad to 32 bytes)
        convW_list = list(flatten(d['T_CONV1_WEIGHT_INT4']))
        convW_bytes = []
        for i in range(0, len(convW_list), 2):
            v0 = convW_list[i] & 0xF
            v1 = (convW_list[i+1] & 0xF) if i+1 < len(convW_list) else 0
            convW_bytes.append(v0 | (v1 << 4))
        convW_bytes += [0] * (32 - len(convW_bytes)) # Pad to 32 bytes

        # 2. ConvB (I16 little-endian, 2 elements -> 4 bytes, pad to 8 bytes)
        convB_list = list(flatten(d['T_CONV1_BIAS']))
        scale = d['T_CONV1_SCALE']
        convB_bytes = []
        for b in convB_list:
            bq = int(round(b / scale))
            convB_bytes.append(bq & 0xFF)
            convB_bytes.append((bq >> 8) & 0xFF)
        convB_bytes += [0] * (8 - len(convB_bytes)) # Pad to 8 bytes

        # 3. FcW (E4M3, 2880 elements -> 2880 bytes, already 8-byte aligned)
        fcW_list = list(flatten(d['T_FC1_WEIGHT_FP8']))
        fcW_bytes = [self._fp8Bits(f) for f in fcW_list]
        
        # 4. FcB (E4M3, 10 elements -> 10 bytes, pad to 16 bytes)
        fcB_list = list(flatten(d['T_FC1_BIAS']))
        fcB_bytes = [self._fp8Bits(f) for f in fcB_list]
        fcB_bytes += [0] * (16 - len(fcB_bytes)) # Pad to 16 bytes
        
        total_payload = convW_bytes + convB_bytes + fcW_bytes + fcB_bytes
        total_bytes = bytes(total_payload)
        
        logging.info(f"Poids compressés : {len(total_bytes)} octets envoyés au FPGA.")
        self.upload_bytes(0x20000, total_bytes)

    def set_csr(self, addr, value):
        """
        Envoie une commande AXI-Lite.
        Format (exemple simple) : 'C' (1 octet), addr (4 octets), value (4 octets)
        """
        if self.mock:
            logging.debug(f"[MOCK] CSR Write: addr=0x{addr:02X}, value=0x{value:08X}")
            return

        # Construction d'un paquet simple: 'C' (Command), Addr (uint32), Value (uint32)
        packet = b'C' + addr.to_bytes(4, byteorder='little') + value.to_bytes(4, byteorder='little')
        self.serial.write(packet)
        # Attendre un éventuel ACK (selon ce que fera le module verilog)

    def upload_bytes(self, base_addr, data: bytes):
        """
        Envoie un bloc de données vers la DDR via AXI.
        Format (exemple) : 'W' (1 octet), addr (4 octets), length (4 octets), payload...
        """
        if self.mock:
            logging.debug(f"[MOCK] Upload {len(data)} bytes to 0x{base_addr:08X}")
            return
            
        length = len(data)
        header = b'W' + base_addr.to_bytes(4, byteorder='little') + length.to_bytes(4, byteorder='little')
        self.serial.write(header)
        
        # Envoi par chunks pour éviter de saturer le buffer série
        chunk_size = 256
        for i in range(0, length, chunk_size):
            chunk = data[i:i+chunk_size]
            self.serial.write(chunk)

    def read_logits(self):
        """
        Lit les 10 logits en sortie (axi4-stream).
        Chaque logit est en format E4M3 (1 octet).
        """
        if self.mock:
            # Mode Mock: on génère des probabilités bidons qui favorisent un peu le hasard, 
            # ou un simple fake (one-hot).
            # On retourne un dictionnaire de probas pour Gradio
            logits = np.random.randn(10)
            exp_logits = np.exp(logits - np.max(logits))
            probs = exp_logits / np.sum(exp_logits)
            return {str(i): float(probs[i]) for i in range(10)}
            
        # Demander la lecture des résultats
        self.serial.write(b'R') 
        
        # Attendre 10 octets (FP8)
        raw_bytes = self.serial.read(10)
        if len(raw_bytes) < 10:
            logging.error("Timeout ou erreur de lecture des logits depuis le FPGA.")
            return {str(i): 0.0 for i in range(10)}
            
        # Conversion grossière E4M3 -> Float (à affiner selon l'encodage exact utilisé)
        probs = self._decode_e4m3_array(raw_bytes)
        return {str(i): float(probs[i]) for i in range(10)}
        
    def _decode_e4m3_array(self, data_bytes):
        # Vrai décodage E4M3 (1 bit de signe, 4 bits d'exposant, 3 bits de mantisse)
        floats = []
        for b in data_bytes:
            sign = (b >> 7) & 1
            exp = (b >> 3) & 0x0F
            mant = b & 0x07
            
            if exp == 0:
                val = (mant / 8.0) * (2.0 ** -6)
            else:
                val = (1.0 + mant / 8.0) * (2.0 ** (exp - 7))
                
            if sign == 1:
                val = -val
            floats.append(val)
            
        arr = np.array(floats, dtype=np.float32)
        # Softmax numérique stable sur les vrais logits
        exp_arr = np.exp(arr - np.max(arr))
        return exp_arr / np.sum(exp_arr)

    def read_status(self, prefix=""):
        """
        Envoie la commande 'S' pour lire l'octet de statut et le décode.
        """
        if self.mock:
            return
            
        self.serial.write(b'S')
        raw = self.serial.read(1)
        if len(raw) == 1:
            st = raw[0]
            logging.info(f"{prefix} FPGA Status: arvalid={(st>>7)&1}, rvalid={(st>>6)&1}, awvalid={(st>>5)&1}, wvalid={(st>>4)&1}, out_valid={(st>>3)&1}, done={(st>>2)&1}, busy={(st>>1)&1}")
        else:
            logging.warning(f"{prefix} FPGA Status: Timeout")

    def run_inference(self, img_784_bytes):
        """
        Séquence complète d'inférence avec l'image fournie.
        """
        # 1. Upload de l'image
        self.upload_bytes(0x10000, img_784_bytes)
        
        self.read_status("[Avant Start]")
        
        # 2. Démarrage de l'inférence
        self.set_csr(0x08, 0x10000) # imgBase
        self.set_csr(0x0C, 0x20000) # weightBase
        self.set_csr(0x00, 0x01)    # start
        
        # Telemetry: polling for 5 iterations
        for i in range(5):
            self.read_status(f"[Polling {i}]")
            time.sleep(0.1)
        
        # 3. Lecture des logits
        return self.read_logits()
