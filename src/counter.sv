`timescale 1ns / 1ps


module counter #(parameter width_counter = 4)(
    input logic start,
    input logic clk,
    input logic rst,
    output logic [width_counter-1:0] counter,
    output logic [width_counter-1:0] threshold,
    output logic done
    );
    
    always@(posedge clk) begin
        if (rst)
            counter = 0;
            
        else begin
            if (counter == threshold - 1) begin
                counter = 0;
            end
            else begin
//                if (counter == 0)
//                    done =
                counter = counter + 1;
            end
        end
    end
    
//    always @(posedge clk) begin
//        if (rst) 
//            curr_state = init;
//        else 
//            curr_stat = next_state;
            
//    end
    
//    always@(*) begin
//        if (curr_state == init && start == 1'b1)
//            next_state = execution;
//        else if (state == execution && t_done == 1'b1)
//            next_state = init;
        
//    end
    
endmodule
