`timescale 1ns / 1ps
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module disassembler(
    input logic                   clk,
    input logic                   rst,
    input logic                   tready,
    input logic                   tlast,
    input logic                   tvalid,
    input logic [SIMD_degree-1:0] empty,
    output logic [1:0]            state
    );
    
    logic [1:0] state_prev, state_o;
    localparam [1:0] IDLE = 2'b00, HEADER = 2'b01, PAYLOAD = 2'b10;
    
    always_ff @(posedge clk) begin
       if(rst) begin
          state_prev <= IDLE;
       end
       else begin
          state_prev <= state_o;
       end
    end
    
    always_comb begin
        if (tready && tvalid) begin
            case(state_prev)
                IDLE: state_o = (!(&empty) && !tlast) ? HEADER : IDLE;
    
                HEADER: state_o = (tlast) ? IDLE : PAYLOAD;
                
                PAYLOAD: state_o = (tlast) ? IDLE : PAYLOAD;
                
                default: state_o = IDLE;
            endcase 
        end
        else begin
            state_o = state_prev;
        end
    end
    
    assign state = state_o;

endmodule
