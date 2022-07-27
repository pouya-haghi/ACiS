//parameter dwidth_double = 64;
parameter clk_pd = 4;
parameter delay_HBM = 6;
parameter depth_RF = 4096;
parameter depth_config = 64;//4096;
parameter dwidth_RFadd = $clog2(depth_RF);
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
parameter total_instr = num_col*depth_config;
parameter C_S_AXI_ADDR_WIDTH = 5;
parameter C_S_AXI_DATA_WIDTH = 32;
parameter C_M_AXI_ADDR_WIDTH = 64;
parameter packet_length = 64;
parameter header_bytes = 34;
parameter header_deg = $ceil((header_bytes*SIMD_degree*8)/phit_size);
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
