`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module test_assembler(

    );
    reg clk;
    reg rst;
    reg is_vstreamout_global;
    reg is_spl;
    reg [31:0] RF_in;
    reg [phit_size-1:0] tdata_in;
    reg [phit_size/8-1:0] tkeep_in;
    reg tvalid_in;
    wire [phit_size-1:0] tdata_out;
    wire [phit_size/8-1:0] tkeep_out;
    wire tvalid_out;
    
    assembler assembler_inst0(.*);
    
//    reg [19:0] a,b;
//    wire [19:0] out;
    
//    registered_add reg_add_inst0(.*);
    
    always begin
        #(clk_pd/2);
        clk <= !clk;
    end
    
    initial begin
        clk<=1'b1;
        rst<='0;
        is_vstreamout_global<='0;
        is_spl<='0;
        RF_in<='0;
        tdata_in<='0;
        tkeep_in<='0;
        tvalid_in<='0;
        
//        a<='0;
//        b<='0;
        
        #clk_pd; rst <= 1'b1; #(clk_pd*2); rst <= 1'b0; 
        
//        // check registered adder
//        a<= 20'h4; b<= 20'h5; #clk_pd;
//        a<= 20'h6; b<= 20'h7; #clk_pd;
        
        // check assembler
        is_spl <= 1'b1; RF_in = 16'h3FFF; #clk_pd;
        is_spl<='0; RF_in<='0;
        
        #(clk_pd*2);
        
        is_vstreamout_global <= 1'b1; tdata_in <= {240'b0, 160'h3FFF_3FFF_3FFF_3FFF_0000_3FFF_3FFF_3FFF_0000_3FFF, 112'b0}; tkeep_in <= 64'h0; tvalid_in = 1'b1; #clk_pd;
        // sum is 23FF7, so checksum should be !3FF9 = C006
        tdata_in <= {508'b0, 4'h1}; tkeep_in <= 64'hFFFFFFFC00000000; #clk_pd;
        tdata_in <= {508'b0, 4'h2}; tkeep_in <= 64'hFFFFFFFC00000000; #clk_pd;
        tdata_in <= {508'b0, 4'h3}; tkeep_in <= 64'hFFFFFFFC00000000; #clk_pd;
        tdata_in <= {508'b0, 4'h4}; tkeep_in <= 64'hFFFFFFFC00000000; #clk_pd;
        tdata_in <= {508'b0, 4'h5}; tkeep_in <= 64'hFFFFFFFC00000000; #clk_pd;
        tdata_in <= {508'b0, 4'h6}; tkeep_in <= 64'hFFFFFFFC00000000; #clk_pd;
        tdata_in <= {508'b0, 4'h7}; tkeep_in <= 64'hFFFFFFFC00000000; #clk_pd;
        is_vstreamout_global <= 1'b0; tvalid_in = 1'b0;
        
        #(clk_pd*8);
        $finish;
    end
endmodule
