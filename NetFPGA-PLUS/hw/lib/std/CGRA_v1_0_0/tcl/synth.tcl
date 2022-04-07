# Vivado Launch Script
#### Change design settings here #######
set design CGRA
set top top
set device $::env(DEVICE)
set proj_dir ../synth
set ip_version 1.00
set lib_name NetFPGA
#####################################
# set IP paths
#####################################

#####################################
# Project Settings
#####################################
create_project -name ${design} -force -dir "./${proj_dir}" -part ${device} -ip
set_property source_mgmt_mode All [current_project]  
set_property top ${top} [current_fileset]
set_property ip_repo_paths $::env(NFPLUS_FOLDER)/hw/lib/  [current_fileset]
puts "Creating CGRA"
# Project Constraints
#####################################
# Project Structure & IP Build
#####################################

read_verilog -sv "hdl/adder_int.sv"
read_verilog -sv "hdl/config_table.sv"
read_verilog -sv "hdl/control_plane.sv"
read_verilog -sv "hdl/counter.sv"
read_verilog -sv "hdl/counter_trigger.sv"
read_verilog -sv "hdl/data_path.sv"
read_verilog -sv "hdl/floating_accumulator.sv"
read_verilog -sv "hdl/FSM.sv"
read_verilog -sv "hdl/inbound_buffer.sv"
read_verilog -sv "hdl/mux4.sv"
read_verilog -sv "hdl/PE_typeA.sv"
read_verilog -sv "hdl/PE_typeB.sv"
read_verilog -sv "hdl/PE_typeC.sv"
read_verilog -sv "hdl/PE_typeD.sv"
read_verilog -sv "hdl/Reduction_unit_float.sv"
read_verilog -sv "hdl/Reduction_unit_int.sv"
read_verilog -sv "hdl/regFile.sv"
read_verilog -sv "hdl/register_pipe.sv"
read_verilog -sv "hdl/reg_r.sv"
read_verilog -sv "hdl/runtimeLoadtable.sv"
read_verilog -sv "hdl/state_table.sv"
read_verilog -sv "hdl/top.sv"
read_verilog  "hdl/my_interface.vh"


update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
ipx::package_project

set_property name ${design} [ipx::current_core]
set_property library ${lib_name} [ipx::current_core]
set_property vendor_display_name {NetFPGA} [ipx::current_core]
set_property company_url {http://www.netfpga.org} [ipx::current_core]
set_property vendor {NetFPGA} [ipx::current_core]
set_property supported_families {{virtexuplus} {Production} {virtexuplushbm} {Production}} [ipx::current_core]
set_property taxonomy {{/NetFPGA/Generic}} [ipx::current_core]
set_property version ${ip_version} [ipx::current_core]
set_property display_name ${design} [ipx::current_core]
set_property description ${design} [ipx::current_core]

create_ip -name c_addsub -vendor xilinx.com -library ip -version 12.0 -module_name c_addsub_1
set_property -dict [list CONFIG.A_Width {64} CONFIG.B_Width {64} CONFIG.Add_Mode {Add_Subtract} CONFIG.Latency_Configuration {Manual} CONFIG.CE {false} CONFIG.SCLR {true} CONFIG.Out_Width {64} CONFIG.Latency {6} CONFIG.B_Value {0000000000000000000000000000000000000000000000000000000000000000}] [get_ips c_addsub_1]
generate_target {instantiation_template} [get_files ../ip/c_addsub_1.xci]
update_compile_order -fileset sources_1
generate_target all [get_files  ../ip/c_addsub_1.xci]
catch { config_ip_cache -export [get_ips -all c_addsub_1] }
export_ip_user_files -of_objects [get_files ../ip/c_addsub_1.xci] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] ../ip/c_addsub_1.xci]

create_ip -name mult_gen -vendor xilinx.com -library ip -version 12.0 -module_name mult_int_0
set_property -dict [list CONFIG.PortAWidth {32} CONFIG.PortBWidth {32} CONFIG.OutputWidthHigh {63} CONFIG.PipeStages {6} CONFIG.SyncClear {true}] [get_ips mult_int_0]
generate_target {instantiation_template} [get_files ../ip/mult_int_0.xci]
update_compile_order -fileset sources_1
generate_target all [get_files  ../ip/mult_int_0.xci]
catch { config_ip_cache -export [get_ips -all mult_int_0] }
export_ip_user_files -of_objects [get_files ../ip/mult_int_0.xci] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] ../ip/mult_int_0.xci]
#launch_runs -jobs 32 mult_int_0_synth_1

create_ip -name floating_point -vendor xilinx.com -library ip -version 7.1 -module_name floating_point_1
set_property -dict [list CONFIG.Operation_Type {Fixed_to_float} CONFIG.A_Precision_Type {Uint64} CONFIG.Result_Precision_Type {Double} CONFIG.Flow_Control {NonBlocking} CONFIG.Maximum_Latency {false} CONFIG.C_Latency {4} CONFIG.Has_ARESETn {true} CONFIG.C_A_Exponent_Width {64} CONFIG.C_A_Fraction_Width {0} CONFIG.C_Result_Exponent_Width {11} CONFIG.C_Result_Fraction_Width {53} CONFIG.C_Accum_Msb {32} CONFIG.C_Accum_Lsb {-31} CONFIG.C_Accum_Input_Msb {32} CONFIG.C_Mult_Usage {No_Usage} CONFIG.Has_RESULT_TREADY {false} CONFIG.C_Rate {1}] [get_ips floating_point_1]
generate_target {instantiation_template} [get_files ../ip/floating_point_1.xci]
update_compile_order -fileset sources_1
generate_target all [get_files  ../ip/floating_point_1.xci]
catch { config_ip_cache -export [get_ips -all floating_point_1] }
export_ip_user_files -of_objects [get_files ../ip/floating_point_1.xci] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] ../ip/floating_point_1.xci]

create_ip -name floating_point -vendor xilinx.com -library ip -version 7.1 -module_name floating_point_0
set_property -dict [list CONFIG.A_Precision_Type {Double} CONFIG.Flow_Control {NonBlocking} CONFIG.Maximum_Latency {false} CONFIG.C_Latency {12} CONFIG.Has_ARESETn {true} CONFIG.C_A_Exponent_Width {11} CONFIG.C_A_Fraction_Width {53} CONFIG.Result_Precision_Type {Double} CONFIG.C_Result_Exponent_Width {11} CONFIG.C_Result_Fraction_Width {53} CONFIG.C_Accum_Msb {32} CONFIG.C_Accum_Lsb {-31} CONFIG.C_Accum_Input_Msb {32} CONFIG.C_Mult_Usage {Full_Usage} CONFIG.Has_RESULT_TREADY {false} CONFIG.C_Rate {1}] [get_ips floating_point_0]
generate_target {instantiation_template} [get_files ../ip/floating_point_0.xci]
update_compile_order -fileset sources_1
generate_target all [get_files  ../ip/floating_point_0.xci]
catch { config_ip_cache -export [get_ips -all floating_point_0] }
export_ip_user_files -of_objects [get_files ../ip/floating_point_0.xci] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] ../ip/floating_point_0.xci]
# launch_runs -jobs 32 floating_point_0_synth_1

create_ip -name floating_point -vendor xilinx.com -library ip -version 7.1 -module_name floating_point_mul
set_property -dict [list CONFIG.Operation_Type {Multiply} CONFIG.A_Precision_Type {Double} CONFIG.Flow_Control {NonBlocking} CONFIG.Has_ARESETn {true} CONFIG.C_A_Exponent_Width {11} CONFIG.C_A_Fraction_Width {53} CONFIG.Result_Precision_Type {Double} CONFIG.C_Result_Exponent_Width {11} CONFIG.C_Result_Fraction_Width {53} CONFIG.C_Accum_Msb {32} CONFIG.C_Accum_Lsb {-31} CONFIG.C_Accum_Input_Msb {32} CONFIG.C_Mult_Usage {Full_Usage} CONFIG.Has_RESULT_TREADY {false} CONFIG.C_Latency {12} CONFIG.C_Rate {1}] [get_ips floating_point_mul]
generate_target {instantiation_template} [get_files ../ip/floating_point_mul.xci]
update_compile_order -fileset sources_1
generate_target all [get_files  ../ip/floating_point_mul.xci]
catch { config_ip_cache -export [get_ips -all floating_point_mul] }
export_ip_user_files -of_objects [get_files ../ip/floating_point_mul.xci] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] ../ip/floating_point_mul.xci]

create_ip -name floating_point -vendor xilinx.com -library ip -version 7.1 -module_name floating_point_accumulator
set_property -dict [list CONFIG.Operation_Type {Accumulator} CONFIG.Add_Sub_Value {Add} CONFIG.A_Precision_Type {Double} CONFIG.Flow_Control {NonBlocking} CONFIG.Maximum_Latency {false} CONFIG.C_Latency {12} CONFIG.Has_ARESETn {true} CONFIG.C_A_Exponent_Width {11} CONFIG.C_A_Fraction_Width {53} CONFIG.Result_Precision_Type {Double} CONFIG.C_Result_Exponent_Width {11} CONFIG.C_Result_Fraction_Width {53} CONFIG.C_Accum_Msb {32} CONFIG.C_Accum_Lsb {-31} CONFIG.C_Accum_Input_Msb {32} CONFIG.C_Mult_Usage {Medium_Usage} CONFIG.Has_RESULT_TREADY {false} CONFIG.C_Rate {1} CONFIG.Has_A_TLAST {true} CONFIG.RESULT_TLAST_Behv {Pass_A_TLAST}] [get_ips floating_point_accumulator]
generate_target {instantiation_template} [get_files ../ip/floating_point_accumulator.xci]
generate_target all [get_files  ../ip/floating_point_accumulator.xci]
catch { config_ip_cache -export [get_ips -all floating_point_accumulator] }
export_ip_user_files -of_objects [get_files ../ip/floating_point_accumulator.xci] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] ../ip/floating_point_accumulator.xci]

create_ip -name floating_point -vendor xilinx.com -library ip -version 7.1 -module_name floating_point_div
set_property -dict [list CONFIG.Operation_Type {Divide} CONFIG.A_Precision_Type {Double} CONFIG.Flow_Control {NonBlocking} CONFIG.Maximum_Latency {false} CONFIG.Has_ARESETn {true} CONFIG.C_A_Exponent_Width {11} CONFIG.C_A_Fraction_Width {53} CONFIG.Result_Precision_Type {Double} CONFIG.C_Result_Exponent_Width {11} CONFIG.C_Result_Fraction_Width {53} CONFIG.C_Accum_Msb {32} CONFIG.C_Accum_Lsb {-31} CONFIG.C_Accum_Input_Msb {32} CONFIG.C_Mult_Usage {No_Usage} CONFIG.Has_RESULT_TREADY {false} CONFIG.C_Latency {57} CONFIG.C_Rate {1}] [get_ips floating_point_div]
generate_target {instantiation_template} [get_files ../ip/floating_point_div.xci]
generate_target all [get_files  ../ip/floating_point_div.xci]
catch { config_ip_cache -export [get_ips -all floating_point_div] }
export_ip_user_files -of_objects [get_files ../ip/floating_point_div.xci] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] ../ip/floating_point_div.xci]

create_ip -name floating_point -vendor xilinx.com -library ip -version 7.1 -module_name floating_point_sqrt
set_property -dict [list CONFIG.Operation_Type {Square_root} CONFIG.A_Precision_Type {Double} CONFIG.Flow_Control {NonBlocking} CONFIG.Maximum_Latency {false} CONFIG.Has_ARESETn {true} CONFIG.C_A_Exponent_Width {11} CONFIG.C_A_Fraction_Width {53} CONFIG.Result_Precision_Type {Double} CONFIG.C_Result_Exponent_Width {11} CONFIG.C_Result_Fraction_Width {53} CONFIG.C_Accum_Msb {32} CONFIG.C_Accum_Lsb {-31} CONFIG.C_Accum_Input_Msb {32} CONFIG.C_Mult_Usage {No_Usage} CONFIG.Has_RESULT_TREADY {false} CONFIG.C_Latency {57} CONFIG.C_Rate {1}] [get_ips floating_point_sqrt]
generate_target {instantiation_template} [get_files ../ip/floating_point_sqrt.xci]
generate_target all [get_files  ../ip/floating_point_sqrt.xci]
catch { config_ip_cache -export [get_ips -all floating_point_sqrt] }
export_ip_user_files -of_objects [get_files ../ip/floating_point_sqrt.xci] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] ../ip/floating_point_sqrt.xci]


#ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces m_axis -of_objects [ipx::current_core]]
#ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces s_axis -of_objects [ipx::current_core]]

ipx::infer_user_parameters [ipx::current_core]

ipx::check_integrity [ipx::current_core]
ipx::save_core [ipx::current_core]
update_ip_catalog
close_project

file delete -force ${proj_dir} 