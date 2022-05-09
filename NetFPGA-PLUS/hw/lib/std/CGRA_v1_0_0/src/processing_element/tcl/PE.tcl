if {[file isdirectory ../"ip_proj"]}{
    read_ip ./src/processing_element/ip_proj/test_PE.srcs/sources_1/ip/floating_point_acc/floating_point_acc.xci
}
else {
    create_ip -name floating_point -vendor xilinx.com -library ip -version 7.1 -module_name floating_point_acc
    set_property -dict [list CONFIG.Component_Name {floating_point_acc} CONFIG.Operation_Type {Accumulator} CONFIG.Add_Sub_Value {Add} CONFIG.Flow_Control {NonBlocking} CONFIG.Maximum_Latency {false} CONFIG.C_Latency {8} CONFIG.Has_ARESETn {true} CONFIG.A_Precision_Type {Single} CONFIG.C_A_Exponent_Width {8} CONFIG.C_A_Fraction_Width {24} CONFIG.Result_Precision_Type {Single} CONFIG.C_Result_Exponent_Width {8} CONFIG.C_Result_Fraction_Width {24} CONFIG.C_Mult_Usage {Medium_Usage} CONFIG.Has_RESULT_TREADY {false} CONFIG.C_Rate {1} CONFIG.Has_A_TLAST {true} CONFIG.RESULT_TLAST_Behv {Pass_A_TLAST}] [get_ips floating_point_acc]
    create_ip -name floating_point -vendor xilinx.com -library ip -version 7.1 -module_name floating_point_add
    set_property -dict [list CONFIG.Component_Name {floating_point_add} CONFIG.Flow_Control {NonBlocking} CONFIG.Maximum_Latency {false} CONFIG.C_Latency {8} CONFIG.Has_ARESETn {true} CONFIG.Has_RESULT_TREADY {false}] [get_ips floating_point_add]
    create_ip -name floating_point -vendor xilinx.com -library ip -version 7.1 -module_name floating_point_multiplier
    set_property -dict [list CONFIG.Component_Name {floating_point_multiplier} CONFIG.Operation_Type {Multiply} CONFIG.Flow_Control {NonBlocking} CONFIG.Has_ARESETn {true} CONFIG.A_Precision_Type {Single} CONFIG.C_A_Exponent_Width {8} CONFIG.C_A_Fraction_Width {24} CONFIG.Result_Precision_Type {Single} CONFIG.C_Result_Exponent_Width {8} CONFIG.C_Result_Fraction_Width {24} CONFIG.C_Mult_Usage {Full_Usage} CONFIG.Has_RESULT_TREADY {false} CONFIG.C_Latency {8} CONFIG.C_Rate {1}] [get_ips floating_point_multiplier]
}
