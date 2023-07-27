create_ip -name floating_point -vendor xilinx.com -library ip -version 7.1 -module_name nf_floating_point_adder
set_property -dict [list CONFIG.Component_Name {nf_floating_point_adder} CONFIG.Flow_Control {Blocking} CONFIG.Maximum_Latency {false} CONFIG.C_Latency {6} CONFIG.Has_ARESETn {true} CONFIG.Has_A_TLAST {false} CONFIG.Has_B_TLAST {false} CONFIG.Has_RESULT_TREADY {true} CONFIG.RESULT_TLAST_Behv {Null}] [get_ips nf_floating_point_adder]
set_property generate_synth_checkpoint false [get_files nf_floating_point_adder.xci]
reset_target all [get_ips nf_floating_point_adder]
generate_target all [get_ips nf_floating_point_adder]
# generate_target {instantiation_template} [get_files /ad/eng/research/eng_research_caad/haghi/vivado_project/project_1/project_1.srcs/sources_1/ip/nf_floating_point_adder/nf_floating_point_adder.xci]
# update_compile_order -fileset sources_1
# generate_target all [get_files  /ad/eng/research/eng_research_caad/haghi/vivado_project/project_1/project_1.srcs/sources_1/ip/nf_floating_point_adder/nf_floating_point_adder.xci]
