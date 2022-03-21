# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "MAX_PKT_LEN" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MIN_PKT_LEN" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NUM_CMAC_PORT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NUM_PHYS_FUNC" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NUM_QUEUE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "USE_PHYS_FUNC" -parent ${Page_0}


}

proc update_PARAM_VALUE.MAX_PKT_LEN { PARAM_VALUE.MAX_PKT_LEN } {
	# Procedure called to update MAX_PKT_LEN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_PKT_LEN { PARAM_VALUE.MAX_PKT_LEN } {
	# Procedure called to validate MAX_PKT_LEN
	return true
}

proc update_PARAM_VALUE.MIN_PKT_LEN { PARAM_VALUE.MIN_PKT_LEN } {
	# Procedure called to update MIN_PKT_LEN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MIN_PKT_LEN { PARAM_VALUE.MIN_PKT_LEN } {
	# Procedure called to validate MIN_PKT_LEN
	return true
}

proc update_PARAM_VALUE.NUM_CMAC_PORT { PARAM_VALUE.NUM_CMAC_PORT } {
	# Procedure called to update NUM_CMAC_PORT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_CMAC_PORT { PARAM_VALUE.NUM_CMAC_PORT } {
	# Procedure called to validate NUM_CMAC_PORT
	return true
}

proc update_PARAM_VALUE.NUM_PHYS_FUNC { PARAM_VALUE.NUM_PHYS_FUNC } {
	# Procedure called to update NUM_PHYS_FUNC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_PHYS_FUNC { PARAM_VALUE.NUM_PHYS_FUNC } {
	# Procedure called to validate NUM_PHYS_FUNC
	return true
}

proc update_PARAM_VALUE.NUM_QUEUE { PARAM_VALUE.NUM_QUEUE } {
	# Procedure called to update NUM_QUEUE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_QUEUE { PARAM_VALUE.NUM_QUEUE } {
	# Procedure called to validate NUM_QUEUE
	return true
}

proc update_PARAM_VALUE.USE_PHYS_FUNC { PARAM_VALUE.USE_PHYS_FUNC } {
	# Procedure called to update USE_PHYS_FUNC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.USE_PHYS_FUNC { PARAM_VALUE.USE_PHYS_FUNC } {
	# Procedure called to validate USE_PHYS_FUNC
	return true
}


proc update_MODELPARAM_VALUE.MAX_PKT_LEN { MODELPARAM_VALUE.MAX_PKT_LEN PARAM_VALUE.MAX_PKT_LEN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_PKT_LEN}] ${MODELPARAM_VALUE.MAX_PKT_LEN}
}

proc update_MODELPARAM_VALUE.MIN_PKT_LEN { MODELPARAM_VALUE.MIN_PKT_LEN PARAM_VALUE.MIN_PKT_LEN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MIN_PKT_LEN}] ${MODELPARAM_VALUE.MIN_PKT_LEN}
}

proc update_MODELPARAM_VALUE.USE_PHYS_FUNC { MODELPARAM_VALUE.USE_PHYS_FUNC PARAM_VALUE.USE_PHYS_FUNC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.USE_PHYS_FUNC}] ${MODELPARAM_VALUE.USE_PHYS_FUNC}
}

proc update_MODELPARAM_VALUE.NUM_PHYS_FUNC { MODELPARAM_VALUE.NUM_PHYS_FUNC PARAM_VALUE.NUM_PHYS_FUNC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_PHYS_FUNC}] ${MODELPARAM_VALUE.NUM_PHYS_FUNC}
}

proc update_MODELPARAM_VALUE.NUM_QUEUE { MODELPARAM_VALUE.NUM_QUEUE PARAM_VALUE.NUM_QUEUE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_QUEUE}] ${MODELPARAM_VALUE.NUM_QUEUE}
}

proc update_MODELPARAM_VALUE.NUM_CMAC_PORT { MODELPARAM_VALUE.NUM_CMAC_PORT PARAM_VALUE.NUM_CMAC_PORT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_CMAC_PORT}] ${MODELPARAM_VALUE.NUM_CMAC_PORT}
}

