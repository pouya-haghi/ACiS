`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2021 11:57:32 AM
// Design Name: 
// Module Name: mux4
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


module mux4 #(parameter width=64)(
    input [width-1:0] a,
    input [width-1:0] b,
    input [width-1:0] c,
    input [width-1:0] d,
    input [1:0] sel,
    output [width-1:0] y

    );
    
    assign y = (sel[1])?((sel[0])? d: c):((sel[0])? b: a);
    
endmodule
