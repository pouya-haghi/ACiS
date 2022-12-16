`timescale 1ns / 1ps

`ifndef MY_INTERFACE
  `define MY_INTERFACE
  `include "my_interface.vh"
`endif

`ifndef INCLUDE_SYNC_FIFO
    `define INCLUDE_SYNC_FIFO
    `include "include_sync_FIFO.vh"
`endif

module test_sync_FIFO;
    parameter fifo_width = tb_fifo_width;
    parameter fifo_size = tb_fifo_size;
    
    bit clk;
    bit rst;
    bit push;
    bit pop;
    bit [fifo_width-1:0] din;
    bit [fifo_width-1:0] dout;
    
    bit empty;
    bit full;
    
    task init();
        rst = 0;
        push <= 0;
        pop <= 0;
        din <= 0;
    endtask
    
    task apply_reset();
        #(clk_pd + (clk_pd/4)) rst = 1;
        #(clk_pd) rst = 0;
        #(2*clk_pd);
    endtask
    
    
    sync_FIFO #(.fifo_width(fifo_width), .fifo_size(fifo_size)) sync_FIFO_inst1(
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
        #(clk_pd/2);
        clk = 0;
        #(clk_pd/2);
    end
    
    initial begin
//        rst = 0;
//        push <= 0;
//        pop <= 0;
//        din <= 32'd0;
//        #(clk_pd + (clk_pd/4));
//        rst = 1; 
//        #clk_pd;
//        rst = 0;
//        #(2*clk_pd);
       init();
       apply_reset();
        
        push <= 1; 
        din <= 32'd1; // test on-shot pushing
        #clk_pd;
        push <= 0;
        #(clk_pd*3); // wait
        push <= 1;
        din <= 32'd2; // test: continous pushing
        #clk_pd;
        din <= 32'd3;
        #clk_pd;
        din <= 32'd4;
        #clk_pd;
        din <= 32'd5;
        #clk_pd;
        din <= 32'd6; // test: checking full
        #clk_pd;
        din <= 32'd7; // test: checking consecutive fulls 
        #clk_pd;
        push <= 0;
        pop <= 1; 
        #(clk_pd*(fifo_size+4)); // test: checking consecutive pops
        pop <= 0; // test: checking steady state (no eleemnt in the FIFO)
        #clk_pd;
        din <= 32'd8;
        push <= 1; 
        pop <= 1; // test: both push and pop at the same time
        
        
        $finish;
    end
endmodule
