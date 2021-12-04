`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2021 07:17:05 PM
// Design Name: 
// Module Name: test_datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
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
 wire [phit_size-1:0] stream_out;     
// wire [phit_size-1:0] stream_out_PEc;   
// wire [phit_size-1:0] stream_out_PEa;
           
 
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
    
    #40; 
    stream_in = 3;
    sel_mux4 = {2'b00, 2'b10, 2'b00, 2'b10, 2'b00, 2'b10, 2'b00, 2'b10};
    op = {2'b00, 2'b00, 2'b00, 2'b00, 2'b00}; //add, add, add, add, div
    imm = {512'd2, 512'd3, 512'd0, 512'd0, 512'd1};
    
 end
    wire [dwidth_double-1:0] stream_out_PE0;
    assign stream_out_PE0 = stream_out[dwidth_double-1:0];
endmodule
