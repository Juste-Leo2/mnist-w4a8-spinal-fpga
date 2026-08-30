@echo off
set OSS_CAD=%~dp0info\oss-cad-suite
set PATH=%OSS_CAD%\bin;%OSS_CAD%\lib;%PATH%

echo ==============================================
echo   Flashing Bitstream to Tang Primer 20K
echo ==============================================

if not exist "top.fs" (
    echo ERROR: top.fs file does not exist. Please run build_fpga.bat first.
    pause
    exit /b 1
)

openFPGALoader -b tangprimer20k top.fs
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Flashing failed. Verify the board is plugged in and drivers are installed via Zadig (WinUSB).
    pause
    exit /b %errorlevel%
)

echo.
echo Flashing successful!
pause
