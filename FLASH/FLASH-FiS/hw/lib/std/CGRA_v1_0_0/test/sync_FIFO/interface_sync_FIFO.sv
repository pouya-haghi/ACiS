`ifndef INCLUDE_SYNC_FIFO
    `define INCLUDE_SYNC_FIFO
    `include "include_sync_FIFO.vh"
`endif

interface intf(input logic clk,rst);
  
  //declaring the signals
  logic  push;
  logic  pop;
  logic  [tb_fifo_width-1:0] din;
  logic  [tb_fifo_width-1:0] dout;
  logic empty;
  logic full;
  
endinterface
