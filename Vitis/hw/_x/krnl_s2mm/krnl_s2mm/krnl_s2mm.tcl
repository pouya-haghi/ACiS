catch {::common::set_param -quiet hls.xocc.mode csynth};
# 
# HLS run script generated by v++ compiler
# 

open_project krnl_s2mm
set_top krnl_s2mm
add_files "/home/Will/Documents/Research-Files/G-FPin_HW/Vitis/hw/src/krnl_s2mm.cpp" -cflags " "
open_solution -flow_target vitis solution
set_part xcu280-fsvh2892-2L-e
create_clock -period 300.000000MHz -name default
# v++ --advanced.param compiler.hlsDataflowStrictMode
config_dataflow -strict_mode warning
# v++ --advanced.param compiler.deadlockDetection
config_export -deadlock_detection none
# v++ --advanced.param compiler.axiDeadLockFree
config_interface -m_axi_conservative_mode=1
config_interface -m_axi_addr64
# v++ --hls.max_memory_ports
config_interface -m_axi_auto_max_ports=0
config_export -format xo -ipname krnl_s2mm
csynth_design
export_design
close_project
puts "HLS completed successfully"
exit
