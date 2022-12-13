`ifndef INCLUDE_SYNC_FIFO
    `define INCLUDE_SYNC_FIFO
    `include "include_sync_FIFO.vh"
`endif

class transaction;
  
  //declaring the transaction items
  rand bit [tb_fifo_width-1:0] din;
  rand bit push;
  rand bit pop;
       bit [tb_fifo_width-1:0] dout;
       bit empty;
       bit full;
       
  function void display(string name);
    $display("-------------------------");
    $display("- %s ",name);
    $display("-------------------------");
    $display("- push = %0d, pop = %0d, din = %0d", push, pop, din);
    $display("- empty = %0d, full = %0d, dout = %0d", empty, full, dout);
    $display("-------------------------");
  endfunction
endclass