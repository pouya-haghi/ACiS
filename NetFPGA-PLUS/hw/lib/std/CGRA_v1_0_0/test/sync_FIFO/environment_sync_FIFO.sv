`ifndef scoreboard_sync_FIFO
    `define scoreboard_sync_FIFO
    `include "scoreboard_sync_FIFO.sv"
`endif

`ifndef monitor_sync_FIFO
    `define monitor_sync_FIFO
    `include "monitor_sync_FIFO.sv"
`endif

`ifndef driver_sync_FIFO
    `define driver_sync_FIFO
    `include "driver_sync_FIFO.sv"
`endif

`ifndef generator_sync_FIFO
    `define generator_sync_FIFO
    `include "generator_sync_FIFO.sv"
`endif

`ifndef transaction_sync_FIFO
    `define transaction_sync_FIFO
    `include "transaction_sync_FIFO.sv"
`endif

class environment;
  
  //generator and driver instance
  generator 	gen;
  driver    	driv;
  monitor   	mon;
  scoreboard	scb;
  
  //mailbox handle's
  mailbox gen2driv;
  mailbox mon2scb;
  
  //virtual interface
  virtual intf vif;
  
  //constructor
  function new(virtual intf vif);
    //get the interface from test
    this.vif = vif;
    
    //creating the mailbox (Same handle will be shared across generator and driver)
    gen2driv = new();
    mon2scb  = new();
    
    //creating generator and driver
    gen  = new(gen2driv);
    driv = new(vif,gen2driv);
    mon  = new(vif,mon2scb);
    scb  = new(mon2scb);
  endfunction
  
  //
  task pre_test();
    driv.reset();
  endtask
  
  task test();
    fork 
      gen.main();
      driv.main();
      mon.main();
      scb.main();
    join_any
  endtask
  
  task post_test();
    wait(gen.ended.triggered);
    wait(gen.repeat_count == driv.no_transactions); //Optional
    wait(gen.repeat_count == scb.no_transactions);
  endtask  
  
  //run task
  task run;
    pre_test();
    test();
    post_test();
    $finish;
  endtask
  
endclass