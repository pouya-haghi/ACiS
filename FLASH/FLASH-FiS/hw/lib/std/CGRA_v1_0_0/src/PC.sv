`timescale 1ns / 1ps

module PC #(
  parameter integer C_WIDTH  = 4
)
(
  input  wire               clk,
  input  wire               clken,
  input  wire               rst,
  input  wire               load,
  input  wire               incr,
  input  wire [C_WIDTH-1:0] load_value,
  output wire [C_WIDTH-1:0] count
);

localparam [C_WIDTH-1:0] C_INIT = {C_WIDTH{1'b0}};
reg [C_WIDTH-1:0] count_r = C_INIT;

assign count = count_r;

always @(posedge clk) begin
  if (rst) begin
    count_r <= C_INIT;
  end
  else if (clken) begin
    if (load) begin
      count_r <= load_value;
    end
    else if (incr) begin
      count_r <= count_r + 1'b1;
    end
    else
      count_r <= count_r;
  end
end

endmodule 