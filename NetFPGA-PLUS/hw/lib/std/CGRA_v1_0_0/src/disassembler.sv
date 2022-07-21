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
    logic [5:0] itr_cnt, itr_cnt_next;
    
    always @(posedge clk) begin
       if(rst) begin
          state_prev <= IDLE;
          itr_cnt_next <= '0;
       end
       else begin
          state_prev <= state;
          itr_cnt <= itr_cnt_next;
       end
    end
    
    always_comb begin
        case(state_prev)
            IDLE: state = ((!(&empty) && tready && tvalid && !tlast) ? HEADER : IDLE);

            HEADER: begin
                if (tready && tvalid) begin
                    if(tlast) begin                   // if no payload
                        state = IDLE;
                        itr_cnt_next = '0;
                    end
                    else if (itr_cnt < (6'd40-6'd1)) begin   // if count < 40
                        state = HEADER;
                        itr_cnt_next = itr_cnt + 1;
                    end else begin                    // if count == 40
                        state = PAYLOAD;
                        itr_cnt_next = '0;
                    end
                end
            end
            
            PAYLOAD: state = ((tready && tvalid && tlast) ? IDLE : PAYLOAD);

        endcase 
    end 

endmodule
