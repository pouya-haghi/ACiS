`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module test_PE_typeA(

    );
    reg [63:0] inp1, inp2;
    reg clk, rst;
    reg [1:0] op;
    wire [63:0] out1;
    
    PE_typeA PEtypeA_inst0 (.*);
    
     
 always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end
    
  initial begin
    inp1 = 0; //dont care
    inp2 = 0;
    op = 0; //dont care
    rst = 0;
    
    #40; 
    inp1 = 64'd3;
    inp2 = 64'd2;
    
    #1000;
    $finish;
    
 end
    
endmodule
