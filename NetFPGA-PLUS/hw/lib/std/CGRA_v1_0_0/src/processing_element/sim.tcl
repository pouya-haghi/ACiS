set design test_PE
set top test_PE_typeC
set device xcu280-fsvh2892-2L-e
set proj_dir ./ip_proj

create_project -name ${design} -force -dir "./${proj_dir}" -part ${device} 
source tcl/PE.tcl
add_files -fileset sources_1 {  \
        PE_typeC.sv          \
        test_PE_typeC.sv     \
}

set_property file_type {SystemVerilog} [get_files *.sv]

update_compile_order -fileset sources_1
set_property top ${top} [get_fileset sim_1]

launch_simulation

# add_wave {{/test_PE_acc/aclk}} {{/test_PE_acc/aresetn}} {{/test_PE_acc/s_axis_a_tvalid}} {{/test_PE_acc/s_axis_a_tlast}} {{/test_PE_acc/s_axis_a_tdata}} {{/test_PE_acc/m_axis_result_tvalid}} {{/test_PE_acc/m_axis_result_tlast}} {{/test_PE_acc/m_axis_result_tdata}} 
run all 
add_wave
# # close_project
# import_ip ./src/processing_element/ip_proj/PE.srcs/sources_1/ip/floating_point_MAC/floating_point_MAC.xci
# create_ip -name floating_point -vendor xilinx.com -library ip -version 7.1 -module_name floating_point_acc
# set_property -dict [list CONFIG.Component_Name {floating_point_acc} CONFIG.Operation_Type {Accumulator} CONFIG.Add_Sub_Value {Add} CONFIG.Flow_Control {NonBlocking} CONFIG.Maximum_Latency {false} CONFIG.C_Latency {12} CONFIG.Has_ARESETn {true} CONFIG.A_Precision_Type {Single} CONFIG.C_A_Exponent_Width {8} CONFIG.C_A_Fraction_Width {24} CONFIG.Result_Precision_Type {Single} CONFIG.C_Result_Exponent_Width {8} CONFIG.C_Result_Fraction_Width {24} CONFIG.C_Mult_Usage {Medium_Usage} CONFIG.Has_RESULT_TREADY {false} CONFIG.C_Rate {1} CONFIG.Has_A_TLAST {true} CONFIG.RESULT_TLAST_Behv {Pass_A_TLAST}] [get_ips floating_point_acc]

# source tcl/PE.tcl
# xvlog PE_typeC.sv
# xvlog test_PE_typeC.sv
# xvlog $XILINX_VIVADO/data/verilog/src/glbl.v
# xelab -debug typical -L secureip -L unisims_ver test_PE_typeC glbl -s PE_typeC
# xsim PE_typeC -gui