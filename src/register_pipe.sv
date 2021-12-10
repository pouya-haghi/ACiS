`ifndef MY_INTERFACE
  `define MY_INTERFACE
  `include "my_interface.vh"
`endif

module register_pipe #(parameter width=32, 
                       parameter numPipeStage = 6)
                      (input logic [width-1:0] din,
                      input logic clk,
                      input logic rst,
                      output logic [(numPipeStage*width)-1:0] dout
                      );
  logic [((numPipeStage+1)*width)-1:0] t_dout;
  assign t_dout[width-1:0] = din;
  genvar i;
  generate
    for (i = 0; i < numPipeStage; i++) begin
      reg_r #(width) reg_r_inst(t_dout[(width*(i+1))-1:width*i],
                                clk,
                                rst,
                                t_dout[(width*(i+2))-1:width*(i+1)]);
    end
  endgenerate
  assign dout = t_dout[((numPipeStage+1)*width)-1:width];

endmodule // register_pipe
