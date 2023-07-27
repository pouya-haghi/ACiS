`timescale 1ns / 1ps


module sync_FIFO #(parameter fifo_width=32,
                   parameter fifo_size=16) (
    input logic clk,
    input logic rst,
    input logic push,
    input logic pop,
    input logic [fifo_width-1:0] din,
    output logic [fifo_width-1:0] dout,
    output logic empty,
    output logic full
    );

    localparam dwidth_size = $clog2(fifo_size);
    logic [dwidth_size:0] fifo_counter;
    
    logic [dwidth_size-1:0] rd_ptr, wr_ptr;
    logic [dwidth_size-1:0] wr_ptr_d1, wr_ptr_d2;
    // pointer to read and write addresses
    logic [fifo_width-1:0] buf_mem[fifo_size-1:0];
     //
    
    always_comb
      begin
         empty = (fifo_counter==0);
            // Checking for whether buffer is empty or not
         full = (fifo_counter==fifo_size);
           //Checking for whether buffer is full or not
      end

   //Setting FIFO counter value for different situations of read and write operations.
   always_ff @(posedge clk) begin
           if(rst)
             fifo_counter <= 0;
        // Reset the counter of FIFO
           else if((!full && push) && (!empty && pop))  //When doing read and write operation simultaneously
             fifo_counter <= fifo_counter;
        // At this state, counter value will remain same.
           else if(!full && push)// When doing only write operation
             fifo_counter <= fifo_counter + 1;
           else if(!empty && pop)//When doing only read operation
             fifo_counter <= fifo_counter - 1;
           else
             fifo_counter <= fifo_counter;
        // When doing nothing.
     end 

   always_ff@(posedge clk) begin
           if(rst)
             dout <= '0;
           else
             begin
                 if(pop && !empty)
                    dout <= buf_mem[rd_ptr];
                 else
                    dout <= '0; // we need this because we should make sure to set tvalid to zero when pop==0 (the above condition is not true)
             end 
     end
     
     assign wr_ptr_d1 = ~ wr_ptr;
     assign wr_ptr_d2 = ~ wr_ptr_d1;

   always_ff@(posedge clk)
     begin
           if(push && !full)
             buf_mem[wr_ptr_d2] <= din;
//           else
//             buf_mem[wr_ptr] <= buf_mem[wr_ptr];
     end

   always_ff@(posedge clk)
     begin
           if(rst)
             begin
                wr_ptr <= '0;
                rd_ptr <= '0;
             end
           else
             begin
                if(!full && push)
                   wr_ptr <= wr_ptr_d2 + 1;
                // On write operation, Write pointer points to next location
//                else
//                   wr_ptr <= wr_ptr;
                if(!empty && pop)
                   rd_ptr <= rd_ptr + 1;
                // On read operation, read pointer points to next location to be read
                else
                   rd_ptr <= rd_ptr;
             end 
     end
endmodule

