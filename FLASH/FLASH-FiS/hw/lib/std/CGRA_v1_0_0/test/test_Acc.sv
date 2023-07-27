`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2021 02:58:07 PM
// Design Name: 
// Module Name: test_addsub_int
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


module test_Acc(

    );
    reg clk, a_tvalid, a_tlast;
    reg [63:0] a;
    wire out1_tvalid, out1_tlast;
    wire [63:0] out1;
    
    floating_accumulator fpacc_inst0 (.*);
    
     
 always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end
    
  initial begin
    a_tvalid = 1; //dont care
    a_tlast = 0;
    a = 64'h4010000000000000; //dont care
    
    #40; 

    
    #1000;
    $finish;
    
 end
    
endmodule
