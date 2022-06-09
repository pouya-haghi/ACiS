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
    reg wen_ITR;
    reg stall_rd;
    reg stall_wr;
    reg [dwidth_RFadd-1:0] vr_addr;
    reg [dwidth_RFadd-1:0] vw_addr;
    reg is_vmacc_vv;
    reg is_vstreamout;
    reg is_vle32_vv;
    reg is_vse32_vv;
    
    wire [dwidth_RFadd-1:0] vr_addr_auto_incr;
    wire [dwidth_RFadd-1:0] vw_addr_auto_incr;
    wire done;
    
    auto_incr_vect auto_incr_vect_inst(
         .clk(clk), 
         .rst(rst),
         .ITR(ITR),
         .wen_ITR(wen_ITR),
         .stall_rd(stall_rd), // clk_en
         .stall_wr(stall_wr),
         .is_vmacc_vv(is_vmacc_vv),
         .is_vle32_v(is_vle32_vv),
         .is_vse32_v(is_vse32_vv),
         .is_streamout(is_vstreamout),
         .vr_addr(vr_addr),
         .vw_addr(vw_addr),
         .vr_addr_auto_incr(vr_addr_auto_incr),
         .vw_addr_auto_incr(vw_addr_auto_incr),
         .done(done) // one clock pulse
         );
    
    always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end
    
    initial begin
        rst = 1; 
        ITR <= 0;
        wen_ITR = 0;
        stall_rd = 0;
        stall_wr = 0;
        vr_addr <= 0;
        vw_addr <= 0;
        is_vmacc_vv = 0;
        is_vle32_vv = 0;
        is_vse32_vv = 0;
        is_vstreamout = 0;
        
        
        #20 rst = 0;
        
        // read
        #5 wen_ITR = 1; #10 wen_ITR = 0;
        vr_addr = 12'd8;
        ITR = 8;
        
        #10 is_vmacc_vv = 1;
        #20 is_vstreamout = 1;
        #10 is_vmacc_vv = 0;
        
        #10 stall_rd = 1;
        #40 stall_rd = 0;
        #10 is_vse32_vv = 1;
        #10 is_vstreamout = 0;
        
        //write
        #60 wen_ITR = 1; #10 wen_ITR = 0;
        vw_addr = 12'd32;
        ITR = 8;
        
        #10 is_vmacc_vv = 1;
        
        #40 stall_wr = 1;
        #10 is_vle32_vv = 1;
        #20 is_vmacc_vv = 0;
        #10 stall_wr = 0;
        
        
        #100
    $finish;
    
 end

endmodule
