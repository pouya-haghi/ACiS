# Vivado Launch Script
#### Change design settings here #######
set design PE
set top PE_typeC
set device xcu280-fsvh2892-2L-e
set proj_dir ./ip_proj
#####################################
# set IP paths
#####################################

#####################################
# Project Settings
#####################################
create_project -name ${design} -force -dir "./${proj_dir}" -part ${device} -ip 
set_property top ${top} [current_fileset]
puts "Creating PE"
source tcl/PE.tcl
read_verilog -sv "PE_typeC.sv"

update_compile_order -fileset sources_1
generate_target all [get_ips]
synth_ip [get_ips]
close_project

# file delete -force ${proj_dir} 