`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module test_auto_incr_vec;
    reg clk;
    reg rst;
    reg [dwidth_RFadd-1:0] ITR;
    reg wen_ITR;
    reg stall_rd;
    reg stall_wr;
    reg [dwidth_RFadd-1:0] vr_addr;
    reg [dwidth_RFadd-1:0] vw_addr;
    reg is_vmacc_vv;
    reg is_streamout;
    reg is_vle32_v;
    reg is_vse32_v;
    
    wire [dwidth_RFadd-1:0] vr_addr_auto_incr;
    wire [dwidth_RFadd-1:0] vw_addr_auto_incr;
    wire done;
    
    auto_incr_vect auto_incr_vect_inst(
         .clk(clk), 
         .rst(rst),
         .ITR(ITR),
         .wen_ITR(wen_ITR),
         .stall_rd(stall_rd_autovect), // clk_en
         .stall_wr(stall_wr_autovect),
         .is_vmacc_vv(is_vmacc_vv),
         .is_vle32_v(is_vle32_vv),
         .is_vse32_v(is_vse32_vv),
         .is_streamout(is_vstreamout),
         .vr_addr(vr_addr),
         .vw_addr(vw_addr),
         .vr_addr_auto_incr(vr_addr_auto_incr),
         .vw_addr_auto_incr(vw_addr_auto_incr),
         .done(done_auto_incr) // one clock pulse
         );
    
    always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end
    
    initial begin
        
        #100
    $finish;
    
 end

endmodule
