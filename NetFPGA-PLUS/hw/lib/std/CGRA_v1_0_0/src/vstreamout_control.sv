`timescale 1ns / 1ps
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif
module vstreamout_control(
    input  logic clk,
    input  logic rst,
    input  logic [num_col-1:0] is_vstreamout,
    input  logic [num_col-1:0] done,
    input  logic [dwidth_RFadd-1:0] rd_addr,
    output logic [num_col-1:0] supplier,
    output logic [dwidth_RFadd-1:0] streamout_addr,
    output logic is_vstreamout_global,
    output logic [num_col-1:0] sel_mux2
    );
    
    // Stream out control FSM
    logic streamout_active = 1'b1;
    logic streamout_inactive = 1'b0;
    logic curr_state_streamout, next_state_streamout;
    logic [num_col-1:0] curr_supplier, next_supplier;
    logic [num_col-1:0] curr_sel_mux2, next_sel_mux2;

    assign supplier = curr_supplier;
    assign sel_mux2 = curr_sel_mux2;

    always_ff @(posedge clk) begin
        if (rst) begin
            curr_state_streamout <= streamout_inactive;
            curr_supplier <= {{(num_col-1){1'b0}},1'b1}; 
            curr_sel_mux2 <= '0;
            streamout_addr <= '0;
            is_vstreamout_global <= '0;
        end else begin
            curr_state_streamout <= next_state_streamout;
            curr_supplier <= next_supplier;
            curr_sel_mux2 <= next_sel_mux2;
        end
    end    
    
    always_comb begin
        case(curr_state_streamout)
            // If curr col is last and done of last col PE is high
            streamout_active: begin
                next_state_streamout = (curr_supplier[num_col-1] && (done[num_col-1])) ? streamout_inactive : streamout_active;
                is_vstreamout_global = 1'b1;
                // if curr_supplier is not stalled and done goes high, incr next supplier and who to *not* stall
                if (|(curr_supplier & done)) begin
                    next_supplier = curr_supplier<<1;
                    next_sel_mux2 = curr_sel_mux2<<1; 
                end
            end
            streamout_inactive: begin
                // If any streamout go high, setup control signals
                if (|is_vstreamout) begin
                    next_state_streamout = streamout_active;
                    next_sel_mux2 = {{(num_col-1){1'b0}},1'b1};
                    streamout_addr = rd_addr;
                end else begin
                    next_state_streamout = streamout_inactive;
                    next_supplier = {{(num_col-1){1'b0}},1'b1}; 
                    next_sel_mux2 = '0;
                    is_vstreamout_global <= '0;
                end
            end            
        endcase
    end
    
    
endmodule
