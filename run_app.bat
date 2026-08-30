@echo off
echo ==============================================
echo   Lancement de l'interface MNIST W4A8
echo ==============================================

echo [1/3] Verification et installation de 'uv'...
where uv > nul 2>&1
if %errorlevel% == 0 (
    echo    [OK] uv est deja installe.
) else (
    echo    uv non trouve, lancement de l'installation...
    powershell -ExecutionPolicy ByPass -Command "irm https://astral.sh/uv/install.ps1 | iex"
    if %errorlevel% neq 0 (
        echo ERREUR: Impossible d'installer uv. Verifiez votre connexion ou vos permissions PowerShell.
        goto:error
    )
    
    where uv > nul 2>&1
    if %errorlevel% neq 0 (
        echo ERREUR: uv a ete installe mais n'est pas accessible. Vous devez peut-etre redemarrer votre terminal.
        goto:error
    )
    echo    [OK] uv installe avec succes.
)

echo [2/3] Installation des dependances (Gradio, numpy, pillow, pyserial, torch, torchvision)...
uv venv -p 3.11
uv pip install gradio numpy Pillow pyserial torch torchvision
if %errorlevel% neq 0 (
    echo ERREUR: Echec de l'installation des dependances Python.
    goto:error
)

echo [3/3] Lancement de l'application web...
echo (L'interface sera disponible sur http://127.0.0.1:7860 dans quelques secondes)
set PYTHONUNBUFFERED=1
uv run app.py
pause
exit /b 0

:error
echo.
echo Une erreur est survenue lors de l'execution du script.
pause
exit /b 1

