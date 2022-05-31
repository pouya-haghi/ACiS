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
    input logic stall_rd, // clk_en
    input logic stall_wr,
    input logic [dwidth_RFadd-1:0] vr_addr,
    input logic [dwidth_RFadd-1:0] vw_addr,
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
