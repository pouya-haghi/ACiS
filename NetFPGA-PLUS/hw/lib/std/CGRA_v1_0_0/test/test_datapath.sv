`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module test_datapath;
    
// reg [phit_size-1:0] inbound;                     
    reg clk;
    reg rst;
    reg done_loader;
    reg [(dwidth_inst*num_col)-1:0] instr;
    wire [num_col-1:0] clken_PC;
    wire [num_col-1:0] load_PC;
    wire [num_col-1:0] incr_PC;
    wire [(num_col*12)-1:0] load_value_PC;
    reg [dwidth_int-1:0] cycle_register;
    // stream
    reg [phit_size-1:0] tdata_stream_in;
    reg [SIMD_degree-1:0] tvalid_stream_in;
    wire [SIMD_degree-1:0] tready_stream_in;
    wire [phit_size-1:0] tdata_stream_out;
    wire [SIMD_degree-1:0] tvalid_stream_out;
    reg [SIMD_degree-1:0] tready_stream_out;
    // AXI read
    wire [(dwidth_aximm*num_col)-1:0] araddr_HBM;
    reg [num_col-1:0] arready_HBM;
    reg [num_col-1:0] rvalid_HBM;
    reg [(phit_size*num_col)-1:0] rdata_HBM;
    wire [num_col-1:0] rready_HBM;
    wire [num_col-1:0] arvalid_HBM;
    wire [(8*num_col)-1:0] arlen_HBM;
    reg [num_col-1:0] rlast_HBM;
    // AXI write
    wire [num_col-1:0] wvalid_HBM;
    reg [num_col-1:0] wready_HBM;
    wire [num_col-1:0] awvalid_HBM;
    wire [(num_col*8)-1:0] awlen_HBM;
    wire [(num_col*phit_size)-1:0] wdata_HBM;
    wire [(num_col*(phit_size/8))-1:0] wstrb_HBM;
    wire [num_col-1:0] wlast_HBM;
    reg [num_col-1:0] bvalid_HBM;
    wire [num_col-1:0] bready_HBM;
    wire [(dwidth_aximm*num_col)-1:0] awaddr_HBM;
    reg [num_col-1:0] awready_HBM;

           
 data_path data_path_inst1 (.*);
 
 always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end
    
 initial begin
//    inbound = 0; //dont care
    done_loader = 1;
    cycle_register <= 32'b0;
    instr <= 0;
    rst = 0;
    
    tdata_stream_in = 512'd3;
    tvalid_stream_in <= {(SIMD_degree){1'b0}};
    tready_stream_out <= {(SIMD_degree){1'b1}};
    //
    arready_HBM <= {(num_col){1'b1}};
    rvalid_HBM <= {(num_col){1'b0}};
    rdata_HBM <= 512'd4;
    rlast_HBM <= {(num_col){1'b0}};  
    //
    wready_HBM <= {(num_col){1'b1}};
    bvalid_HBM <= {(num_col){1'b0}};
    awready_HBM <= {(num_col){1'b1}}; 
    
    #40;
    rst = 1;
    #80;
    rst = 0;
    #20;
    instr[dwidth_inst-1:0] = {14'b0, 3'b000, 3'h7, 5'b0, 7'h57}; // vsetivli x0, 0, e32, m2, 2048 
    instr[(2*dwidth_inst)-1:dwidth_inst] = {14'b0, 3'b000, 3'h7, 5'b0, 7'h57}; // vsetivli x0, 0, e32, m2, 2048 
    
    #10;
    instr[dwidth_inst-1:0] = {12'b0, 5'b00010 , 3'b0, 5'b0, 7'h07}; // vle32.vv v0, (x2)
    instr[(2*dwidth_inst)-1:dwidth_inst] = {12'b0, 5'b00010 , 3'b0, 5'b0, 7'h07}; // vle32.vv v0, (x2)
    // instr[6:0]==7'h07
    #2000;
    $finish;
    
 end

endmodule