
//gets the packet from monitor, Generated the expected result and compares with the //actual result recived from Monitor
`ifndef INCLUDE_SYNC_FIFO
    `define INCLUDE_SYNC_FIFO
    `include "include_sync_FIFO.vh"
`endif

`ifndef transaction_sync_FIFO
    `define transaction_sync_FIFO
    `include "transaction_sync_FIFO.sv"
`endif

class scoreboard;
   
  //creating mailbox handle
  mailbox mon2scb;
  
  //used to count the number of transactions
  int no_transactions = 0;
  int smart_ptr = 0;
  
  //constructor
  function new(mailbox mon2scb);
    //getting the mailbox handles from  environment 
    this.mon2scb = mon2scb;
  endfunction
  
  //Compares the Actual result with the expected result
  task main;
    transaction trans;
    forever begin
      mon2scb.get(trans);
      if (trans.push && trans.pop) begin
        if (smart_ptr == 0)
            if (trans.empty == 1)
                $display("Result is as expected\n");
            else
                $error("Wrong Result\n");
      end
      else if (trans.push) begin
        if (smart_ptr < tb_fifo_size)
            smart_ptr++;
        if (smart_ptr == tb_fifo_size) begin
            if (trans.full == 1)
                $display("Result is as expected\n");
            else
                $error("Wrong Result\n");
        end          
      end
      
      else if (trans.pop) begin
        if (smart_ptr > 0)
            smart_ptr--;
        if (smart_ptr == 0) begin
            if (trans.empty == 1)
                $display("Result is as expected\n");
            else
                $error("Wrong Result\n");
        end          
      end

      no_transactions++;
      trans.display("[ Scoreboard ]");
    end
  endtask
  
endclass