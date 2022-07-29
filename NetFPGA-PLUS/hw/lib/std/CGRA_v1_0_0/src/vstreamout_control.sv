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
    output logic [num_col-1:0] supplier,
    output logic is_vstreamout_global,
    output logic [num_col-1:0] mux_control
    );
    
    // Stream out control FSM
    localparam streamout_active = 1'b1;
    localparam streamout_inactive = 1'b0;
    logic curr_state_streamout, next_state_streamout;
    logic [num_col-1:0] curr_supplier, next_supplier;
    logic [num_col-1:0] curr_mux_control, next_mux_control;

    assign supplier = curr_supplier;
    assign mux_control = curr_mux_control;

    always_ff @(posedge clk) begin
        if (rst) begin
            curr_state_streamout <= streamout_inactive;
            curr_supplier <= {{(num_col-1){1'b0}},1'b1}; 
            curr_mux_control <= '0;
            is_vstreamout_global <= 1'b0;
        end 
        else begin
            curr_state_streamout <= next_state_streamout;
            curr_supplier <= next_supplier;
            curr_mux_control <= next_mux_control;
        end
    end    
    
    always_comb begin
        case(curr_state_streamout)
            // If curr col is last and done of last col PE is high
            streamout_active: begin
                next_state_streamout = (curr_supplier[num_col-1] && (done[num_col-1])) ? streamout_inactive : streamout_active;
                is_vstreamout_global = 1'b1;
                // if curr_supplier is not stalled and done goes high, incr next supplier and who to *not* stall
                if (|(curr_supplier & done)) begin // if any of columns exceptthe last column is done (num_col should be at least 2) 
                    next_supplier = curr_supplier << 1;
                    next_mux_control = curr_mux_control << 1;
                end
                else begin
                    next_supplier = curr_supplier;
                    next_mux_control = curr_mux_control;
                end
            end
            streamout_inactive: begin
                is_vstreamout_global = 1'b0;
                // If any streamout go high, setup control signals
                if (&is_vstreamout) begin
                    next_state_streamout = streamout_active;
                    next_mux_control = {{(num_col-1){1'b0}},1'b1};
                end 
                else begin
                    next_state_streamout = streamout_inactive;
                    next_supplier = {{(num_col-1){1'b0}},1'b1}; 
                    next_mux_control = '0;
                end
            end            
        endcase
    end
    
endmodule
