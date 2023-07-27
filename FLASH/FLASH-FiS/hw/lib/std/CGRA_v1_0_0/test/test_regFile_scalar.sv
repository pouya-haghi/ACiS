`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module test_regFile_scalar;
    parameter my_width = 32;

    reg clk;
    reg we;
    
    reg [4:0] rr1;
    reg [4:0] rr2;
    reg [4:0] wr;
    reg [my_width-1:0] wd;
    wire [my_width-1:0] dr1;
    wire [my_width-1:0] dr2;
    
    regFile_scalar #(.width(my_width)) regFileScalarInst1 (
        .clk(clk),
        .we(we),
        .rr1(rr1),
        .rr2(rr2),
        .wr(wr),
        .wd(wd),
        .dr1(dr1),
        .dr2(dr2));
    
    always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end
    
    initial begin
        rr1 <= 0;
        rr2 <= 0;
        wr <= 0;
        wd <= 0;
        
        we = 0;
        
        
        #10
        we = 1;
        
        #10
        wr <= 12'd8;
        wd <= 512'd123;
        
        #20
        wr <= 12'd12;
        wd <= 512'd321;
        
        #50
        we = 0;
        
        #100
        rr1 <= 12'd8;
        rr2 <= 12'd12;
        
        
        
        #100
    $finish;
    
 end

endmodule
