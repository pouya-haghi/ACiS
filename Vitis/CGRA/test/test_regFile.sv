`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module test_regFile;
    reg clk;
    
    reg [phit_size-1:0] d_in;
    reg [dwidth_RFadd-1:0] rd_addr1, rd_addr2;
    reg [dwidth_RFadd-1:0] wr_addr;
    reg wen;
    
    wire [phit_size-1:0] d_out1, d_out2;
    
    regFile regFileInst0 (.d_in(d_in),.clk(clk),.rd_addr1(rd_addr1),.rd_addr2(rd_addr2),.wr_addr(wr_addr),.wen(wen),.d_out1(d_out1),.d_out2(d_out2));
    
    always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end
    
    integer i;
    initial begin
        d_in <= 0;
        rd_addr1 <= 0;
        rd_addr2 <= 0;
        wr_addr <= 0;
        wen = 0;
        
        #5
        wen = 1;
        
        for (i=0;i<8;i=i+1) begin
            wr_addr <= i;
            d_in <= i*10;
            #10;
        end
        
        wen = 0;
        
        #10
        
        for (i=0;i<8;i=i+1) begin
            rd_addr1 <= i;
            rd_addr2 <= 7-i;
            #10;
        end
        
        
        
        #100
    $finish;
    
 end

endmodule
