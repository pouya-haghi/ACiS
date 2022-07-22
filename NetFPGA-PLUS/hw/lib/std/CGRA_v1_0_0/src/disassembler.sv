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
    
    logic [1:0] state_prev;
    logic [1:0] IDLE = 2'b00;
    logic [1:0] HEADER = 2'b01;
    logic [1:0] PAYLOAD = 2'b10;
    
    always @(posedge clk) begin
       if(rst) begin
          state <= IDLE;
       end
       else begin
          state_prev <= state;
       end
    end
    
    always_comb begin
        if (tready && tvalid) begin
            case(state_prev)
                IDLE: state = (!(&empty) && !tlast) ? HEADER : IDLE;
    
                HEADER: state = (tlast) ? IDLE : PAYLOAD;
                
                PAYLOAD: state = (tlast) ? IDLE : PAYLOAD;
            endcase 
        end
    end

endmodule
