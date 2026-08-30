import torch
import torch.nn as nn
import torch.nn.functional as F
import os

def load_weights_dict(filepath):
    with open(filepath, "r") as f:
        content = f.read()
    d = {}
    exec(content, {}, d)
    return d

def hardware_sint_to_float(x_int):
    """
    Simulates the exact SpinalML hardware conversion from SInt to FP8_E4M3.
    The RTL truncates the mantissa instead of rounding to nearest even.
    """
    x_i32 = x_int.to(torch.int32)
    mask_zero = (x_i32 == 0)
    
    x_float_safe = x_i32.to(torch.float32)
    x_float_safe[mask_zero] = 1.0
    
    p = torch.floor(torch.log2(x_float_safe)).to(torch.int32)
    
    padded = torch.bitwise_left_shift(x_i32, 15 - p)
    mant = torch.bitwise_right_shift(padded, 12) & 7
    
    decoded = (1.0 + mant.to(torch.float32) / 8.0) * (2.0 ** p.to(torch.float32))
    decoded[mask_zero] = 0.0
    return decoded

def cast_e4m3(x):
    try:
        x = x.to(torch.float8_e4m3fn).to(torch.float32)
    except AttributeError:
        pass
        
    # SpinalML HWFloat treats any exponent=0 as +0.0 (NO subnormals).
    # Minimum normal E4M3 is 2^-6 = 0.015625.
    x = x.clone()
    x[x.abs() < 0.015625] = 0.0
    return x

def hardware_e4m3_linear(x_float, w_float, b_float, wLanes=4):
    """
    Simulates exactly the FPGA linear layer: FP8 multiplications and 
    binary adder tree with FP8 truncation at each node.
    """
    out = torch.zeros((1, 10), dtype=torch.float32, device=x_float.device)
    x = x_float[0]
    chunks = x.shape[0] // wLanes
    
    for o in range(10):
        w = w_float[o]
        acc = torch.tensor(0.0, dtype=torch.float32, device=x.device)
        
        for c in range(chunks):
            # wLanes=4 is hardcoded in the tree simulation here
            p0 = cast_e4m3(x[c*4 + 0] * w[c*4 + 0])
            p1 = cast_e4m3(x[c*4 + 1] * w[c*4 + 1])
            p2 = cast_e4m3(x[c*4 + 2] * w[c*4 + 2])
            p3 = cast_e4m3(x[c*4 + 3] * w[c*4 + 3])
            
            sum0 = cast_e4m3(p0 + p1)
            sum1 = cast_e4m3(p2 + p3)
            chunk_sum = cast_e4m3(sum0 + sum1)
            
            acc = cast_e4m3(acc + chunk_sum)
            
        out[0, o] = cast_e4m3(acc + b_float[o])
        
    return out

class MnistTorchReplica(nn.Module):
    def __init__(self, weights_path="src/weights_w4a8.txt"):
        super().__init__()
        
        # Linear layer
        self.fc1 = nn.Linear(288, 10)
        
        # Load weights
        if os.path.exists(weights_path):
            d = load_weights_dict(weights_path)
            
            # 1. CONV1 (Integer Domain)
            self.register_buffer('conv1_w_int4', torch.tensor(d['T_CONV1_WEIGHT_INT4'], dtype=torch.float32))
            
            # The scale in HW is an E4M3 constant, so we MUST cast it!
            self.conv1_scale_fp32 = d['T_CONV1_SCALE']
            self.conv1_scale = cast_e4m3(torch.tensor(self.conv1_scale_fp32, dtype=torch.float32)).item()
            
            # Use exact Python int(round(b/scale)) like fpga_driver.py
            conv1_b_list = d['T_CONV1_BIAS']
            bqs = [float(int(round(b / self.conv1_scale_fp32))) for b in conv1_b_list]
            self.register_buffer('conv1_b_int16', torch.tensor(bqs, dtype=torch.float32))
            
            # 2. FC1 (FP8 Domain)
            fc1_w = torch.tensor(d.get('T_FC1_WEIGHT_FP8', d.get('T_FC1_WEIGHT_INT4', [])), dtype=torch.float32)
            
            # Flush subnormal weights to zero (RTL hardware doesn't support subnormals)
            fc1_w[fc1_w.abs() < 0.015625] = 0.0
            
            if fc1_w.shape == (10, 288):
                self.fc1.weight.data = fc1_w
            elif fc1_w.numel() > 0:
                self.fc1.weight.data = fc1_w.view(288, 10).t()
                
            fc1_b = torch.tensor(d['T_FC1_BIAS'], dtype=torch.float32)
            fc1_b[fc1_b.abs() < 0.015625] = 0.0
            self.fc1.bias.data = fc1_b
        else:
            raise FileNotFoundError(f"Weights file {weights_path} not found.")

    def forward(self, x):
        # 1. Convolution on INTEGERS
        x_int = F.conv2d(x, self.conv1_w_int4, self.conv1_b_int16, stride=1, padding=0)
        
        # 2. ReLU and MaxPool on INTEGERS
        x_int = F.relu(x_int)
        x_int = F.max_pool2d(x_int, kernel_size=2, stride=2)
        
        # 3. Simulate hardware I16 -> FP8 Cast (TRUNCATION)
        x_hw_float = hardware_sint_to_float(x_int)
        
        # 4. Apply scale and simulate FP8 multiplication RNE
        x_float = x_hw_float * self.conv1_scale
        try:
            x_fp8 = x_float.to(torch.float8_e4m3fn)
            x_float = x_fp8.to(torch.float32)
        except AttributeError:
            pass # Ignore if not supported
            
        # 5. Permute and Flatten (Hardware stream order)
        x_float = x_float.permute(0, 2, 3, 1) # -> (1, 12, 12, 2)
        x_float = torch.flatten(x_float, 1)   # -> (1, 288)
        
        # 6. Linear in FP8 (simulating FPGA adder tree)
        out = hardware_e4m3_linear(x_float, self.fc1.weight, self.fc1.bias, wLanes=4)
        return out

def infer_pytorch(img_bytes, model=None):
    if model is None:
        model = MnistTorchReplica()
    model.eval()
    
    import numpy as np
    # img_bytes is 784 bytes of 0s and 1s.
    arr = np.frombuffer(img_bytes, dtype=np.uint8).astype(np.float32)
    # Reshape to (B, C, H, W)
    t = torch.tensor(arr).view(1, 1, 28, 28)
    
    with torch.no_grad():
        logits = model(t)
        # Softmax
        probs = F.softmax(logits, dim=1).squeeze(0).numpy()
    
    return {str(i): float(probs[i]) for i in range(10)}

if __name__ == "__main__":
    import numpy as np
    # Simple test with empty image
    img = np.zeros(784, dtype=np.uint8).tobytes()
    res = infer_pytorch(img)
    print(res)
