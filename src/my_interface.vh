parameter dwidth_double = 64;
parameter depth_RF = 4096;
parameter dwidth_RFadd = $clog2(depth_RF);
parameter SIMD_degree = 8;
parameter phit_size = 512;
parameter num_col = 6;
parameter entry_sz_state = 47;
parameter dwidth_int = 32;
parameter max_depth_config_table = 256;
parameter dwidth_counter_config = $clog2(max_depth_config_table);
parameter latencyPEA = 6;
parameter latencyPEB = 4;
parameter latencyPEC = 12;
parameter latencyPED = 57;

interface data_channel;
logic [dwidth_double-1:0] inp1, inp2, out1;
endinterface

interface control_channel;
logic [1:0] op;
endinterface
