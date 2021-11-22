parameter dwidth_double = 64;
parameter depth_RF = 4096;
parameter dwidth_RFadd = $clog2(depth_RF);
parameter SIMD_degree = 8;
parameter phit_size = 512;
parameter num_col = 6;

interface data_channel;
logic [dwidth_double-1:0] inp1, inp2, out1;
endinterface

interface control_channel;
logic [1:0] op;
endinterface
