`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module FSM(input logic [entry_sz_state-1:0] entry_table,
        input logic clk,
        input logic rst,
        output logic [dwidth_int-1:0] itr_i, // outer-most loop
        output logic [dwidth_int-1:0] itr_j,
        output logic [dwidth_int-1:0] itr_k, // inner-most loop
        output logic [dwidth_RFadd-1:0] smart_ptr, // ptr to state_table and config_table
        output logic done,
        input logic start_inbound,
        input logic start_stream_in,
        output logic ready // I have to wait (backpressure to stream_in) if start_inbound has not been asserted yet
        );

// k (inner-most loop) is handled differently than i and j b/c check_end is always with body
// but for i and j, we might have:
// for {
//    for{}
//    statements
//    }

// possible values for type_entry
localparam [1:0] init = 2'b00; //initialization; when you just see the paranthesis in the for Loops
localparam [1:0] bodyAndCheckEnd = 2'b01; // Body + end of for loop }
localparam [1:0] level_k = 2'b00; // level_k (innermost) is L=0
localparam [1:0] level_j = 2'b01;
localparam [1:0] level_i = 2'b10;

localparam [1:0] waiting = 2'b00;
localparam [1:0] inbound_started = 2'b01;
localparam [1:0] stream_in_started = 2'b10;
localparam [1:0] ready_state = 2'b11;

logic [1:0] next_state, curr_state;
logic valid;
logic t_done;
logic [1:0] level;
logic [4:0] sc;
logic [4:0] num_sc;
logic [1:0] type_entry;
logic [dwidth_int-1:0] triggered_on;
logic [dwidth_int-1:0] t_itr_i;
logic [dwidth_int-1:0] t_itr_j;
logic [dwidth_int-1:0] t_itr_k;
logic [dwidth_int-1:0] cmp_i;
logic [dwidth_int-1:0] cmp_j;
logic [dwidth_int-1:0] cmp_k;
logic [dwidth_RFadd-1:0] t_smart_ptr;
logic [dwidth_RFadd-1:0] label_j;
logic [dwidth_RFadd-1:0] label_k;


//assignments
assign valid = entry_table[0];
assign level = entry_table[2:1];
assign sc = entry_table[7:3];
assign num_sc = entry_table[12:8];
assign type_entry = entry_table[14:13];
assign triggered_on = entry_table[47:16];


always@(posedge clk) begin
  if(rst) begin
    // They are all registers
    t_smart_ptr = 0;
    t_itr_i = 0;
    t_itr_j = 0;
    t_itr_k = 0;
    cmp_i = 0; // cmp registers are used to store trigger_on from config tables which will be then compared to itr registers
    cmp_j = 0;
    cmp_k = 0;
    label_j = 0;
    label_k = 0;
  end
  else begin
    if (valid && type_entry == init) begin// init type
      if (level == level_k) begin
        cmp_k = triggered_on; // write to cmp registers
        t_smart_ptr = t_smart_ptr + 1; // increment smart_ptr
      end
      else if (level == level_j) begin
        cmp_j = triggered_on; // write to cmp registers
        label_j = t_smart_ptr + 1; // write the address of current state_table+1 to label registers
        t_smart_ptr = t_smart_ptr + 1; // increment smart_ptr
      end
      else if (level == level_i) begin
        cmp_i = triggered_on; // write to cmp registers
        label_k = t_smart_ptr +1; // write the address of current state_table+1 to label registers
        t_smart_ptr = t_smart_ptr + 1; // increment smart_ptr
      end
    end
    else if (valid && type_entry == bodyAndCheckEnd) begin // bodyAndCheckEnd state
      if (sc == num_sc - 1) begin
        if (level == level_k) begin
          if (cmp_k == t_itr_k + 1) begin //check_end is true
            t_itr_k = 0; // reset the current itr
            t_smart_ptr = t_smart_ptr + 1; // increment smart_ptr
          end
          else begin //check_end is not true
            t_itr_k = t_itr_k + 1; // increment current itr
          end
        end
        else if (level == level_j) begin 
          if (cmp_j == t_itr_j + 1) begin // chceck_end is true 
            t_itr_j = 0; // reset the current itr
            t_smart_ptr = t_smart_ptr + 1; // increment smart_ptr
          end 
          else begin //check_end is not true
            t_itr_j = t_itr_j + 1; // increment current itr
            t_smart_ptr = label_j; // jmp to current label
          end
        end
        else if (level == level_i) begin 
            if (cmp_i == t_itr_i + 1) begin // check_end is true
                t_itr_i = 0; // reset the current itr
                t_smart_ptr = t_smart_ptr + 1; // increment smart_ptr
            end 
            else begin //check_end is not true
                t_itr_i = t_itr_i + 1; // increment current itr
                t_smart_ptr = label_k; // jmp to current label
            end
        end
      end
      else // sc!= num_sc - 1
        t_smart_ptr = t_smart_ptr + 1; // increment smart_ptr
    end
  end
end

always_comb begin
  if(t_smart_ptr==0) t_done = 1'b0; // to avoid asserting done when we even havent started yet
  else begin
    if(valid) t_done = 1'b0;
    else t_done = 1'b1;
  end
end

assign smart_ptr = t_smart_ptr;
assign done = t_done;

assign itr_i = t_itr_i;
assign itr_j = t_itr_j;
assign itr_k = t_itr_k;

// state machine for generating ready signal:
// I have to wait (backpressure to stream_in) if start_inbound has not been asserted yet
always@(posedge clk) begin
    if (rst)
        curr_state = waiting;
    else 
        curr_state = next_state;
end

always@(*) begin
    if (curr_state == waiting && start_inbound == 1'b1) 
        next_state = inbound_started;
//    else if (curr_state == waiting && start_stream_in == 1'b1)
//        next_state = stream_in_started;
    else if (curr_state == inbound_started && start_stream_in == 1'b1)
        next_state = ready_state;
//    else if (curr_state == stream_in_started && start_inbound == 1'b1)
//        next_state = ready_state;
    else if (curr_state == ready_state && t_done == 1'b1)
        next_state = waiting;
end

assign ready = (curr_state == inbound_started)? 1'b1: 1'b0;

endmodule
