`timescale 1ns / 1ps


module regFile_scalar #(parameter width=32)
	(
	input logic clk,
    input logic we,
    input logic [4:0] rr1,
    input logic [4:0] rr2,
    input logic [4:0] wr,
    input logic [width-1:0] wd,
    output logic [width-1:0] dr1,
    output logic [width-1:0] dr2
    );
    
    reg	 [width-1:0] mem [width-1:0];
    
    always @(posedge clk) begin
        if(we)	mem[wr] <= wd;
        else	mem[wr] <= mem[wr];
    end
    
    //register 0 is hardwired to 0 
    assign	dr1 = rr1?(mem[rr1]):32'b0;
    assign	dr2 = rr2?(mem[rr2]):32'b0;
endmodule
