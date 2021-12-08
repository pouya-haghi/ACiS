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


module test_addsub_int(

    );
    reg [31:0] A, B;
    reg CLK, ADD;
    wire [31:0] S;
    
    c_addsub_0 addsub_inst0 (A, B, CLK, ADD, S);
    
     
 always begin
        CLK = 1;
        #5;
        CLK = 0;
        #5;
    end
    
  initial begin
    A = 0; //dont care
    B = 0;
    ADD = 1; //dont care
    
    #40; 
    A = 32'd3;
    B = 32'd2;
    
    #1000;
    $finish;
    
 end
    
endmodule
