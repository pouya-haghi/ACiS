`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module (input logic [entry_sz_state-1:0] entry_table,
        input logic clk,
        input logic rst,
        output logic [dwidth_double-1:0] itr_i, // outer-most loop
        output logic [dwidth_double-1:0] itr_j,
        output logic [dwidth_double-1:0] itr_k, // inner-most loop
        output logic [dwidth_RFadd-1:0] smart_ptr, // ptr to state_table and config_table
        output logic done
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
localparam [1:0] level_k = 2'b00;
localparam [1:0] level_j = 2'b01;
localparam [1:0] level_i = 2'b10;

logic valid;
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
asign num_sc = entry_table[12:8];
assign type_entry = entry_table[14:13];
assign triggered_on = entry_table[46:15];


always@(posedge clk) begin
  if(rst) begin
    // They are all registers
    t_smart_ptr = 0;
    t_itr_i = 0;
    t_itr_j = 0;
    t_itr_k = 0;
    cmp_i = 0;
    cmp_j = 0;
    cmp_k = 0;
    label_j = 0;
    label_k = 0;
  end
  else begin
    if (valid && type_entry == init) begin// init type
      if (level == level_k) begin
        cmp_k = triggered_on; // write to cmp registers
      end
      else if (level == level_j) begin
        cmp_j = triggered_on; // write to cmp registers
        label_j = t_smart_ptr + 1; // write the address of current state_table+1 to label registers
      end
      else if (level == level_i) begin
        cmp_i = triggered_on; // write to cmp registers
        label_k = t_smart_ptr +1; // write the address of current state_table+1 to label registers
      end
      t_smart_ptr = t_smart_ptr + 1; // increment smart_ptr
    end
    else if (valid && type_entry == bodyAndCheckEnd) begin // bodyAndCheckEnd state
      if (sc == num_sc - 1) begin
        if (cmp_k == t_itr_k + 1 && level == level_k) //check_end is true
          t_itr_k = 0; // reset the current itr
        else if (cmp_j == t_itr_j + 1 && level == level_j) // chceck_end is true
          t_itr_j = 0; // reset the current itr
        else if (cmp_i == t_itr_i + 1 && level == level_i) // check_end is true
          t_itr_i = 0; // reset the current itr
        t_smart_ptr = t_smart_ptr + 1; // increment smart_ptr
        else if (cmp_k != t_itr_k + 1 && cmp_j != t_itr_j + 1 && cmp_i != t_itr_i + 1) begin //check_end is not true
          if (level == level_k)
            t_itr_k = t_itr_k + 1; // increment current itr
          else if (level == level_j) begin
            t_itr_j = t_itr_j + 1; // increment current itr
            t_smart_ptr = label_j; // jmp to current label
          end
          else if (level == level_i) begin
            t_itr_i = t_itr_i + 1; // increment current itr
            t_smart_ptr = label_k; // jmp to current label
          end
        end
      end
      else
        t_smart_ptr = t_smart_ptr + 1; // increment smart_ptr
    end
  end
end

always_comb begin
  if(t_smart_ptr==0) done = 1'b0; // to avoid asserting done when we even havent started yet
  else begin
    if(valid) done = 1'b0;
    else done = 1'b1;
  end
end

assign smart_ptr = t_smart_ptr;

assign itr_i = {dwidth_int{1'b0}, t_itr_i};
assign itr_j = {dwidth_int{1'b0}, t_itr_j};
assign itr_k = {dwidth_int{1'b0}, t_itr_k};
endmodule
