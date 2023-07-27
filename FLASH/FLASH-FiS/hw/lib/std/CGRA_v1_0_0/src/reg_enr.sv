`timescale 1ns / 1ps


module reg_enr #(parameter width=64)
	(
    input logic [width-1:0] d,
    input logic clk,
    input logic rst,
    input logic en,
    output  logic [width-1:0] q
    );

always_ff @(posedge clk) begin
    if (rst)		q<='0;
    else if(en)		q<=d;
end
endmodule