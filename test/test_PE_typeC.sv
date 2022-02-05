`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module test_PE_typeC(

    );
    reg [63:0] inp1, inp2;
    reg clk;
    reg [1:0] op;
    wire [63:0] out1;
    
    PE_typeC #(latencyPEB) PEtypeC_inst0 (.*);
    
     
 always begin
        clk = 1;
        #10;
        clk = 0;
        #10;
    end
    
  initial begin
    inp1 = 0; //dont care
    inp2 = 0;
    op= 2'b10; // This is mul
//    op = 2'b01; //this is acc
//    rst = 0;
    
//    #40; 
//    inp1 = 64'h4020000000000000;
//    inp2 = 64'h4010000000000000;
    
//    #40;
//    inp1 = 64'h4000000000000000;
//    inp2 = 64'h4000000000000000;   
    
    #40;
    inp1 = 64'h4000000000000000;
    inp2 = 64'h3ff0000000000000;  
    
    #320;
    inp1 = 64'h8000000000000000;
    inp2 = 64'h8000000000000000;      
    
    #1000;
    $finish;
    // expected output 404000...
    //verified that if a number is added with zero is the same number
 end
    
endmodule
