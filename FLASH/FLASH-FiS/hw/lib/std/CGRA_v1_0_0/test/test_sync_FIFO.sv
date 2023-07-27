`timescale 1ns / 1ps

module test_sync_FIFO;
    parameter fifo_width=32;
    parameter fifo_size=8;
    
    reg clk;
    reg rst;
    reg push;
    reg pop;
    reg [fifo_width-1:0] din;
    reg [fifo_width-1:0] dout;
    
    wire empty;
    wire full;
    
    sync_FIFO #(.fifo_size(fifo_size)) sync_FIFO_inst1(
        .clk(clk),
        .rst(rst),
        .push(push),
        .pop(pop),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full)
        ); 
        
    always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end
    
    initial begin
        rst = 1;
        push = 0;
        pop = 0;
        
        #20
        rst = 0;
        #10
        
        #5 push = 1; din <= 32'd1;
        #10 din <= 32'd2;
        #10 din <= 32'd3;
        #10 din <= 32'd4;
        #10 din <= 32'd5;
        #10 din <= 32'd6;
        #10 din <= 32'd7;
        #10 din <= 32'd8;
        #10 din <= 32'd9;
        #10 push = 0;
        
        pop = 1; 
        #100 pop = 0;
        #10
        
        $finish;
    end
endmodule
