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


module test_counter(

    );
    reg clk, rst;
    wire [3:0] counter;
//    wire out1_tvalid, out1_tlast;
//    wire [63:0] out1;
    
    counter #(9) counter_inst0 (.*);
    
     
 always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end
    
  initial begin
    rst = 0; //dont care
//    a_tlast = 0;
//    a = 64'h4010000000000000; //dont care
    
    #40; 
    rst = 1;
    
    #40;
    rst = 0;
    
    #1000;
    $finish;
    
 end
    
endmodule
