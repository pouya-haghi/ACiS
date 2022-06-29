//parameter dwidth_double = 64;
parameter clk_pd = 4;
parameter delay_HBM = 6;
parameter depth_RF = 4096;
parameter depth_config = 4096;
parameter dwidth_RFadd = $clog2(depth_RF);
parameter dwidth_HBMadd = 32;
parameter dwidth_aximm = 64;
parameter dwidth_int = 32;
parameter dwidth_configadd = $clog2(depth_config);
parameter dwidth_inst = 32;
parameter dwidth_float = 32;
parameter SIMD_degree = 16;
parameter phit_size = 512;
parameter num_col = 2; // up to 32
parameter entry_sz_state = 48;
parameter sz_config = 36;
parameter latencyPEA = 6;
parameter latencyPEB = 4;
parameter latencyPEC = 8;
parameter latencyPED = 57;
parameter total_instr = 1024;
parameter C_S_AXI_ADDR_WIDTH = 5;
parameter C_S_AXI_DATA_WIDTH = 32;

function integer f_max (
  input integer a,
  input integer b
);
  f_max = (a > b) ? a : b;
endfunction

function integer f_min (
  input integer a,
  input integer b
);
  f_min = (a < b) ? a : b;
endfunction

//interface data_channel;
//logic [dwidth_double-1:0] inp1, inp2, out1;
//endinterface

//interface control_channel;
//logic [1:0] op;
//endinterface
