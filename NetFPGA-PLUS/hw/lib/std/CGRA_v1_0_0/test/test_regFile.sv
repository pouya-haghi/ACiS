`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module test_regFile;
    reg clk;
    
    reg [phit_size-1:0] d_in;
    reg [dwidth_RFadd-1:0] rd_addr;
    reg [dwidth_RFadd-1:0] wr_addr;
    reg wen;
    
    wire [phit_size-1:0] d_out;
    
    regFile regFileInst1 (.d_in(d_in),.clk(clk),.rd_addr(rd_addr),.wr_addr(wr_addr),.wen(wen),.d_out(d_out));
    
    always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end
    
    initial begin
        d_in <= 0;
        rd_addr <= 0;
        wr_addr <= 0;
        wen = 0;
        
        #10
        wen = 1;
        
        #10
        wr_addr <= 12'd8;
        d_in <= 512'd123;
        
        #20
        wr_addr <= 12'd12;
        d_in <= 512'd321;
        
        #100
        wen = 0;
        
        #100
        rd_addr <= 12'd8;
        
        #40
        rd_addr <= 12'd12;
        
        
        
        #100
    $finish;
    
 end

endmodule
