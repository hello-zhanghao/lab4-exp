@echo off
set xv_path=D:\\Vivado\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto 47680975e2f5479293185341900b9f6d -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot lab4_sim_behav xil_defaultlib.lab4_sim xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
