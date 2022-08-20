`timescale 1ns / 1ps
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module test_vstreamout_control(

    );
    reg                     clk;
    reg                     rst;
    reg  [num_col-1:0]      is_vstreamout;
    reg  [num_col-1:0]      tlast;
    reg  [dwidth_RFadd-1:0] rd_addr;
    wire [num_col-1:0]      supplier;
    wire [dwidth_RFadd-1:0] streamout_addr;
    wire                    is_vstreamout_global;
    wire [1:0]              sel_mux2_1;
    wire [1:0]              sel_mux2_2;
    
    vstreamout_control inst(.*);
    
    always begin
        #5;
        clk = !clk;
    end
    
    initial begin
        clk='0;           
        rst='0;           
        is_vstreamout='0; 
        tlast='0;         
        rd_addr='0;
        #10;
        rst = 1'b1;
        #20;
        rst = 1'b0;
        is_vstreamout = 2'b01;
        rd_addr = {5'b0,5'b10101};
        #10;
        is_vstreamout = 2'b00;
        rd_addr = {5'b0,5'b0};
        #60;
        tlast = 2'b01;
        #10;
        tlast = 2'b0;
        #70;
        tlast = 2'b10;
        #10;
        tlast = 2'b0;
        #50;
        $finish;
    end
        
        
endmodule
