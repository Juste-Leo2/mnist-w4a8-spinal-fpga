@echo off
echo ==============================================
echo   Launching MNIST W4A8 Interface
echo ==============================================

echo [1/3] Checking and installing 'uv'...
where uv > nul 2>&1
if %errorlevel% == 0 (
    echo    [OK] uv is already installed.
) else (
    echo    uv not found, starting installation...
    powershell -ExecutionPolicy ByPass -Command "irm https://astral.sh/uv/install.ps1 | iex"
    if %errorlevel% neq 0 (
        echo ERROR: Could not install uv. Check your internet connection or PowerShell permissions.
        goto:error
    )
    
    where uv > nul 2>&1
    if %errorlevel% neq 0 (
        echo ERROR: uv was installed but is not accessible. You might need to restart your terminal.
        goto:error
    )
    echo    [OK] uv installed successfully.
)

echo [2/3] Installing dependencies (Gradio, numpy, pillow, pyserial, torch, torchvision)...
if exist ".venv" (
    echo    [OK] .venv already exists, skipping installation.
) else (
    uv venv -p 3.11
    uv pip install gradio numpy Pillow pyserial torch torchvision
    if %errorlevel% neq 0 (
        echo ERROR: Failed to install Python dependencies.
        goto:error
    )
)

echo [3/3] Launching web application...
echo (The interface will be available at http://127.0.0.1:7860 in a few seconds)
set PYTHONUNBUFFERED=1
uv run app.py
pause
exit /b 0

:error
echo.
echo An error occurred during script execution.
pause
exit /b 1

