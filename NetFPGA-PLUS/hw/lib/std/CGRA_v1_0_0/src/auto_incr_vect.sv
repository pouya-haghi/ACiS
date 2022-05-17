`timescale 1ns / 1ps
`ifndef MY_INTERFACE
  `define MY_INTERFACE
  `include "my_interface.vh"
`endif

module auto_incr_vect(
    input logic clk, 
    input logic rst,
    input logic [dwidth_RFadd-1:0] ITR,
    input logic wen_ITR, // act as both wen and start signal
    input logic stall, // clk_en
    input logic [dwidth_RFadd-1:0] vr_addr,
    input logic [dwidth_RFadd-1:0] vw_addr,
    input logic [dwidth_int-1:0] rddata1_RF_scalar, // x register in vle32 and vse32 instructions, used for addressing memory
    output logic [dwidth_RFadd-1:0] vr_addr_auto_incr,
    output logic [dwidth_RFadd-1:0] vw_addr_auto_incr,
    output logic [dwidth_HBMadd-1:0] araddr_HBM,
    output logic [dwidth_HBMadd-1:0] awaddr_HBM,
    output logic done // one clock pulse
    );
    
    logic [dwidth_RFadd-1:0] ctr_ITR;// counter
    logic [dwidth_RFadd-1:0] ITR_q, ITR_minusOne;
    logic count;
    logic curr_state, next_state;
    localparam waiting = 1'b0, count_started = 1'b1; 
    
    assign ITR_minusOne = ITR - 1;
    
    reg_enr reg_enr_inst(
        .d(ITR_minusOne),
        .clk(clk),
        .rst(rst),
        .en(wen_ITR),
        .q(ITR_q)
    );
    
    // an FSM with wen_ITR as a start signal and asserting count if we should count the counter
    always_ff @(posedge clk) begin
        if (rst)
            curr_state <= waiting;
        else 
            curr_state <= next_state;
    end

    always_comb begin
        case(curr_state)
            waiting: next_state = (wen_ITR) ? count_started: waiting;
            count_started: next_state = (ctr_ITR==ITR_q)? waiting: count_started;
            default: next_state = waiting;
        endcase
    end
    
    assign count = (curr_state == count_started)? 1'b1: 1'b0;
    assign done =  (curr_state == count_started && ctr_ITR==ITR_q)? 1'b1: 1'b0;
    
    always_ff@(posedge clk) begin
        if (rst) 
            ctr_ITR <= 'b0;
        else if (wen_ITR)
            ctr_ITR <= 'b0;
        else if (count && ctr_ITR!=ITR_q && !stall)
            ctr_ITR <= ctr_ITR + 1;
        else if (count && ctr_ITR==ITR_q)
            ctr_ITR <= 'b0;
    end
    
    assign araddr_HBM = {{(dwidth_int-dwidth_RFadd){1'b0}}, ctr_ITR} + rddata1_RF_scalar;
    assign awaddr_HBM = {{(dwidth_int-dwidth_RFadd){1'b0}}, ctr_ITR} + rddata1_RF_scalar;
    assign vr_addr_auto_incr = vr_addr + ctr_ITR;
    assign vw_addr_auto_incr = vw_addr + ctr_ITR;
endmodule
