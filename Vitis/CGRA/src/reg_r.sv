`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2021 08:31:15 PM
// Design Name: 
// Module Name: reg_r
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

module reg_r #(parameter width=64)
	(
    input logic [width-1:0] d,
    input logic clk,
    input logic rst,
    output  logic [width-1:0] q
    );

always_ff @(posedge clk) begin
    if(rst)		q<='0;
    else		q<=d;
end
endmodule
