`timescale 1ns / 1ps


module counter_trigger #(parameter width_counter = 4,
                         parameter threshold = 9)
    (input logic clk,
    input logic rst,
    input logic trigger,
    output logic [width_counter-1:0] counter
    );
    
    always@(posedge clk) begin
        if (rst)
            counter = 0;
            
        else begin
            if (trigger == 1'b1 && counter == threshold - 1)
                counter = 0;
            else if (trigger == 1'b1) 
                counter = counter + 1;
        end
    end
    
endmodule
