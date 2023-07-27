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
    input logic stall_rd, // clk_en
    input logic stall_wr,
    input logic [dwidth_RFadd-1:0] vr_addr1, // base address
    input logic [dwidth_RFadd-1:0] vr_addr2, // base address
    input logic [dwidth_RFadd-1:0] vw_addr, //base address
    input logic load_PC,
    input logic incr_PC,
    input logic is_vmacc_vv,
    input logic is_vstreamout,
    input logic is_vle32_v,
    input logic is_vse32_v,
    input logic is_vsetivli,
//    input logic [dwidth_int-1:0] rddata1_RF_scalar, // x register in vle32 and vse32 instructions, used for addressing memory
    output logic wen_ITR, // act as both wen and start signal
    output logic [dwidth_RFadd-1:0] ITR_delay, // one clock delayed
    output logic [dwidth_RFadd-1:0] vr_addr1_auto_incr,
    output logic [dwidth_RFadd-1:0] vr_addr2_auto_incr,
    output logic [dwidth_RFadd-1:0] vw_addr_auto_incr,
    output logic done, // one clock pulse
    input logic [4:0] vs2
    );
    
    logic [dwidth_RFadd-1:0] ctr_ITR_rd, ctr_ITR_wr;// counter
    logic [dwidth_RFadd-1:0] ITR_q, ITR_d;
    logic count_rd, count_wr;
    logic is_vect, change_PC;
    logic curr_state_rd, next_state_rd, curr_state_wr, next_state_wr;
    logic [1:0] curr_state_wen_ITR, next_state_wen_ITR;
    localparam waiting = 1'b0, count_started = 1'b1; 
    localparam [1:0] left_inactive = 2'b00, left_active = 2'b01, right_inactive = 2'b10, right_active = 2'b11; 
    
    reg_enr #(dwidth_RFadd) reg_enr_inst(
        .d(ITR),
        .clk(clk),
        .rst(rst),
        .en(is_vsetivli),
        .q(ITR_d)
    );
    
    assign ITR_q = ITR_d - 1'b1;
    assign ITR_delay = ITR_d;
    
    // FSM for wen_ITR
    always_ff @(posedge clk) begin
        if (rst) begin
            curr_state_wen_ITR <= left_inactive;
        end
        else begin
            curr_state_wen_ITR <= next_state_wen_ITR;
        end
    end

    always_comb begin
        case(curr_state_wen_ITR)
            left_inactive: next_state_wen_ITR = (change_PC) ? right_active : left_inactive;
            left_active: next_state_wen_ITR = (is_vect) ? left_inactive : (change_PC) ? right_active : left_active;
            right_inactive: next_state_wen_ITR = (change_PC) ? left_active : right_inactive;
            right_active: next_state_wen_ITR = (is_vect) ? right_inactive : (change_PC) ? left_active : right_active;
            default: next_state_wen_ITR = left_inactive;
        endcase
    end
    
    assign change_PC = (load_PC || incr_PC);
    assign is_vect = is_vse32_v || is_vle32_v || is_vstreamout || is_vmacc_vv;
    assign wen_ITR = ((curr_state_wen_ITR == right_active) & is_vect) || ((curr_state_wen_ITR == left_active) & is_vect) ? 1'b1 : 1'b0;
    
    
    // an FSM with wen_ITR as a start signal and asserting count_rd if we should count_rd the counter
    always_ff @(posedge clk) begin
        if (rst) begin
            curr_state_rd <= waiting;
            curr_state_wr <= waiting;
        end
        else begin
            curr_state_rd <= next_state_rd;
            curr_state_wr <= next_state_wr;
        end
    end

    // for vmacc I will wait until all valid outputs are finised (not valid inputs) this introduces some bubbles
    // equal to the latency of PE
    always_comb begin
        case(curr_state_rd)
            waiting: next_state_rd = (wen_ITR) ? count_started: waiting;
            count_started: next_state_rd = ((is_vmacc_vv || is_vstreamout || is_vse32_v) && ctr_ITR_rd==ITR_q) ? waiting : count_started;
            default: next_state_rd = waiting;
        endcase
    end
    
    always_comb begin
        case(curr_state_wr)
            waiting: next_state_wr = (wen_ITR) ? count_started: waiting;
            count_started: next_state_wr = ((is_vmacc_vv||is_vle32_v) && ctr_ITR_wr==ITR_q) ? waiting : count_started;
            default: next_state_wr = waiting;
        endcase
    end
    
    assign count_rd = (curr_state_rd == count_started) || (curr_state_rd == waiting & wen_ITR)? 1'b1: 1'b0;
    assign count_wr = (curr_state_wr == count_started) || (curr_state_wr == waiting & wen_ITR)? 1'b1: 1'b0;
    assign done =  ((curr_state_rd == count_started || curr_state_wr == count_started) && ((is_vmacc_vv||is_vle32_v)&&ctr_ITR_wr==ITR_q) || ((is_vstreamout||is_vse32_v)&&ctr_ITR_rd==ITR_q))? 1'b1: 1'b0;
    
    // for read
    always_ff@(posedge clk) begin
        if (rst) begin
            ctr_ITR_rd <= 'b0;
            end
//        else if (wen_ITR) begin
//            ctr_ITR_rd <= 'b0; 
//        end
        else if (count_rd && ctr_ITR_rd!=ITR_q && !stall_rd && (is_vmacc_vv || is_vstreamout || is_vse32_v)) begin
                ctr_ITR_rd <= ctr_ITR_rd + 1;
            end
        else if (count_rd && ctr_ITR_rd==ITR_q) begin
            ctr_ITR_rd <= 'b0;
        end
    end
    
    // for write
    always_ff@(posedge clk) begin
        if (rst) begin
            ctr_ITR_wr <= 'b0;
            end
//        else if (wen_ITR) begin
//            ctr_ITR_wr <= 'b0; 
//        end
        else if (count_wr && ctr_ITR_wr!=ITR_q && !stall_wr && (is_vmacc_vv || is_vle32_v)) begin
                ctr_ITR_wr <= ctr_ITR_wr + 1;
            end
        else if (count_wr && ctr_ITR_wr==ITR_q) begin
            ctr_ITR_wr <= 'b0;
        end
    end
    
//    assign vr_addr1_auto_incr = (is_vmacc_vv) ? vr_addr1 : vr_addr1 + ctr_ITR_rd; // iterate if vstreamout, vse32 (serves as vr/vr1 for all/vmacc)
    assign vr_addr1_auto_incr = (is_vmacc_vv) ? {{(dwidth_RFadd-5){1'b0}}, vs2} : vr_addr1 + ctr_ITR_rd; // iterate if vstreamout, vse32 (serves as vr/vr1 for all/vmacc) -- for vmacc you should keep it scalar and no need to iterate (it should be a single VRF entry (that vs2 points to) in the first segment of VRF) 
    assign vr_addr2_auto_incr = vr_addr2 + ctr_ITR_rd; // iterate if vstreamout, vse32, vmacc (serves as vr2 for vmacc)
    assign vw_addr_auto_incr = vw_addr + ctr_ITR_wr; // iterate if vmacc, vle32
endmodule
