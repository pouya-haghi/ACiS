//including interfcae and testcase files
`ifndef interface_sync_FIFO
    `define interface_sync_FIFO
    `include "interface_sync_FIFO.sv"
`endif

//-------------------------[NOTE]---------------------------------
//Particular testcase can be run by uncommenting, and commenting the rest
`ifndef test_sync_FIFO_VR
    `define test_sync_FIFO_VR
    `include "test_sync_FIFO_VR.sv"
`endif
//`include "directed_test.sv"
//----------------------------------------------------------------

module tbench_top;
  
//  parameter fifo_size = tb_fifo_size;
  //clock and reset signal declaration
  bit clk;
  bit rst;
  
  //clock generation
  always #5 clk = ~clk;
  
  //reset Generation
  initial begin
    clk = 0;
    rst = 0;
    #17; 
    rst = 1;
    #20;
    rst = 0;
  end
  
  
  //creatinng instance of interface, inorder to connect DUT and testcase
  intf i_intf(clk,rst);
  
  //Testcase instance, interface handle is passed to test as an argument
  test t1(i_intf);
  
  //DUT instance, interface signals are connected to the DUT ports
  sync_FIFO #(.fifo_width(tb_fifo_width), .fifo_size(tb_fifo_size))  DUT (
    .clk(i_intf.clk),
    .rst(i_intf.rst),
    .push(i_intf.push),
    .pop(i_intf.pop),
    .din(i_intf.din),
    .dout(i_intf.dout),
    .empty(i_intf.empty),
    .full(i_intf.full)
   );
  
  //enabling the wave dump
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule