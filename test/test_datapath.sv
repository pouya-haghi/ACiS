`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module test_datapath;
    
 reg [phit_size-1:0] inbound;                     
 reg [phit_size-1:0] stream_in;                   
 reg [(2*phit_size)-1:0] itr;                     
 reg [((num_col-1)*phit_size)-1:0] imm;           
 reg [((num_col-1)*4)-1:0] sel_mux4;              
 reg [((num_col-1)*2)-1:0] op;                    
 reg [num_col-1:0] wen_RF;                        
 reg [(dwidth_RFadd*(num_col-1))-1:0] rd_addr_RF; 
 reg [(dwidth_RFadd*(num_col-1))-1:0] wr_addr_RF; 
 reg clk;    
 reg rst;                                     
 wire [phit_size-1:0] stream_out;     
 wire [phit_size-1:0] stream_out_PEa0;   
 wire [phit_size-1:0] stream_out_PEa1;
 wire [phit_size-1:0] stream_out_PEb;
 wire [phit_size-1:0] stream_out_PEc0;
 wire [phit_size-1:0] stream_out_PEc1;
 
           
 
 data_path data_path_inst1 (.*);
 
 always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end
    
 initial begin
    inbound = 0; //dont care
    stream_in = 0;
    imm = 0; //dont care
    itr = 0; //dont care
    wen_RF = 0; //dont care
    rd_addr_RF = 0; // dont care
    wr_addr_RF = 0; //dont care 
    sel_mux4 = 0;
    op = 0;
    rst = 0;
    
    #40; 
    stream_in = 512'd3;
    
    sel_mux4 = {2'b00, 2'b00, // typeD //mux1, mux0
    2'b00, 2'b10, //typeC1 //mux1, mux0
    2'b00, 2'b10, //typeC0 //mux1, mux0
    2'b00, 2'b10, //typeA1 //mux1, mux0
    2'b00, 2'b10}; //typeA0 //mux1, mux0
   
    op = {2'b00, //typeD //div
    2'b00, // typeC1 //add 
    2'b00, // typeC0 //add
    2'b00, // typeA1 //add 
    2'b00}; // typeA0, add
    
    imm = {512'd2, //PE_typeD
    512'h4008000000000000, //PE_typeC1 //= 3 in decimal
    512'd0, // PE_typeC0
    512'd0, //PE_typeA1
    512'd1}; // PE_typeA0
    
    #2000;
    $finish;
    
 end
    wire [dwidth_double-1:0] stream_out_PEa0_word, stream_out_PEa1_word, stream_out_PEb_word;
    wire [dwidth_double-1:0] stream_out_PEc0_word, stream_out_PEc1_word, stream_out_word;
    assign stream_out_PEa0_word = stream_out_PEa0[dwidth_double-1:0];
    assign stream_out_PEa1_word = stream_out_PEa1[dwidth_double-1:0];
    assign stream_out_PEb_word = stream_out_PEb[dwidth_double-1:0];
    assign stream_out_PEc0_word = stream_out_PEc0[dwidth_double-1:0];
    assign stream_out_PEc1_word = stream_out_PEc1[dwidth_double-1:0];
    assign stream_out_word = stream_out[dwidth_double-1:0];
    
endmodule
