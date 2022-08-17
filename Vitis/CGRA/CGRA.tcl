Sourcing tcl script '/opt/Xilinx/Vitis2020.2/Vivado/2020.2/scripts/Vivado_init.tcl'

create_ip -name rtl_kernel_wizard -vendor xilinx.com -library ip -version 1.0 -module_name rtl_kernel_CGRA_accelerator

set_property -dict [list CONFIG.Component_Name {rtl_kernel_CGRA_accelerator} CONFIG.KERNEL_NAME {rtl_kernel_CGRA_accelerator} CONFIG.NUM_RESETS {1} CONFIG.NUM_INPUT_ARGS {0} CONFIG.NUM_M_AXI {3} CONFIG.NUM_AXIS {2}] [get_ips rtl_kernel_CGRA_accelerator]

generate_target {instantiation_template} [get_files /home/Will/Documents/Research-Files/NetFPGA_accelerator_kernels/vivado_rtl_kernel/vivado_rtl_kernel.srcs/sources_1/ip/rtl_kernel_CGRA_accelerator/rtl_kernel_CGRA_accelerator.xci]

set_property generate_synth_checkpoint false [get_files /home/Will/Documents/Research-Files/NetFPGA_accelerator_kernels/vivado_rtl_kernel/vivado_rtl_kernel.srcs/sources_1/ip/rtl_kernel_CGRA_accelerator/rtl_kernel_CGRA_accelerator.xci]

generate_target all [get_files /home/Will/Documents/Research-Files/NetFPGA_accelerator_kernels/vivado_rtl_kernel/vivado_rtl_kernel.srcs/sources_1/ip/rtl_kernel_CGRA_accelerator/rtl_kernel_CGRA_accelerator.xci]

export_ip_user_files -of_objects [get_files /home/Will/Documents/Research-Files/NetFPGA_accelerator_kernels/vivado_rtl_kernel/vivado_rtl_kernel.srcs/sources_1/ip/rtl_kernel_CGRA_accelerator/rtl_kernel_CGRA_accelerator.xci] -no_script -sync -force -quiet

