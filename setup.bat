@echo off
echo ==============================================
echo   Installing dependencies
echo ==============================================

if not exist "info" mkdir info

echo [1/3] Downloading Zadig...
curl -L -o info\zadig-2.9.exe https://github.com/pbatard/libwdi/releases/download/v1.5.1/zadig-2.9.exe

echo [2/3] Downloading OSS CAD Suite...
curl -L -o info\oss-cad-suite-windows-x64-20260830.tgz https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2026-08-30/oss-cad-suite-windows-x64-20260830.tgz

echo [3/3] Extracting OSS CAD Suite...
tar -xf info\oss-cad-suite-windows-x64-20260830.tgz -C info\

echo ==============================================
echo   Setup complete!
echo ==============================================
pause
