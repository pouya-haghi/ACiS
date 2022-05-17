//parameter dwidth_double = 64;
parameter dwidth_float = 32;
parameter depth_RF = 4096;
parameter dwidth_RFadd = $clog2(depth_RF);
parameter dwidth_HBMadd = 32;
parameter SIMD_degree = 16;
parameter phit_size = 512;
parameter num_col = 6;
parameter dwidth_inst = 32;
parameter entry_sz_state = 48;
parameter sz_config = 36;
parameter dwidth_int = 32;
parameter max_depth_config_table = 256;
parameter dwidth_counter_config = $clog2(max_depth_config_table);
parameter latencyPEA = 6;
parameter latencyPEB = 4;
parameter latencyPEC = 8;
parameter latencyPED = 57;

//interface data_channel;
//logic [dwidth_double-1:0] inp1, inp2, out1;
//endinterface

//interface control_channel;
//logic [1:0] op;
//endinterface
