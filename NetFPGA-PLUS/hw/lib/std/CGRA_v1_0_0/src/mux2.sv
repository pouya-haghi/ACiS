`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2022 12:33:58 PM
// Design Name: 
// Module Name: mux2
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

module mux2 #(parameter width=64)(
    input [width-1:0] a,
    input [width-1:0] b,
    input sel,
    output [width-1:0] y

    );
    
    assign y = (sel)? b: a;
    
endmodule
