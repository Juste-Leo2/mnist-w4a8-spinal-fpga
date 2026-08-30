import gradio as gr
import numpy as np
from PIL import Image, ImageOps
import logging
from src.fpga_driver import FpgaHostBridge
from src.pytorch_replica import infer_pytorch, MnistTorchReplica

# Serial driver instantiation
# Set mock=False when the board is plugged in and the UART verilog module is ready.
# port="COM8" based on user indication.
driver = FpgaHostBridge(port="COM8", baudrate=115200, mock=False)

# PyTorch W4A8 (simulated from quantized weights, mathematically bit-exact)
torch_model_w4a8 = MnistTorchReplica("src/weights_w4a8.txt")
torch_model_w4a8.eval()

if not driver.mock:
    try:
        driver.load_weights("src/weights_w4a8.txt")
    except Exception as e:
        logging.error(f"Error loading weights: {e}")

def process_image(img_dict):
    """
    Receives the image from Gradio's Sketchpad component (dict with 'composite', 'background', etc.)
    or directly a matrix depending on the Gradio version.
    """
    if img_dict is None or (not isinstance(img_dict, dict) and not isinstance(img_dict, np.ndarray)):
        empty_res = {str(i): 0.0 for i in range(10)}
        return empty_res, empty_res, np.zeros((28, 28), dtype=np.uint8)

    # In recent Gradio, the sketchpad sends a dictionary with 'composite'
    if isinstance(img_dict, dict) and "composite" in img_dict:
        img_array = img_dict["composite"]
    else:
        img_array = img_dict
        
    if img_array is None or not isinstance(img_array, np.ndarray):
        empty_res = {str(i): 0.0 for i in range(10)}
        return empty_res, empty_res, np.zeros((28, 28), dtype=np.uint8)

    # The image is often RGBA. We extract the alpha channel or convert to grayscale.
    # The user draws in white on a black background or black on white.
    image = Image.fromarray(img_array)
    
    # If transparent background, add a black background
    if image.mode == 'RGBA':
        background = Image.new('RGBA', image.size, (0, 0, 0, 255))
        alpha_composite = Image.alpha_composite(background, image)
        image = alpha_composite.convert('L')
    else:
        image = image.convert('L')

    # Invert if necessary (Gradio Sketchpad often has a white background or transparent. 
    # If white, we invert to have white drawing on black background like MNIST)
    # Check background color (pixel 0,0)
    bg_pixel = image.getpixel((0, 0))
    if bg_pixel > 127:
        image = ImageOps.invert(image)

    # Get the Bounding Box of the digit (where pixels > 0)
    bbox = image.getbbox()
    if bbox:
        # Crop around the drawing
        image = image.crop(bbox)
        
        # Make the image square by adding black padding to keep proportions
        width, height = image.size
        max_dim = max(width, height)
        
        # Add a small margin (20% like in MNIST)
        padding = int(max_dim * 0.2)
        new_size = max_dim + padding * 2
        
        square_img = Image.new('L', (new_size, new_size), color=0)
        paste_x = (new_size - width) // 2
        paste_y = (new_size - height) // 2
        square_img.paste(image, (paste_x, paste_y))
        image = square_img
    
    # Final resize to 28x28 (anti-aliasing)
    image = image.resize((28, 28), Image.Resampling.LANCZOS)
    
    # Convert to Numpy array of type uint8 (for UI display: 0-255)
    img_data = np.array(image, dtype=np.uint8)
    
    # The quantized hardware network EXPLICITLY expects pixels 0 or 1!
    fpga_data = (img_data > 127).astype(np.uint8)
    
    # Flatten to 784 bytes
    img_bytes = fpga_data.tobytes()
    
    # Send to FPGA
    logits_fpga = driver.run_inference(img_bytes)
    
    # PyTorch W4A8 Inference
    logits_torch_w4a8 = infer_pytorch(img_bytes, torch_model_w4a8)
    
    return logits_fpga, logits_torch_w4a8, img_data

# --- Gradio Interface Definition ---

with gr.Blocks() as demo:
    gr.Markdown(
        """
        # 🧠 MNIST W4A8 Inference on FPGA (Real-Time)
        Draw a digit (0-9) below. The hardware neural network will predict the class in real time via the `COM8` serial port.
        """
    )
    
    with gr.Row():
        with gr.Column():
            # Sketchpad to draw
            pad = gr.Sketchpad(
                label="Draw here",
                brush=gr.Brush(colors=["#000000"]),
                type="numpy"
            )
        
        with gr.Column():
            preview = gr.Image(label="What the FPGA sees (28x28)", interactive=False)
            with gr.Row():
                # Display FPGA predictions
                label_fpga = gr.Label(
                    num_top_classes=10, 
                    label="FPGA Predictions (W4A8)"
                )
                # Display PyTorch W4A8 predictions
                label_torch_w4a8 = gr.Label(
                    num_top_classes=10, 
                    label="PyTorch (W4A8 Bit-Exact)"
                )

    # 'live' mode: As soon as the user modifies the drawing (change), we launch inference
    pad.change(fn=process_image, inputs=pad, outputs=[label_fpga, label_torch_w4a8, preview])

if __name__ == "__main__":
    logging.info("Launching Gradio web interface...")
    demo.launch(server_name="127.0.0.1", server_port=7860)
