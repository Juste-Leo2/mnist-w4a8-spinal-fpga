import gradio as gr
import numpy as np
from PIL import Image, ImageOps
import logging
from src.fpga_driver import FpgaHostBridge
from src.pytorch_replica import infer_pytorch, MnistTorchReplica

# Instanciation du driver série
# Mettre mock=False quand la carte sera branchée et le module verilog UART prêt.
# port="COM8" selon tes indications.
driver = FpgaHostBridge(port="COM8", baudrate=115200, mock=False)

# PyTorch W4A8 (simulated from quantized weights, mathematically bit-exact)
torch_model_w4a8 = MnistTorchReplica("src/weights_w4a8.txt")
torch_model_w4a8.eval()

if not driver.mock:
    try:
        driver.load_weights("src/weights_w4a8.txt")
    except Exception as e:
        logging.error(f"Erreur lors du chargement des poids : {e}")

def process_image(img_dict):
    """
    Reçoit l'image du composant Sketchpad de Gradio (dictionnaire avec 'composite', 'background', etc.)
    ou directement une matrice selon la version de Gradio.
    """
    if img_dict is None or (not isinstance(img_dict, dict) and not isinstance(img_dict, np.ndarray)):
        empty_res = {str(i): 0.0 for i in range(10)}
        return empty_res, empty_res, np.zeros((28, 28), dtype=np.uint8)

    # Dans Gradio récent, le sketchpad envoie un dictionnaire avec 'composite'
    if isinstance(img_dict, dict) and "composite" in img_dict:
        img_array = img_dict["composite"]
    else:
        img_array = img_dict
        
    if img_array is None or not isinstance(img_array, np.ndarray):
        empty_res = {str(i): 0.0 for i in range(10)}
        return empty_res, empty_res, np.zeros((28, 28), dtype=np.uint8)

    # L'image est souvent RGBA. On extrait le canal alpha ou on convertit en niveaux de gris.
    # L'utilisateur dessine en blanc sur fond noir ou noir sur blanc.
    image = Image.fromarray(img_array)
    
    # Si fond transparent, on met un fond noir
    if image.mode == 'RGBA':
        background = Image.new('RGBA', image.size, (0, 0, 0, 255))
        alpha_composite = Image.alpha_composite(background, image)
        image = alpha_composite.convert('L')
    else:
        image = image.convert('L')

    # Inverser si nécessaire (Gradio Sketchpad a souvent un fond blanc, ou un fond transparent. 
    # S'il est blanc, on inverse pour avoir le dessin en blanc sur fond noir comme MNIST)
    # Vérifions la couleur de fond (pixel 0,0)
    bg_pixel = image.getpixel((0, 0))
    if bg_pixel > 127:
        image = ImageOps.invert(image)

    # Récupérer la Bounding Box du chiffre (où les pixels > 0)
    bbox = image.getbbox()
    if bbox:
        # On croppe autour du dessin
        image = image.crop(bbox)
        
        # On rend l'image carrée en ajoutant du padding noir pour garder les proportions
        width, height = image.size
        max_dim = max(width, height)
        
        # On ajoute une petite marge (20% comme dans MNIST)
        padding = int(max_dim * 0.2)
        new_size = max_dim + padding * 2
        
        square_img = Image.new('L', (new_size, new_size), color=0)
        paste_x = (new_size - width) // 2
        paste_y = (new_size - height) // 2
        square_img.paste(image, (paste_x, paste_y))
        image = square_img
    
    # Redimensionnement final en 28x28 (anti-aliasing)
    image = image.resize((28, 28), Image.Resampling.LANCZOS)
    
    # Convertir en tableau Numpy de type uint8 (pour l'affichage UI: 0-255)
    img_data = np.array(image, dtype=np.uint8)
    
    # Le réseau matériel quantifié attend EXPLICITEMENT des pixels 0 ou 1 !
    fpga_data = (img_data > 127).astype(np.uint8)
    
    # L'aplatir en 784 octets
    img_bytes = fpga_data.tobytes()
    
    # Envoi au FPGA
    logits_fpga = driver.run_inference(img_bytes)
    
    # Inférence PyTorch W4A8
    logits_torch_w4a8 = infer_pytorch(img_bytes, torch_model_w4a8)
    
    return logits_fpga, logits_torch_w4a8, img_data

# --- Définition de l'interface Gradio ---

with gr.Blocks() as demo:
    gr.Markdown(
        """
        # 🧠 Inférence MNIST W4A8 sur FPGA (Temps Réel)
        Dessinez un chiffre (0-9) ci-dessous. Le réseau de neurones matériel prédira la classe en temps réel via le port série `COM8`.
        *(Mode MOCK activé par défaut tant que le FPGA n'est pas branché)*
        """
    )
    
    with gr.Row():
        with gr.Column():
            # Sketchpad pour dessiner
            pad = gr.Sketchpad(
                label="Dessinez ici",
                brush=gr.Brush(colors=["#000000"]),
                type="numpy"
            )
        
        with gr.Column():
            preview = gr.Image(label="Ce que voit le FPGA (28x28)", interactive=False)
            with gr.Row():
                # Affichage des prédictions FPGA
                label_fpga = gr.Label(
                    num_top_classes=10, 
                    label="Prédictions FPGA (W4A8)"
                )
                # Affichage des prédictions PyTorch W4A8
                label_torch_w4a8 = gr.Label(
                    num_top_classes=10, 
                    label="PyTorch (W4A8 Bit-Exact)"
                )

    # Mode 'live' : Dès que l'utilisateur modifie le dessin (change), on lance l'inférence
    pad.change(fn=process_image, inputs=pad, outputs=[label_fpga, label_torch_w4a8, preview])

if __name__ == "__main__":
    logging.info("Lancement de l'interface web Gradio...")
    demo.launch(server_name="127.0.0.1", server_port=7860)
