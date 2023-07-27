`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module test_PE_typeA(

    );
    reg [63:0] inp1, inp2;
    reg clk, rst;
    reg [1:0] op;
    reg t_valid_inp1, t_valid_inp2;
    wire t_valid_out1;
    wire [63:0] out1;
    
    PE_typeA #(latencyPEA) PEtypeA_inst0 (.*);
    
     
 always begin
        clk <= 1;
        #10;
        clk <= 0;
        #10;
    end
    
  initial begin
    inp1 <= 0; //dont care
    inp2 <= 0;
    op <= 0; //dont care
    rst <= 0;
    t_valid_inp1 <= 0;
    t_valid_inp2 <= 0;
    
    #40;
    rst<= 1;
    #60;
    rst<=0;
    
    #40; 
    t_valid_inp1 <= 1;
    t_valid_inp2 <= 1;
    inp1 <= 64'd3;
    inp2 <= 64'd2;
    #60;
    op <= 1;
//    t_valid_inp1 <= 0;
//    t_valid_inp2 <= 0;    
    
    #1000;
    $finish;
    
 end
    
endmodule
