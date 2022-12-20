`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module test_auto_incr_vec;
    // dwidth_RFadd = 12;
    reg clk;
    reg rst;
    reg [dwidth_RFadd-1:0] ITR;
    reg stall_rd;
    reg stall_wr;
    reg [dwidth_RFadd-1:0] vr_addr1;
    reg [dwidth_RFadd-1:0] vr_addr2;
    reg [dwidth_RFadd-1:0] vw_addr;
    reg load_PC;
    reg incr_PC;
    reg is_vmacc_vv;
    reg is_vstreamout;
    reg is_vle32_v;
    reg is_vse32_v;
    reg is_vsetivli;
    
    wire wen_ITR;
    wire [dwidth_RFadd-1:0] ITR_delay;
    wire [dwidth_RFadd-1:0] vr_addr1_auto_incr;
    wire [dwidth_RFadd-1:0] vr_addr2_auto_incr;
    wire [dwidth_RFadd-1:0] vw_addr_auto_incr;
    wire done;
    
    auto_incr_vect auto_incr_vect_inst(.*);
    
    always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end
    
    initial begin
        rst = 0; 
        ITR <= 6;
        stall_rd <= 1;
        stall_wr <= 1;
        vr_addr1 <= 0;
        vr_addr2 <= 0;
        vw_addr <= 0;
        load_PC <= 0;
        incr_PC <= 0;
        is_vmacc_vv <= 0;
        is_vle32_v <= 0;
        is_vse32_v <= 0;
        is_vsetivli <= 0;
        is_vstreamout <= 0;
        
        #22; 
        rst = 1;
        
        #20;
        rst = 0;
        
        #20;
        incr_PC <= 1;
        
        #10; 
        incr_PC <= 1;
        is_vsetivli <= 1; 
        
        #10;
        incr_PC <= 0;
        is_vsetivli <= 0;
        is_vmacc_vv <= 1; 
        stall_rd <= 0;
        
        #30;
        stall_rd <= 1;
        
        #10;
        stall_rd <= 0;
        
        #40; // assuming 8 clk latency for PE
        stall_wr <= 0;
        
        #30;
        stall_wr <= 1;
        
        #10;
        stall_wr <= 0;
        

        @(posedge done);
        #5;
        incr_PC <= 1;
        #10;
        is_vmacc_vv <= 0;
        
        
        
        #40
    $finish;
    
 end

endmodule
