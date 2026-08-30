import torch
import torch.nn as nn
import torch.optim as optim
from torchvision import datasets, transforms
import os

class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        # Un bébé cadum réseau
        self.conv1 = nn.Conv2d(1, 2, kernel_size=5, stride=1)
        self.fc1 = nn.Linear(288, 10)

    def forward(self, x):
        x = self.conv1(x)
        x = torch.relu(x)
        x = torch.max_pool2d(x, 2)
        # CRUCIAL : On force PyTorch à adopter l'ordre matériel [Hauteur, Largeur, Canal]
        x = x.permute(0, 2, 3, 1)
        x = torch.flatten(x, 1)
        x = self.fc1(x)
        return torch.log_softmax(x, dim=1)

def main():
    torch.manual_seed(42)
    print("Configuration de l'appareil et des données...")
    # fallback on cpu if cuda is not available
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"Appareil utilisé : {device}")
    
    train_transform = transforms.Compose([
        transforms.RandomRotation(10),
        transforms.RandomAffine(degrees=0, translate=(0.1, 0.1)),
        transforms.ToTensor(),
        transforms.Lambda(lambda x: (x > 0.5).float()) # Binarisation absolue, 0.0 ou 1.0 !
    ])

    eval_transform = transforms.Compose([
        transforms.ToTensor(),
        transforms.Lambda(lambda x: (x > 0.5).float()) # Binarisation absolue, 0.0 ou 1.0 !
    ])
    
    # Téléchargement et chargement des données MNIST
    full_train_dataset = datasets.MNIST('./data', train=True, download=True, transform=train_transform)
    val_dataset_source = datasets.MNIST('./data', train=True, transform=eval_transform)
    test_dataset = datasets.MNIST('./data', train=False, transform=eval_transform)
    
    # Séparation 50k train / 10k val
    indices = torch.randperm(len(full_train_dataset)).tolist()
    train_idx = indices[:-10000]
    val_idx = indices[-10000:]
    
    train_subset = torch.utils.data.Subset(full_train_dataset, train_idx)
    val_subset = torch.utils.data.Subset(val_dataset_source, val_idx)
    
    train_loader = torch.utils.data.DataLoader(train_subset, batch_size=64, shuffle=True)
    val_loader = torch.utils.data.DataLoader(val_subset, batch_size=1000, shuffle=False)
    test_loader = torch.utils.data.DataLoader(test_dataset, batch_size=1000, shuffle=False)
    
    model = Net().to(device, dtype=torch.bfloat16)
    optimizer = optim.Adadelta(model.parameters(), lr=1.0)
    
    epochs = 10
    print(f"Début de l'entraînement ({epochs} époques avec Data Augmentation)...")
    for epoch in range(1, epochs + 1):
        model.train()
        for batch_idx, (data, target) in enumerate(train_loader):
            data, target = data.to(device, dtype=torch.bfloat16), target.to(device)
            optimizer.zero_grad()
            output = model(data)
            loss = torch.nn.functional.nll_loss(output, target)
            loss.backward()
            optimizer.step()
            if batch_idx % 200 == 0:
                print(f"Époque {epoch} | Progression : [{batch_idx * len(data)}/{len(train_loader.dataset)}] Perte: {loss.item():.6f}")
                
        # Validation après chaque époque
        model.eval()
        val_loss = 0
        correct = 0
        with torch.no_grad():
            for data, target in val_loader:
                data, target = data.to(device, dtype=torch.bfloat16), target.to(device)
                output = model(data)
                val_loss += torch.nn.functional.nll_loss(output, target, reduction='sum').item()
                pred = output.argmax(dim=1, keepdim=True)
                correct += pred.eq(target.view_as(pred)).sum().item()

        val_loss /= len(val_loader.dataset)
        accuracy = 100. * correct / len(val_loader.dataset)
        print(f"--- Fin Époque {epoch} | Val Loss: {val_loss:.4f} | Val Accuracy: {accuracy:.2f}% ---")
        
    print("\nÉvaluation finale sur le jeu de test original...")
    model.eval()
    test_loss = 0
    correct = 0
    with torch.no_grad():
        for data, target in test_loader:
            data, target = data.to(device, dtype=torch.bfloat16), target.to(device)
            output = model(data)
            test_loss += torch.nn.functional.nll_loss(output, target, reduction='sum').item()
            pred = output.argmax(dim=1, keepdim=True)
            correct += pred.eq(target.view_as(pred)).sum().item()

    test_loss /= len(test_loader.dataset)
    accuracy = 100. * correct / len(test_loader.dataset)
    print(f"\n--- Résultats Test Final (Modèle initial) ---")
    print(f"Perte moyenne: {test_loss:.4f}, Précision (Accuracy): {correct}/{len(test_loader.dataset)} ({accuracy:.2f}%)\n")
    
    print("Sauvegarde du modèle dans model.pth...")
    torch.save(model.state_dict(), 'model.pth')

    print("Sauvegarde des poids dans weights.txt (format tenseur)...")
    with open("weights.txt", "w", encoding="utf-8") as f:
        for name, param in model.state_dict().items():
            var_name = name.upper().replace('.', '_')
            # On passe par float() car numpy ne gère pas bien le bfloat16 nativement
            param_list = param.cpu().float().numpy().tolist()
            f.write(f"T_{var_name} = {param_list}\n\n")

    print("Quantification de la convolution en INT4...")
    W_conv1 = model.conv1.weight.data
    max_val = W_conv1.abs().max()
    scale_conv1 = max_val / 7.0
    # Quantification sur 4 bits : de -8 à 7
    W_conv1_int4 = torch.clamp(torch.round(W_conv1 / scale_conv1), -8, 7)
    
    # Appliquer la dé-quantification pour simuler la perte de précision pendant l'évaluation
    model.conv1.weight.data = (W_conv1_int4 * scale_conv1).to(torch.bfloat16)

    print("Évaluation sur le jeu de test avec Conv en INT4...")
    test_loss_int4 = 0
    correct_int4 = 0
    with torch.no_grad():
        for data, target in test_loader:
            data, target = data.to(device, dtype=torch.bfloat16), target.to(device)
            output = model(data)
            test_loss_int4 += torch.nn.functional.nll_loss(output, target, reduction='sum').item()
            pred = output.argmax(dim=1, keepdim=True)
            correct_int4 += pred.eq(target.view_as(pred)).sum().item()

    test_loss_int4 /= len(test_loader.dataset)
    accuracy_int4 = 100. * correct_int4 / len(test_loader.dataset)
    print(f"\n--- Résultats Test (INT4 Convolution) ---")
    print(f"Perte moyenne: {test_loss_int4:.4f}, Précision: {correct_int4}/{len(test_loader.dataset)} ({accuracy_int4:.2f}%)\n")

    print("Sauvegarde des poids INT4 dans weights_int4.txt (format tenseur)...")
    with open("weights_int4.txt", "w", encoding="utf-8") as f:
        f.write(f"T_CONV1_WEIGHT_INT4 = {W_conv1_int4.cpu().int().numpy().tolist()}\n\n")
        f.write(f"T_CONV1_SCALE = {scale_conv1.item()}\n\n")
        f.write(f"T_CONV1_BIAS = {model.conv1.bias.data.cpu().float().numpy().tolist()}\n\n")
        f.write(f"T_FC1_WEIGHT = {model.fc1.weight.data.cpu().float().numpy().tolist()}\n\n")
        f.write(f"T_FC1_BIAS = {model.fc1.bias.data.cpu().float().numpy().tolist()}\n\n")
        
    print("Quantification de la couche Linéaire en FP8 (W4A8)...")
    try:
        # Essai avec le vrai type FP8 de PyTorch (s'il est disponible)
        W_fc1_fp8 = model.fc1.weight.data.to(torch.float8_e4m3fn)
        model.fc1.weight.data = W_fc1_fp8.to(torch.bfloat16)
        fp8_type = "FP8 (e4m3fn)"
    except AttributeError:
        # Si FP8 n'est pas dispo, on simule un INT8 classique
        max_val_fc = model.fc1.weight.data.abs().max()
        scale_fc = max_val_fc / 127.0
        W_fc1_int8 = torch.clamp(torch.round(model.fc1.weight.data / scale_fc), -128, 127)
        model.fc1.weight.data = (W_fc1_int8 * scale_fc).to(torch.bfloat16)
        fp8_type = "INT8 (fallback)"

    print(f"Évaluation sur le jeu de test avec Conv en INT4 et Linear en {fp8_type}...")
    test_loss_w4a8 = 0
    correct_w4a8 = 0
    with torch.no_grad():
        for data, target in test_loader:
            data, target = data.to(device, dtype=torch.bfloat16), target.to(device)
            output = model(data)
            test_loss_w4a8 += torch.nn.functional.nll_loss(output, target, reduction='sum').item()
            pred = output.argmax(dim=1, keepdim=True)
            correct_w4a8 += pred.eq(target.view_as(pred)).sum().item()

    test_loss_w4a8 /= len(test_loader.dataset)
    accuracy_w4a8 = 100. * correct_w4a8 / len(test_loader.dataset)
    print(f"\n--- Résultats Test (W4A8: Conv INT4 + Linear {fp8_type}) ---")
    print(f"Perte moyenne: {test_loss_w4a8:.4f}, Précision: {correct_w4a8}/{len(test_loader.dataset)} ({accuracy_w4a8:.2f}%)\n")
    
    print("Sauvegarde des poids W4A8 dans src/weights_w4a8.txt (format tenseur)...")
    with open("src/weights_w4a8.txt", "w", encoding="utf-8") as f:
        f.write(f"T_CONV1_WEIGHT_INT4 = {W_conv1_int4.cpu().int().numpy().tolist()}\n\n")
        f.write(f"T_CONV1_SCALE = {scale_conv1.item()}\n\n")
        f.write(f"T_CONV1_BIAS = {model.conv1.bias.data.cpu().float().numpy().tolist()}\n\n")
        try:
            # Pour l'export texte on repasse en float32
            f.write(f"T_FC1_WEIGHT_FP8 = {W_fc1_fp8.cpu().float().numpy().tolist()}\n\n")
        except NameError:
            f.write(f"T_FC1_WEIGHT_INT8 = {W_fc1_int8.cpu().int().numpy().tolist()}\n\n")
            f.write(f"T_FC1_SCALE_FC = {scale_fc.item()}\n\n")
        f.write(f"T_FC1_BIAS = {model.fc1.bias.data.cpu().float().numpy().tolist()}\n\n")

    print("Quantification globale en INT4 (Full INT4)...")
    # On recharge les poids originaux (non quantifiés) du modèle depuis le disque
    model.load_state_dict(torch.load('model.pth'))
    
    # Conv1 INT4
    W_conv1 = model.conv1.weight.data
    scale_conv1 = W_conv1.abs().max() / 7.0
    W_conv1_int4 = torch.clamp(torch.round(W_conv1 / scale_conv1), -8, 7)
    model.conv1.weight.data = (W_conv1_int4 * scale_conv1).to(torch.bfloat16)
    
    # FC1 INT4
    W_fc1 = model.fc1.weight.data
    scale_fc1_int4 = W_fc1.abs().max() / 7.0
    W_fc1_int4 = torch.clamp(torch.round(W_fc1 / scale_fc1_int4), -8, 7)
    model.fc1.weight.data = (W_fc1_int4 * scale_fc1_int4).to(torch.bfloat16)

    print("Évaluation sur le jeu de test avec Conv et Linear en INT4...")
    test_loss_full_int4 = 0
    correct_full_int4 = 0
    with torch.no_grad():
        for data, target in test_loader:
            data, target = data.to(device, dtype=torch.bfloat16), target.to(device)
            output = model(data)
            test_loss_full_int4 += torch.nn.functional.nll_loss(output, target, reduction='sum').item()
            pred = output.argmax(dim=1, keepdim=True)
            correct_full_int4 += pred.eq(target.view_as(pred)).sum().item()

    test_loss_full_int4 /= len(test_loader.dataset)
    accuracy_full_int4 = 100. * correct_full_int4 / len(test_loader.dataset)
    print(f"\n--- Résultats Test (Full INT4: Conv INT4 + Linear INT4) ---")
    print(f"Perte moyenne: {test_loss_full_int4:.4f}, Précision: {correct_full_int4}/{len(test_loader.dataset)} ({accuracy_full_int4:.2f}%)\n")

    print("Sauvegarde des poids Full INT4 dans weights_full_int4.txt (format tenseur)...")
    with open("weights_full_int4.txt", "w", encoding="utf-8") as f:
        f.write(f"T_CONV1_WEIGHT_INT4 = {W_conv1_int4.cpu().int().numpy().tolist()}\n\n")
        f.write(f"T_CONV1_SCALE = {scale_conv1.item()}\n\n")
        f.write(f"T_CONV1_BIAS = {model.conv1.bias.data.cpu().float().numpy().tolist()}\n\n")
        f.write(f"T_FC1_WEIGHT_INT4 = {W_fc1_int4.cpu().int().numpy().tolist()}\n\n")
        f.write(f"T_FC1_SCALE = {scale_fc1_int4.item()}\n\n")
        f.write(f"T_FC1_BIAS = {model.fc1.bias.data.cpu().float().numpy().tolist()}\n\n")

    print("Sauvegarde de quelques exemples dans examples.txt (format tenseur)...")
    with open("examples.txt", "w", encoding="utf-8") as f:
        data, target = next(iter(test_loader))
        images = []
        labels = []
        for i in range(5):
            img = (data[i].squeeze() > 0).int().numpy().tolist()
            label = target[i].item()
            images.append(img)
            labels.append(label)
        f.write(f"T_EXEMPLES = {images}\n\n")
        f.write(f"T_LABELS = {labels}\n")
            
    print("Terminé avec succès !")

if __name__ == '__main__':
    main()
