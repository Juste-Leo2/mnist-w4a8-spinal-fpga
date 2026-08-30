@echo off
set OSS_CAD=%~dp0info\oss-cad-suite
set PATH=%OSS_CAD%\bin;%OSS_CAD%\lib;%PATH%
echo ==============================================
echo   Compilation du FPGA (Tang Primer 20K)
echo ==============================================

echo [1/3] Synthese Verilog...
yosys -p "read_verilog verilog/uart_rx.v verilog/uart_tx.v verilog/Mnist_w4a8.v verilog/top.v; synth_gowin -nodsp -top top -json top.json"
if %errorlevel% neq 0 exit /b %errorlevel%

echo [2/3] Placement et Routage (PNR)...
nextpnr-himbaechel --device GW2A-LV18PG256C8/I7 --vopt family=GW2A-18 --vopt cst=tangprimer20k.cst --json top.json --write top_pnr.json
if %errorlevel% neq 0 exit /b %errorlevel%

echo [3/3] Generation du Bitstream (.fs)...
gowin_pack -d GW2A-18 -o top.fs top_pnr.json
if %errorlevel% neq 0 exit /b %errorlevel%

echo ==============================================
echo Compilation terminee avec succes !
echo Le fichier "top.fs" a ete genere.
echo Pour flasher la carte, lancez :
echo openFPGALoader -b tangprimer20k top.fs
echo ==============================================
pause
