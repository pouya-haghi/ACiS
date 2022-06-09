`timescale 1ns / 1ps
`ifndef MY_INTERFACE
  `define MY_INTERFACE
  `include "my_interface.vh"
`endif
// documentation: this unit provides an auto-increment facility to auto-increment the read and write
// addresses of vector register files based on control signals (is_* signals), stall_* signals, and
// base addresses (vr_addr, vw_addr) and ITR (which is vector length). Note that wen_ITR is the start signal

// instructions for writing the testbench: 1. read 2. write

// 1. read: assert wen_ITR to 1 for one cycle (one high pulse) then the instruction should be a read from 
// register file (one of these signals should be high: is_vmacc_vv, is_streamout, is_vse32_v), set ITR as 8, 
// make stall_rd as zero. A couple of cycles later (less tahn ITR), make a high pulse for stall_rd. What we should expect?
//vr_addr_auto_incr should be auto incremented if stall_rd is zero and should keep its value when stall_wr is high
// 8 valid increment should be done and at the end, done signal should give a high pulse

// 2. write: assert wen_ITR to 1 for one cycle (one high pulse) then the instruction should be a write to 
// register file (one of these signals should be high: is_vmacc_vv || is_vle32_v), set ITR as 8, 
// make stall_wr as zero. A couple of cycles later (less than ITR), make a high pulse for stall_wr. What we should expect?
//vw_addr_auto_incr should be auto incremented if stall_wr is zero and should keep its value when stall_wr is high
// 8 valid increment should be done and at the end, done signal should give a high pulse
module auto_incr_vect(
    input logic clk, 
    input logic rst,
    input logic [dwidth_RFadd-1:0] ITR, // iteration
    input logic wen_ITR, // act as both wen and start signal
    input logic stall_rd, // clk_en
    input logic stall_wr,
    input logic [dwidth_RFadd-1:0] vr_addr, // base address
    input logic [dwidth_RFadd-1:0] vw_addr, //base address
    input logic is_vmacc_vv,
    input logic is_streamout,
    input logic is_vle32_v,
    input logic is_vse32_v,
//    input logic [dwidth_int-1:0] rddata1_RF_scalar, // x register in vle32 and vse32 instructions, used for addressing memory
    output logic [dwidth_RFadd-1:0] vr_addr_auto_incr,
    output logic [dwidth_RFadd-1:0] vw_addr_auto_incr,
    output logic done // one clock pulse
    );
    
    logic [dwidth_RFadd-1:0] ctr_ITR_rd, ctr_ITR_wr;// counter
    logic [dwidth_RFadd-1:0] ITR_q, ITR_minusOne;
    logic count;
    logic curr_state, next_state;
    localparam waiting = 1'b0, count_started = 1'b1; 
    
    assign ITR_minusOne = ITR - 1;
    
    reg_enr #(dwidth_RFadd) reg_enr_inst(
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

    // for vmacc I will wait until all valid outputs are finised (not valid inputs) this introduces some bubbles
    // equal to the latency of PE
    always_comb begin
        case(curr_state)
            waiting: next_state = (wen_ITR) ? count_started: waiting;
            count_started: next_state = ((is_vmacc_vv||is_vle32_v)&&ctr_ITR_wr==ITR_q) || ((is_streamout||is_vse32_v)&&ctr_ITR_rd==ITR_q)? waiting: count_started;
            default: next_state = waiting;
        endcase
    end
    
    assign count = (curr_state == count_started)? 1'b1: 1'b0;
    assign done =  (curr_state == count_started && ((is_vmacc_vv||is_vle32_v)&&ctr_ITR_wr==ITR_q) || ((is_streamout||is_vse32_v)&&ctr_ITR_rd==ITR_q))? 1'b1: 1'b0;
    
    // for read
    always_ff@(posedge clk) begin
        if (rst) begin
            ctr_ITR_rd <= 'b0;
            end
        else if (wen_ITR) begin
            ctr_ITR_rd <= 'b0; 
        end
        else if (count && ctr_ITR_rd!=ITR_q && !stall_rd && (is_vmacc_vv || is_streamout || is_vse32_v)) begin
                ctr_ITR_rd <= ctr_ITR_rd + 1;
            end
        else if (count && ctr_ITR_rd==ITR_q) begin
            ctr_ITR_rd <= 'b0;
        end
    end
    
    // for write
    always_ff@(posedge clk) begin
        if (rst) begin
            ctr_ITR_wr <= 'b0;
            end
        else if (wen_ITR) begin
            ctr_ITR_wr <= 'b0; 
        end
        else if (count && ctr_ITR_wr!=ITR_q && !stall_wr && (is_vmacc_vv || is_vle32_v)) begin
                ctr_ITR_wr <= ctr_ITR_wr + 1;
            end
        else if (count && ctr_ITR_wr==ITR_q) begin
            ctr_ITR_wr <= 'b0;
        end
    end
    
    assign vr_addr_auto_incr = vr_addr + ctr_ITR_rd;
    assign vw_addr_auto_incr = vw_addr + ctr_ITR_wr;
endmodule
