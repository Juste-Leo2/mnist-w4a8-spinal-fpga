# Simulateur PyTorch "Bit-Exact" W4A8 pour Accélérateur Matériel (FPGA)

## 📌 Contexte et Objectif
Ce dépôt contient le code pour l'inférence d'un réseau de neurones sur le dataset MNIST, ciblant une exécution accélérée sur FPGA. L'architecture matérielle exploite un format de quantification mixte agressif : **W4A8** (Poids en entier 4 bits pour la convolution `Conv2D`, et type flottant réduit FP8 E4M3 pour la couche dense `Linear`).

L'objectif de ce dépôt est de fournir un simulateur logiciel pur PyTorch (`pytorch_replica.py`) capable de reproduire mathématiquement, **au bit près**, les calculs physiques et les défauts de la puce silicium (développée en SpinalHDL). 

## 🛠️ Ce qui a été réalisé
1. **Création du Simulateur Matériel** : Abandon de l'inférence Float32 classique pour une émulation cycle par cycle des opérations matérielles avec `pytorch_replica.py`.
2. **Synchronisation des types de données** : Le modèle logiciel utilise le support PyTorch `torch.float8_e4m3fn` et des opérations entières pour suivre le flux de données matériel (I8 pour les pixels, I4 pour les poids, accumulateur I16, Cast FP8).
3. **Interface Gradio Temps Réel** : L'interface graphique (`app.py`) permet de comparer en simultané l'inférence physique (recevant les octets depuis le FPGA via UART) et l'inférence logicielle PyTorch.

---

## 🔬 Les Défis du "Bit-Exact" (Transparence et Implémentation)

Reproduire le comportement d'un accélérateur matériel en Python pur révèle de nombreuses divergences entre les mathématiques idéales des GPU et les choix d'optimisation d'un FPGA. Voici les compromis et phénomènes qui ont été identifiés et explicitement modélisés dans notre simulateur pour atteindre cette symétrie parfaite.

### 1. La destruction des nombres Subnormaux (Flush-to-Zero)
Le format FP8 E4M3 IEEE autorise les nombres dits "subnormaux" (les nombres extrêmement proches de zéro). Dans un souci d'économie critique de portes logiques (LUTs), l'unité de calcul flottante du FPGA **ne gère pas** les subnormaux et les écrase à zéro.
- *Problématique* : 106 poids de notre couche Linear issus de l'entraînement PyTorch étaient mathématiquement valides, mais lus physiquement comme des zéros complets par le FPGA, causant un lourd décalage des probabilités.
- *Solution Logicielle* : Implémentation d'un filtre logiciel (`cast_e4m3`) qui écrase à `0.0` toutes les valeurs absolues inférieures au minimum normal du E4M3 ($2^{-6} = 0.015625$).

### 2. Troncature vs Arrondi (Cast Int16 -> FP8)
Lors du passage de la couche Conv2D (Entier 16 bits) à la couche Linear (Flottant 8 bits), la fonction de cast standard de PyTorch applique un arrondi au plus proche (`Round-to-Nearest-Even`).
- *Problématique* : Pour simplifier le silicium, le circuit FPGA procède à une **troncature brutale de la mantisse** (il coupe les bits excédentaires sans aucun arrondi).
- *Solution Logicielle* : Développement d'une fonction `hardware_sint_to_float` en Python pour émuler mathématiquement l'extracteur de bit de poids fort et tronquer manuellement la mantisse via des opérations binaires (`bitwise_shift`).

### 3. L'arbre d'addition FP8 (Adder Tree)
PyTorch effectue un produit matriciel global `(1x288) @ (288x10)` via un accumulateur interne en Float32 (sans aucune perte de précision).
- *Problématique* : Le FPGA possède des additionneurs FP8 groupés par petits blocs de 4 (`wLanes = 4`). Les additions se déroulent sous forme d'arbre binaire matériel, et **chaque nœud intermédiaire perd de la précision** en repassant la somme au format strict E4M3, accumulant de petites erreurs d'arrondi.
- *Solution Logicielle* : Réécriture de l'opérateur linéaire (`hardware_e4m3_linear`) sous la forme de boucles imbriquées qui reproduisent la topologie exacte de l'arbre matériel, injectant un cast E4M3 forcé à *chaque* addition intermédiaire.

### 4. La précision des échelles (Constants Truncation)
L'échelle de déquantification issue de l'entraînement PyTorch (`T_CONV1_SCALE`) est un `Float32` pur (ex: `0.28515625`).
- *Problématique* : Dans le hardware, cette constante est compilée en tant que littéral E4M3 (elle perd de sa précision et devient `0.28125`). Multiplier par le scale Float32 original en Python causait une divergence minime mais exponentielle sur les logits de sortie.
- *Solution Logicielle* : Cast obligatoire des constantes d'échelle au format E4M3 dès l'initialisation du simulateur PyTorch.

### 5. Affichage UI (Softmax vs Normalisation Linéaire)
Le simulateur PyTorch natif avait tendance à donner des prédictions très certaines (ex: 100%) car il appliquait mathématiquement la fonction `Softmax` sur ses logits.
En revanche, les prédictions provenant du FPGA s'affichent souvent de manière plus "hésitante" ou plus étalée (ex: 66%, 9%, 5%). 
- *Explication* : Nous avons fait le choix de conserver la sortie native de l'accélérateur matériel (sans lui imposer un Softmax post-traitement logiciel). L'interface Gradio normalise simplement les logits bruts du FPGA de manière *linéaire*. Bien que les logits sous-jacents soient identiques, cet affichage brut reflète mieux l'impact réel et brut du bruit de quantification matériel W4A8.



Emplacement des executable:

https://github.com/pbatard/libwdi/releases/download/v1.5.1/zadig-2.9.exe
https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2026-08-30/oss-cad-suite-windows-x64-20260830.tgz