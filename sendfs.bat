@echo off
set OSS_CAD=%~dp0info\oss-cad-suite
set PATH=%OSS_CAD%\bin;%OSS_CAD%\lib;%PATH%

echo ==============================================
echo   Flashage du Bitstream sur le Tang Primer 20K
echo ==============================================

if not exist "top.fs" (
    echo ERREUR: Le fichier top.fs n'existe pas. Veuillez executer build_fpga.bat d'abord.
    pause
    exit /b 1
)

openFPGALoader -b tangprimer20k top.fs
if %errorlevel% neq 0 (
    echo.
    echo ERREUR: Echec du flashage. Verifiez que la carte est bien branchee et que les drivers sont installes via Zadig (WinUSB).
    pause
    exit /b %errorlevel%
)

echo.
echo Flashage reussi !
pause
