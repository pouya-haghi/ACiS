`timescale 1ns / 1ps


module sparse_control(
    input logic clk,
    input logic rst,
    input logic is_spvacc_xv,
    input logic [dwidth_RFadd-1:0] vr_addr1,
    input logic tvalid_PE, // here we get tvalid from the first PE but one can have any logic (based on which of PEs are valid, etc)
    input logic [dwidth_float-1:0] tdata_PE,
    input logic ITR_threshold_sp, // when auto_incr_vect is finished
    output logic [dwidth_RFadd-1:0] ITR_sp, // for spvacc
    output logic wen_ITR_sp,
    output logic en_ITR_sp,
    output logic [dwidth_RFadd-1:0] vr_addr_sp
    );
    
    localparam [1:0] init = 2'b00, got_spvacc1 = 2'b01, got_tvalid_PE1 = 2'b10, got_tvalid_PE2 = 2'b11;
    
    logic [1:0] state, next_state;
    logic [dwidth_RFadd-1:0] ITR_sp_t;
    logic en_ITR_sp_t;
    logic wen_ITR_sp_t;
    
    // creating an FSM for spvacc (generating en signal for when to capture & save ITR)
    always_ff @(posedge clk) begin
        if (rst)
            state <= init;
        else
            state <= next_state;
    end
    
    always_comb begin
        case(state)
            init: next_state = (is_spvacc_xv & (~tvalid_PE))? got_spvacc1: ((is_spvacc_xv & tvalid_PE)? got_tvalid_PE2: init);
            got_spvacc1: next_state = (tvalid_PE)? got_tvalid_PE1: got_spvacc1;
            got_tvalid_PE1: next_state = (ITR_threshold_sp)? init: got_tvalid_PE1;
            got_tvalid_PE2: next_state = (ITR_threshold_sp)? init: got_tvalid_PE2;
            default: next_state = init;
        endcase
    end
    
    assign en_ITR_sp_t = (state == init & is_spvacc_xv & tvalid_PE) || (state == got_spvacc1 & tvalid_PE) ? 1'b1: 1'b0;
    assign en_ITR_sp = en_ITR_sp_t;
    
    // for storing ITR_sp
    reg_enr #(dwidth_RFadd) reg_enr_inst0
    (.d(tdata_PE[dwidth_RFadd-1:0]),
    .clk(clk),
    .rst(rst),
    .en(en_ITR_sp_t),
    .q(ITR_sp_t));
    
    // delaying en_ITR_sp for one cycle and use it as wen_ITR
    reg_enr #(1) reg_enr_inst1
    (.d(en_ITR_sp_t),
    .clk(clk),
    .rst(rst),
    .en(is_spvacc_xv),
    .q(wen_ITR_sp_t));
    
    assign ITR_sp = ITR_sp_t - 1'b1; // to ease the comparison
    assign wen_ITR_sp = wen_ITR_sp_t;
    
    assign vr_addr_sp = vr_addr1 + tdata_PE[dwidth_RFadd-1:0];
    
endmodule
