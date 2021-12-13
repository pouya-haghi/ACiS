`timescale 1ns / 1ps


module counter #(parameter trigger = 9)(
    input logic clk,
    input logic rst,
    output logic [3:0] counter
    );
    
    always@(posedge clk) begin
        if (rst)
            counter = 0;
            
        else begin
        if (counter == trigger - 1)
            counter = 0;
        else  
             counter = counter + 1;
        end
    end
    
endmodule
