`ifndef MY_INTERFACE
  `define MY_INTERFACE
  `include "my_interface.vh"
`endif

//module register_pipe #(parameter width=32, 
//                       parameter numPipeStage = 6)
//                      (input logic [width-1:0] din,
//                      input logic clk,
//                      input logic rst,
//                      output logic [width-1:0] dout
//                      );
////  logic [((numPipeStage+1)*width)-1:0] t_dout;
////  assign t_dout[width-1:0] = din;
////  genvar i;
////  generate
////    for (i = 0; i < numPipeStage; i++) begin
////      reg_r #(width) reg_r_inst(t_dout[(width*(i+1))-1:width*i],
////                                clk,
////                                rst,
////                                t_dout[(width*(i+2))-1:width*(i+1)]);
////    end
////  endgenerate
////  assign dout = t_dout[((numPipeStage+1)*width)-1:numPipeStage*width];
//  logic [(numPipeStage*width)-1:0] t_dout;
//  always_ff @(posedge clk) begin
//    if (rst) t_dout <='0;
//    else t_dout <= {t_dout[((numPipeStage-1)*width)-1:0], din};
//  end
//  assign dout = t_dout[((numPipeStage)*width)-1:(numPipeStage-1)*width];

//endmodule // register_pipe
module register_pipe #(parameter width = 8, parameter numPipeStage = 3) (
input logic clk,                                  //clock
input logic ce,                                   //clock enable                        
input logic rst,                                  //reset
input logic [width-1:0] din,                  //data in
output logic [width-1:0] dout                 //data out
);
    
logic [width-1:0] sr [numPipeStage-1:0];  

          
logic [width-1:0] temp;
always@(posedge clk or posedge rst)
    temp <=  din;


generate
genvar i;
for(i = 0;i < numPipeStage;i = i + 1)
begin
    always@(posedge clk or posedge rst)
    begin
        if(rst)                          
        begin
            sr[i] <= 'd0;
        end
        else
        begin
            if(ce)                            //the shift register operates only when the clock-enable is active
            begin
                if(i == 'd0)
                begin
                    sr[i] <= din;
                end
                else
                begin
                    sr[i] <= sr[i-1];
                end
            end
        end
    end
end
endgenerate
assign dout = sr[numPipeStage-1];
endmodule
