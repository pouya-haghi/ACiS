
#include "ap_axi_sdata.h"
#include "ap_int.h"
#include "hls_stream.h"

#define DWIDTH 512
#define TDWIDTH 16
#define UWIDTH 96
#define IWIDTH 32 // integer size
#define RWIDTH 12 //number of bits required for the address of vector register file
#define NUM_RANK 2
#define NUM_COL 2
// #define MAX_BUFFER_SIZE 22528 // 1408*8*NUM_RANK(=2) -- it should be multiples of 1408 -- in this example, we have 8 tlast for input stream and 2*8 tlast for output stream (b/c its allgether)
#define DEPTH_CONFIG 512
#define DEPTH_VRF 4096

// template<int D,int U,int TI,int TD>
// struct ap_axis{
//  ap_int<D> data;
//  ap_uint<D/8> keep;
//  ap_uint<D/8> strb;
//  ap_uint<U> user;
//  ap_uint<1> last;
//  ap_uint<TI> id;
//  ap_uint<TD> dest;
// };

// template<int D,int U,int TI,int TD>
// struct ap_axiu{
//  ap_uint<D> data;
//  ap_uint<D/8> keep;
//  ap_uint<D/8> strb;
//  ap_uint<U> user;
//  ap_uint<1> last;
//  ap_uint<TI> id;
//  ap_uint<TD> dest;
// };

// Note: tvalid and tready are always there! In other words, when you use "void example(int A[50], int B[50]) { #pragma HLS INTERFACE axis port=A"
// then you will have mandatory signals {tdata, tvalid, tready} but when you use ap_axiu struct you are adding optional signals like keep, strb, ... to
// {tdata, tvalid, tready}. They will be left unconnected if the downstream does not use them. 

typedef ap_axiu<DWIDTH, UWIDTH, 1, TDWIDTH> pkt;

extern "C" {
void krnl_loopback(
                 ap_uint<DWIDTH>  *mm_inst,  // Read-Only Vector 1
                 ap_uint<DWIDTH>  *mm_data0, 
                 ap_uint<DWIDTH>  *mm_data1,
                 ap_uint<DWIDTH>  *mm_debug,
                 hls::stream<pkt> &n2k,    // Internal Stream
                 hls::stream<pkt> &k2n,
                 unsigned int     size     // Size in bytes (size-local)
               ) {
#pragma HLS INTERFACE m_axi port = mm_inst offset = slave bundle = gmem0
#pragma HLS INTERFACE m_axi port = mm_data0 offset = slave bundle = gmem1
#pragma HLS INTERFACE m_axi port = mm_data1 offset = slave bundle = gmem2
// For Debug Purposes
#pragma HLS INTERFACE m_axi port = mm_debug offset = slave bundle = gmem3
// End Debug
#pragma HLS INTERFACE axis port = n2k
#pragma HLS INTERFACE axis port = k2n
#pragma HLS INTERFACE s_axilite port = mm_inst bundle = control
#pragma HLS INTERFACE s_axilite port = mm_data0 bundle = control
#pragma HLS INTERFACE s_axilite port = mm_data1 bundle = control
// Debug stuff
#pragma HLS INTERFACE s_axilite port = mm_debug bundle = control
// End Debug
#pragma HLS INTERFACE s_axilite port = size bundle = control
#pragma HLS INTERFACE s_axilite port = return bundle = control
#pragma HLS stream variable=n2k depth=4096 // set FIFO depth
#pragma HLS stream variable=k2n depth=4096 // set FIFO depth

  unsigned int bytes_per_beat = (DWIDTH / 8);
  unsigned int size_tot = NUM_RANK * size;
  unsigned int num_iter_local = (size / bytes_per_beat);
  unsigned int num_iter_global = (size_tot / bytes_per_beat);
  unsigned int debug_iter = 0;
  //unsigned int count = 0:

data_mover:
//   int i = 0;
  /*. For larger # of nodes, use:
  static unsigned int buffer_idx[NUM_RANK] = {0, 0};
  #pragma HLS ARRAY_PARTITION variable=buffer_idx complete dim=0
  #pragma HLS UNROLL
  */
  unsigned int global_in = 0; // for input matrix
  unsigned int global_out0 = 0; // for output matrix
  unsigned int global_out1 = 0; // for output matrix
  
  static ap_uint<9> pc0[NUM_RANK] = {0}; // log(DEPTH_CONFIG)
  #pragma HLS ARRAY_PARTITION variable=pc0 type=complete dim=1
  
  static ap_uint<9> pc1[NUM_RANK] = {0}; // log(DEPTH_CONFIG)
  #pragma HLS ARRAY_PARTITION variable=pc1 type=complete dim=1

  static ap_uint<RWIDTH> VLEN0[NUM_RANK] = {0};
  #pragma HLS ARRAY_PARTITION variable=VLEN0 type=complete dim=1
   
  static ap_uint<RWIDTH> VLEN1[NUM_RANK] = {0};
  #pragma HLS ARRAY_PARTITION variable=VLEN1 type=complete dim=1
  
  static ap_uint<3> VLEN_mode0[NUM_RANK] = {0};
  #pragma HLS ARRAY_PARTITION variable=VLEN_mode0 type=complete dim=1

  static ap_uint<3> VLEN_mode1[NUM_RANK] = {0};
  #pragma HLS ARRAY_PARTITION variable=VLEN_mode1 type=complete dim=1

  // static ap_uint<8> read_pkt0={0};
  // static ap_uint<8> read_pkt1={0};

  pkt pkt_in;
  pkt pkt_out;
  pkt pkt_in_first_beat;

  ap_uint<8> recvd_this_IP;
  ap_uint<8> recvd_this_Port;
  ap_uint<8> this_rank;
  ap_uint<DWIDTH> fetched;
  ap_uint<IWIDTH> instr0, instr1, save_instr0, save_instr1;
  ap_uint<IWIDTH> save_instr0_r0, save_instr1_r0, save_instr0_r1, save_instr1_r1;
  ap_uint<4> op0 = 1;
  ap_uint<4> op1 = 1;
  ap_uint<RWIDTH> VLEN0_mux, VLEN1_mux;
  ap_uint<3> VLEN_mode0_mux, VLEN_mode1_mux;
  ap_uint<12> beq_immediate0, beq_immediate1;
  ap_uint<5> first_rs0, first_rs1, second_rs0, second_rs1;
  ap_uint<5> rd0, rd1;
  ap_uint<5> second_vs0, second_vs1;
  ap_uint<5> vd0, vd1;
  ap_int<IWIDTH> addi_immediate0, addi_immediate1;
  ap_int<IWIDTH> lui_immediate0, lui_immediate1;
  ap_uint<RWIDTH> vr_addr0, vr_addr1;
  ap_uint<RWIDTH> vw_addr0, vw_addr1;
  ap_uint<RWIDTH> vs_count0, vs_count1;
  ap_uint<RWIDTH> vrf_idx0, vrf_idx1;
  ap_uint<DWIDTH> vrf_data0, vrf_data1;
  ap_uint<DWIDTH> srf_data0, srf_data1;
  ap_uint<DWIDTH> vrf_data_out0, vrf_data_out1;
  ap_int<IWIDTH> first_dr0, first_dr1;
  ap_int<IWIDTH> second_dr0, second_dr1;
  ap_uint<DWIDTH> fetched_mm0, fetched_mm1;
  ap_uint<IWIDTH> idx_mm0, idx_mm1; 
  ap_uint<RWIDTH> vr_addr_sout0, vr_addr_sout1;
  // ap_uint<8> stall_vmacc_0, stall_vmacc_1;
  ap_uint<8> lock0, lock1;
  ap_uint<256> debug_info;
  ap_uint<9> save_pc0, save_pc1;

  static ap_uint<IWIDTH> config_table0[DEPTH_CONFIG] = {0}; // when u use static you dont need to spend cycles for the initialization of memory and it is instead embedded into bitstream generation
  #pragma HLS BIND_STORAGE variable=config_table0 type=RAM_2P impl=BRAM

  static ap_uint<IWIDTH> config_table1[DEPTH_CONFIG] = {0};
  #pragma HLS BIND_STORAGE variable=config_table1 type=RAM_2P impl=BRAM

  static ap_int<IWIDTH> rf0[32][NUM_RANK] = {0};
  #pragma HLS BIND_STORAGE variable=rf0 type=RAM_2P impl=BRAM
  #pragma HLS ARRAY_PARTITION variable=rf0 type=complete dim=2

  static ap_int<IWIDTH> rf1[32][NUM_RANK] = {0};
  #pragma HLS BIND_STORAGE variable=rf1 type=RAM_2P impl=BRAM
  #pragma HLS ARRAY_PARTITION variable=rf1 type=complete dim=2

  static ap_uint<DWIDTH> vrf0[DEPTH_VRF][NUM_RANK] = {0};
  #pragma HLS BIND_STORAGE variable=vrf0 type=RAM_2P impl=BRAM
  #pragma HLS ARRAY_PARTITION variable=vrf0 type=complete dim=2

  static ap_uint<DWIDTH> vrf1[DEPTH_VRF][NUM_RANK] = {0};
  #pragma HLS BIND_STORAGE variable=vrf1 type=RAM_2P impl=BRAM
  #pragma HLS ARRAY_PARTITION variable=vrf1 type=complete dim=2

  // Fetching from instr. memory
  for(unsigned int i=0; i<DEPTH_CONFIG; i++){
    #pragma HLS PIPELINE II=1
     fetched = mm_inst[i];
     config_table0[i] = fetched.range(31,0);
     config_table1[i] = fetched.range(63,32);
  }

  // START SETUP PHASE -- Execute all instr. till vmacc (do it for all of the ranks)
  // This ensures everything is all set before packet processing (relaxes FIFO depth)
  for (unsigned int my_rank = 0; my_rank < NUM_RANK; my_rank++){
    #pragma HLS PIPELINE II=1
    save_instr1 = instr1;
    save_instr0 = instr0;
   
    while(op0!=0 || op1!=0){ // while we havent reached to vmacc for all columns
    #pragma HLS PIPELINE II=1
    // Fetch
    instr0 = config_table0[pc0[my_rank]];
    instr1 = config_table1[pc1[my_rank]];
    
    // Debug 
    if (my_rank == 0) {
    debug_info = (0, (0, (ap_uint<32>(pc1[my_rank]), (ap_uint<32>(pc0[my_rank]), (0, (0, (instr1, instr0))))))); // (pc1[rank1], pc0[rank1], pc1[rank0], pc0[rank0], instr1[rank1], instr0[rank1], instr1[rank0], instr0[rank0])
    }
    else{
    debug_info = (ap_uint<32>(pc1[my_rank]), (ap_uint<32>(pc0[my_rank]),  (ap_uint<32>(pc1[0]), (ap_uint<32>(pc0[0]),  (instr1, (instr0, (save_instr1, save_instr0))))))); 
    }
    mm_debug[debug_iter] = ap_uint<DWIDTH>(debug_info);
    debug_iter++;

    // Decode (first cycle)
    // no need to include wfi and vstreamout for now
    if (instr0.range(6,0)==0x57 && instr0.range(14,12)==0x0){
      op0 = 0; // MAC
      // read_pkt0 = 1;
    }
    else if (instr0.range(6,0)==0x07){
      op0 = 1; // vle32
      // read_pkt0 = 0;
    }
    else if (instr0.range(6,0)==0x57 && instr0.range(14,12)==0x7){
      op0 = 2; // vsetivli
      // read_pkt0 = 0;
    }
    else if(instr0.range(6,0)==0x7F){
      op0 = 3; // vstreamout
      // read_pkt0 = 0;
    }
    else if (instr0.range(6,0)==0x63 && instr0.range(14,12)==0x1){
      op0 = 4; // bne
      // read_pkt0 = 0;
    }
    else if (instr0.range(6,0)==0x13 && instr0.range(14,12)==0x0){
      op0 = 5; // addi
      // read_pkt0 = 0;
    }
    else if (instr0.range(6,0)==0x37){
      op0 = 6; //lui
      // read_pkt0 = 0;
    }
    else if (instr0.range(6,0)==0x33 && instr0.range(14,12)==0x0 && instr0.range(31,25)==0x0){
      op0 = 7; // add
      // read_pkt0 = 0;
    }
    else if (instr0 == 0x10500073){
      op0 = 8; //wfi
      // read_pkt0 = 1;
    }
    else {
      op0 = 9; // invalid instr.
      // read_pkt0 = 0;
    }

    if (instr1.range(6,0)==0x57 && instr1.range(14,12)==0x0){
      op1 = 0; // MAC
      // read_pkt1 = 1;
    }
    else if (instr1.range(6,0)==0x07){
      op1 = 1; // vle32
      // read_pkt1 = 0;
    }
    else if (instr1.range(6,0)==0x57 && instr1.range(14,12)==0x7){
      op1 = 2; // vsetivli
      // read_pkt1 = 0;
    }
    else if(instr1.range(6,0)==0x7F){
      op1 = 3; // vstreamout
      // read_pkt1 = 0;
    }
    else if (instr1.range(6,0)==0x63 && instr1.range(14,12)==0x1){
      op1 = 4; // bne
      // read_pkt1 = 0;
    }
    else if (instr1.range(6,0)==0x13 && instr1.range(14,12)==0x0){
      op1 = 5; // addi
      // read_pkt1 = 0;
    }
    else if (instr1.range(6,0)==0x37){
      op1 = 6; //lui
      // read_pkt1 = 0;
    }
    else if (instr1.range(6,0)==0x33 && instr1.range(14,12)==0x0 && instr1.range(31,25)==0x0){
      op1 = 7; // add
      // read_pkt1 = 0;
    }
    else if (instr1 == 0x10500073){
      op1 = 8; //wfi
      // read_pkt1 = 1;
    }
    else {
      op1 = 9; // invalid instr.    
      // read_pkt1 = 0;
    }
    
    beq_immediate0 = (instr0[31],(instr0[7],(instr0.range(30,25), instr0.range(11,8)))); 
    beq_immediate1 = (instr1[31],(instr1[7],(instr1.range(30,25), instr1.range(11,8)))); 
    first_rs0 = instr0.range(19,15);
    second_rs0 = instr0.range(24,20);
    first_rs1 = instr1.range(19,15);
    second_rs1 = instr1.range(24,20);
    addi_immediate0 = ap_int<IWIDTH>(ap_int<12>(instr0.range(31,20)));
    addi_immediate1 = ap_int<IWIDTH>(ap_int<12>(instr1.range(31,20)));
    rd0 = instr0.range(11,7);
    rd1 = instr1.range(11,7);
    lui_immediate0 = (instr0.range(31,12), ap_int<12>(0));
    lui_immediate1 = (instr1.range(31,12), ap_int<12>(0));
    vd0 = instr0.range(11,7); // vd
    vd1 = instr1.range(11,7); // vd
    
    // Decode (second cycle) -- because these operations depend on op
    if(op0 == 2){ // vsetivli
      VLEN0[my_rank] = instr0.range(29,18);
      VLEN_mode0[my_rank] = instr0.range(17,15);}
    
    if(op1 == 2){ // vsetivli
      VLEN1[my_rank] = instr1.range(29,18);
      VLEN_mode1[my_rank] = instr1.range(17,15);}
    
    // Decode (third cycle) -- because these operations depend on either second_vs or VLEN_mode
    VLEN0_mux = VLEN0[my_rank];
    VLEN_mode0_mux = VLEN_mode0[my_rank];
    VLEN1_mux = VLEN1[my_rank];
    VLEN_mode1_mux = VLEN_mode1[my_rank];

    // Decode (fourth cycle) -- because these operations depend on VLEN_mode_mux
    if (VLEN_mode0_mux==0){
        // vr_addr0 = (second_vs0(0), ap_uint<11>(0)); 
        vw_addr0 = (vd0[0], ap_uint<11>(0)); 
    }
    else if (VLEN_mode0_mux==1){
        // vr_addr0 = (second_vs0.range(1,0), ap_uint<10>(0)); 
        vw_addr0 = (vd0.range(1,0), ap_uint<10>(0));  
    }
    else if (VLEN_mode0_mux==2){
        // vr_addr0 = (second_vs0.range(2,0), ap_uint<9>(0)); 
        vw_addr0 = (vd0.range(2,0), ap_uint<9>(0));  
    }
    else if (VLEN_mode0_mux==3){
        // vr_addr0 = (second_vs0.range(3,0), ap_uint<8>(0)); 
        vw_addr0 = (vd0.range(3,0), ap_uint<8>(0)); 
    }
    else if (VLEN_mode0_mux==4){
        // vr_addr0 = (second_vs0, ap_uint<7>(0)); 
        vw_addr0 = (vd0, ap_uint<7>(0));  
    }
    else{ // not valid
        // vr_addr0 = ap_uint<12>(0); 
        vw_addr0 = ap_uint<12>(0); 
    }

    if (VLEN_mode1_mux==0){
        // vr_addr1 = (second_vs1(0), ap_uint<11>(0)); 
        vw_addr1 = (vd1[0], ap_uint<11>(0)); 
    }
    else if (VLEN_mode1_mux==1){
        // vr_addr1 = (second_vs1.range(1,0), ap_uint<10>(0)); 
        vw_addr1 = (vd1.range(1,0), ap_uint<10>(0));  
    }
    else if (VLEN_mode1_mux==2){
        // vr_addr1 = (second_vs1.range(2,0), ap_uint<9>(0)); 
        vw_addr1 = (vd1.range(2,0), ap_uint<9>(0));  
    }
    else if (VLEN_mode1_mux==3){
        // vr_addr1 = (second_vs1.range(3,0), ap_uint<8>(0)); 
        vw_addr1 = (vd1.range(3,0), ap_uint<8>(0));  
    }
    else if (VLEN_mode1_mux==4){
        // vr_addr1 = (second_vs1.range(4,0), ap_uint<7>(0)); 
        vw_addr1 = (vd1.range(4,0), ap_uint<7>(0));  
    }
    else { // not valid
        // vr_addr1 = ap_uint<12>(0); 
        vw_addr1 = ap_uint<12>(0); 
    }

    // RegFile Read (scalar)
    first_dr0 = rf0[first_rs0][my_rank];
    second_dr0 = rf0[second_rs0][my_rank];
    first_dr1 = rf1[first_rs1][my_rank];
    second_dr1 = rf1[second_rs1][my_rank];
    
    // Exe (scalar)
    if (op0 == 7) // add
      rf0[rd0][my_rank] = first_dr0 + second_dr0;
    else if (op0 == 5) //addi
      rf0[rd0][my_rank] = first_dr0 + addi_immediate0;
    else if (op0 == 6) //lui
      rf0[rd0][my_rank] = lui_immediate0;

    if (op1 == 7) // add
      rf1[rd1][my_rank] = first_dr1 + second_dr1;
    else if (op1 == 5) //addi
      rf1[rd1][my_rank] = first_dr1 + addi_immediate1;
    else if (op1 == 6) //lui
      rf1[rd1][my_rank] = lui_immediate1;
    
    // update PC
    if (op0 == 4 && first_dr0!=second_dr0) //bne
      pc0[my_rank] = beq_immediate0.range(8,0);
    else if (op0 == 8 || op0 == 3 || op0 == 0) // wfi or vstreamout or vmacc
      pc0[my_rank] = pc0[my_rank]; // do not change pc anymore // later on i will change pc for vstreamout and vmacc if all of columns are finished
    else
      pc0[my_rank] = pc0[my_rank] + 1;

    if (op1 == 4 && first_dr1!=second_dr1) //bne
      pc1[my_rank] = beq_immediate1.range(8,0);
    else if (op1 == 8 || op1 == 3 || op1 == 0) // wfi or vstreamout or vmacc
      pc1[my_rank] = pc1[my_rank]; // do not change pc anymore // later on i will change pc for vstreamout and vmacc if all of columns are finished
    else
      pc1[my_rank] = pc1[my_rank] + 1;

    if(op0 == 1){ // vle32
      for (vs_count0=0; vs_count0<VLEN0_mux; vs_count0++){
        #pragma HLS LATENCY min=1 max=1000
        #pragma HLS PIPELINE II=1
        idx_mm0 = first_dr0 + vs_count0; // compute mm_data index
        fetched_mm0 = mm_data0[idx_mm0]; // fetch mm_data
        vrf_idx0 = vw_addr0 + vs_count0; // compute VRF index
        vrf0[vrf_idx0][my_rank] = fetched_mm0; // update vrf
      }
    }

    if(op1 == 1){ // vle32
      for (vs_count1=0; vs_count1<VLEN1_mux; vs_count1++){
        #pragma HLS LATENCY min=1 max=1000
        #pragma HLS PIPELINE II=1
        idx_mm1 = first_dr1 + vs_count1; // compute mm_data index
        fetched_mm1 = mm_data1[idx_mm1]; // fetch mm_data
        vrf_idx1 = vw_addr1 + vs_count1; // compute VRF index
        vrf1[vrf_idx1][my_rank] = fetched_mm1; // update vrf
      }
    }
  }
}

  lock0 = 0;
  lock1 = 0;
  // END SETUP PHASE
  // save_pc0 = pc0[1];
  // save_pc1 = pc1[1];
  // save_instr0 = instr0;
  // save_instr1 = instr1; 

  // Auto-pipeline is going to apply pipeline to this loop
  // while (global_in < num_iter_global || op0!=8 || op1!=8) { // and not wfi
  while (op0!=8 || op1!=8) { // and not wfi
    #pragma HLS PIPELINE II=1
    //Read incoming packet
    // it first waits till a valid stream_in
    // read only if lock = 0
    if (lock0 == 0 && lock1 == 0){ // synchronization of locks
      pkt_in_first_beat = n2k.read();
      this_rank = pkt_in.user.range(7,0); //myPort
    }
    // ----------- compute the incoming rank
    // recvd_this_IP = pkt_in.user.range(39,32);
    // this_rank = (ap_uint<16>(recvd_this_IP) << 8) | (ap_uint<16>(recvd_this_Port));
    // -----------

    // Fetch
    if(this_rank==0){
      instr0 = config_table0[pc0[0]];
      instr1 = config_table1[pc1[0]];
      save_instr1_r0 = instr1;
      save_instr0_r0 = instr0;
      debug_info = (ap_uint<32>(pc1[1]), (ap_uint<32>(pc0[1]), (ap_uint<32>(pc1[0]), (ap_uint<32>(pc0[0]), (save_instr1_r1, (save_instr0_r1, (instr1, instr0)))))));
    }
    else{
      instr0 = config_table0[pc0[1]];
      instr1 = config_table1[pc1[1]];
      save_instr1_r1 = instr1;
      save_instr0_r1 = instr0;
      debug_info = (ap_uint<32>(pc1[1]), (ap_uint<32>(pc0[1]), (ap_uint<32>(pc1[0]), (ap_uint<32>(pc0[0]), (instr1, (instr0, (save_instr1_r0, save_instr0_r0)))))));
    }
    mm_debug[debug_iter] = ap_uint<DWIDTH>(debug_info);
    debug_iter++;

    // Decode (first cycle)
    if (instr0.range(6,0)==0x57 && instr0.range(14,12)==0x0){
      op0 = 0; // MAC
      // read_pkt0 = 1;
      lock0 = 0;
    }
    else if (instr0.range(6,0)==0x07){
      op0 = 1; // vle32
      // read_pkt0 = 0;
      lock0 = 1;
    }
    else if (instr0.range(6,0)==0x57 && instr0.range(14,12)==0x7){
      op0 = 2; // vsetivli
      // read_pkt0 = 0;
      lock0 = 1;
    }
    else if(instr0.range(6,0)==0x7F){
      op0 = 3; // vstreamout
      // read_pkt0 = 0;
      lock0 = 1;
    }
    else if (instr0.range(6,0)==0x63 && instr0.range(14,12)==0x1){
      op0 = 4; // bne
      // read_pkt0 = 0;
      lock0 = 1;
    }
    else if (instr0.range(6,0)==0x13 && instr0.range(14,12)==0x0){
      op0 = 5; // addi
      // read_pkt0 = 0;
      lock0 = 1;
    }
    else if (instr0.range(6,0)==0x37){
      op0 = 6; //lui
      // read_pkt0 = 0;
      lock0 = 1;
    }
    else if (instr0.range(6,0)==0x33 && instr0.range(14,12)==0x0 && instr0.range(31,25)==0x0){
      op0 = 7; // add
      // read_pkt0 = 0;
      lock0 = 1;
    }
    else if (instr0 == 0x10500073){
      op0 = 8; //wfi
      // read_pkt0 = 1;
      lock0 = 0;
    }
    else {
      op0 = 9; // invalid instr.
      // read_pkt0 = 0;
      lock0 = 1;
    }

    if (instr1.range(6,0)==0x57 && instr1.range(14,12)==0x0){
      op1 = 0; // MAC
      // read_pkt1 = 1;
      lock1 = 0;
    }
    else if (instr1.range(6,0)==0x07){
      op1 = 1; // vle32
      // read_pkt1 = 0;
      lock1 = 1;
    }
    else if (instr1.range(6,0)==0x57 && instr1.range(14,12)==0x7){
      op1 = 2; // vsetivli
      // read_pkt1 = 0;
      lock1 = 1;
    }
    else if(instr1.range(6,0)==0x7F){
      op1 = 3; // vstreamout
      // read_pkt1 = 0;
      lock1 = 1;
    }
    else if (instr1.range(6,0)==0x63 && instr1.range(14,12)==0x1){
      op1 = 4; // bne
      // read_pkt1 = 0;
      lock1 = 1;
    }
    else if (instr1.range(6,0)==0x13 && instr1.range(14,12)==0x0){
      op1 = 5; // addi
      // read_pkt1 = 0;
      lock1 = 1;
    }
    else if (instr1.range(6,0)==0x37){
      op1 = 6; //lui
      // read_pkt1 = 0;
      lock1 = 1;
    }
    else if (instr1.range(6,0)==0x33 && instr1.range(14,12)==0x0 && instr1.range(31,25)==0x0){
      op1 = 7; // add
      // read_pkt1 = 0;
      lock1 = 1;
    }
    else if (instr1 == 0x10500073){
      op1 = 8; //wfi
      // read_pkt1 = 1;
      lock1 = 0;
    }
    else {
      op1 = 9; // invalid instr.    
      // read_pkt1 = 0;
      lock1 = 1;
    }
    
    beq_immediate0 = (instr0[31],(instr0[7],(instr0.range(30,25), instr0.range(11,8)))); 
    beq_immediate1 = (instr1[31],(instr1[7],(instr1.range(30,25), instr1.range(11,8)))); 
    first_rs0 = instr0.range(19,15);
    second_rs0 = instr0.range(24,20);
    first_rs1 = instr1.range(19,15);
    second_rs1 = instr1.range(24,20);
    addi_immediate0 = ap_int<IWIDTH>(ap_int<12>(instr0.range(31,20)));
    addi_immediate1 = ap_int<IWIDTH>(ap_int<12>(instr1.range(31,20)));
    rd0 = instr0.range(11,7);
    rd1 = instr1.range(11,7);
    lui_immediate0 = (instr0.range(31,12), ap_int<12>(0));
    lui_immediate1 = (instr1.range(31,12), ap_int<12>(0));
    vd0 = instr0.range(11,7); // vd
    vd1 = instr1.range(11,7); // vd
    
    // Decode (second cycle) -- because these operations depend on op
    second_vs0 = (op0==3)? instr0.range(11,7): instr0.range(24,20); // vs2
    second_vs1 = (op1==3)? instr1.range(11,7): instr1.range(24,20); // vs2
    if(this_rank==0){
      if(op0 == 2){ // vsetivli
        VLEN0[0] = instr0.range(29,18);
        VLEN_mode0[0] = instr0.range(17,15);}
    
      if(op1 == 2){ // vsetivli
        VLEN1[0] = instr1.range(29,18);
        VLEN_mode1[0] = instr1.range(17,15);}
    }
    else{
      if(op0 == 2){ // vsetivli
        VLEN0[1] = instr0.range(29,18);
        VLEN_mode0[1] = instr0.range(17,15);}
    
      if(op1 == 2){ // vsetivli
        VLEN1[1] = instr1.range(29,18);
        VLEN_mode1[1] = instr1.range(17,15);}
    }
    
    // Decode (third cycle) -- because these operations depend on either second_vs or VLEN_mode
    vr_addr0 = (ap_uint<7>(0), second_vs0); // always hardwired to the first VRF segment
    vr_addr1 = (ap_uint<7>(0), second_vs1); // always hardwired to the first VRF segment
    if(this_rank==0){
      VLEN0_mux = VLEN0[0];
      VLEN_mode0_mux = VLEN_mode0[0];
      VLEN1_mux = VLEN1[0];
      VLEN_mode1_mux = VLEN_mode1[0];
    }
    else{
      VLEN0_mux = VLEN0[1];
      VLEN_mode0_mux = VLEN_mode0[1];  
      VLEN1_mux = VLEN1[1];
      VLEN_mode1_mux = VLEN_mode1[1];
    }

    // Decode (fourth cycle) -- because these operations depend on VLEN_mode_mux
    if (VLEN_mode0_mux==0){
        // vr_addr0 = (second_vs0(0), ap_uint<11>(0)); 
        vw_addr0 = (vd0[0], ap_uint<11>(0)); 
        vr_addr_sout0 = (second_vs0[0], ap_uint<11>(0));
    }
    else if (VLEN_mode0_mux==1){
        // vr_addr0 = (second_vs0.range(1,0), ap_uint<10>(0)); 
        vw_addr0 = (vd0.range(1,0), ap_uint<10>(0));  
        vr_addr_sout0 = (second_vs0.range(1,0), ap_uint<10>(0));
    }
    else if (VLEN_mode0_mux==2){
        // vr_addr0 = (second_vs0.range(2,0), ap_uint<9>(0)); 
        vw_addr0 = (vd0.range(2,0), ap_uint<9>(0));  
        vr_addr_sout0 = (second_vs0.range(2,0), ap_uint<9>(0));
    }
    else if (VLEN_mode0_mux==3){
        // vr_addr0 = (second_vs0.range(3,0), ap_uint<8>(0)); 
        vw_addr0 = (vd0.range(3,0), ap_uint<8>(0)); 
        vr_addr_sout0 = (second_vs0.range(3,0), ap_uint<8>(0)); 
    }
    else if (VLEN_mode0_mux==4){
        // vr_addr0 = (second_vs0, ap_uint<7>(0)); 
        vw_addr0 = (vd0, ap_uint<7>(0));  
        vr_addr_sout0 = (second_vs0, ap_uint<7>(0));
    }
    else{ // not valid
        // vr_addr0 = ap_uint<12>(0); 
        vw_addr0 = ap_uint<12>(0); 
        vr_addr_sout0 = ap_uint<12>(0); 
    }

    if (VLEN_mode1_mux==0){
        // vr_addr1 = (second_vs1(0), ap_uint<11>(0)); 
        vw_addr1 = (vd1[0], ap_uint<11>(0)); 
        vr_addr_sout1 = (second_vs1[0], ap_uint<11>(0));
    }
    else if (VLEN_mode1_mux==1){
        // vr_addr1 = (second_vs1.range(1,0), ap_uint<10>(0)); 
        vw_addr1 = (vd1.range(1,0), ap_uint<10>(0));  
        vr_addr_sout1 = (second_vs1.range(1,0), ap_uint<10>(0));
    }
    else if (VLEN_mode1_mux==2){
        // vr_addr1 = (second_vs1.range(2,0), ap_uint<9>(0)); 
        vw_addr1 = (vd1.range(2,0), ap_uint<9>(0));  
        vr_addr_sout1 = (second_vs1.range(2,0), ap_uint<9>(0));
    }
    else if (VLEN_mode1_mux==3){
        // vr_addr1 = (second_vs1.range(3,0), ap_uint<8>(0)); 
        vw_addr1 = (vd1.range(3,0), ap_uint<8>(0));  
        vr_addr_sout1 = (second_vs1.range(3,0), ap_uint<8>(0)); 
    }
    else if (VLEN_mode1_mux==4){
        // vr_addr1 = (second_vs1.range(4,0), ap_uint<7>(0)); 
        vw_addr1 = (vd1.range(4,0), ap_uint<7>(0));  
        vr_addr_sout1 = (second_vs1, ap_uint<7>(0));
    }
    else { // not valid
        // vr_addr1 = ap_uint<12>(0); 
        vw_addr1 = ap_uint<12>(0); 
        vr_addr_sout1 = ap_uint<12>(0); 
    }

    // RegFile Read (scalar)
    if (this_rank==0){
      first_dr0 = rf0[first_rs0][0];
      second_dr0 = rf0[second_rs0][0];
      first_dr1 = rf1[first_rs1][0];
      second_dr1 = rf1[second_rs1][0];
    }
    else{
      first_dr0 = rf0[first_rs0][1];
      second_dr0 = rf0[second_rs0][1];
      first_dr1 = rf1[first_rs1][1];
      second_dr1 = rf1[second_rs1][1];
    }
    
    // Exe (scalar)
    if(this_rank == 0){
      if (op0 == 7) // add
        rf0[rd0][0] = first_dr0 + second_dr0;
      else if (op0 == 5) //addi
        rf0[rd0][0] = first_dr0 + addi_immediate0;
      else if (op0 == 6) //lui
        rf0[rd0][0] = lui_immediate0;

      if (op1 == 7) // add
        rf1[rd1][0] = first_dr1 + second_dr1;
      else if (op1 == 5) //addi
        rf1[rd1][0] = first_dr1 + addi_immediate1;
      else if (op1 == 6) //lui
        rf1[rd1][0] = lui_immediate1;
    }
    else{
      if (op0 == 7) // add
        rf0[rd0][1] = first_dr0 + second_dr0;
      else if (op0 == 5) //addi
        rf0[rd0][1] = first_dr0 + addi_immediate0;
      else if (op0 == 6) //lui
        rf0[rd0][1] = lui_immediate0;

      if (op1 == 7) // add
        rf1[rd1][1] = first_dr1 + second_dr1;
      else if (op1 == 5) //addi
        rf1[rd1][1] = first_dr1 + addi_immediate1;
      else if (op1 == 6) //lui
        rf1[rd1][1] = lui_immediate1;
    }
    
    // update PC
    if(this_rank==0){
      if (op0 == 4 && first_dr0!=second_dr0) //bne
        pc0[0] = beq_immediate0.range(8,0);
      else if (op0 == 8 || op0 == 3 || op0 == 0) // wfi or vstreamout or vmacc
        pc0[0] = pc0[0]; // do not change pc anymore // later on i will change pc for vstreamout and vmacc if all of columns are finished
      else
        pc0[0] = pc0[0] + 1;

      if (op1 == 4 && first_dr1!=second_dr1) //bne
        pc1[0] = beq_immediate1.range(8,0);
      else if (op1 == 8 || op1 == 3 || op1 == 0) // wfi or vstreamout or vmacc
        pc1[0] = pc1[0]; // do not change pc anymore // later on i will change pc for vstreamout and vmacc if all of columns are finished
      else
        pc1[0] = pc1[0] + 1;
    }
    else{
      if (op0 == 4 && first_dr0!=second_dr0) //bne
        pc0[1] = beq_immediate0.range(8,0);
      else if (op0 == 8 || op0 == 3 || op0 == 0) // wfi or vstreamout or vmacc
        pc0[1] = pc0[1]; // do not change pc anymore // later on i will change pc for vstreamout and vmacc if all of columns are finished
      else
        pc0[1] = pc0[1] + 1;

      if (op1 == 4 && first_dr1!=second_dr1) //bne
        pc1[1] = beq_immediate1.range(8,0);
      else if (op1 == 8 || op1 == 3 || op1 == 0) // wfi or vstreamout or vmacc
        pc1[1] = pc1[1]; // do not change pc anymore // later on i will change pc for vstreamout and vmacc if all of columns are finished
      else
        pc1[1] = pc1[1] + 1;
    }

    // EXE (vect)
    // synchronization
    if(op0 == 0 && op1 == 0){ // vmacc // PUT ALU-LIKE OPERATIONS IN THIS FOR LOOP 
      if (this_rank==0){
        srf_data0 = vrf0[vr_addr0][0];
        srf_data1 = vrf1[vr_addr1][0];
      }
      else{
        srf_data0 = vrf0[vr_addr0][1];
        srf_data1 = vrf1[vr_addr1][1];
      }
      for (vs_count0=0; vs_count0<VLEN0_mux; vs_count0++){
        #pragma HLS PIPELINE II=1
        vrf_idx0 = vw_addr0+vs_count0; // compute VRF index
        vrf_idx1 = vw_addr1+vs_count0; // compute VRF index
        if (this_rank == 0){
          vrf_data0 = vrf0[vrf_idx0][0]; // Read VRF
          vrf_data1 = vrf1[vrf_idx1][0]; // Read VRF
        }
        else{
          vrf_data0 = vrf0[vrf_idx0][1]; // Read VRF
          vrf_data1 = vrf1[vrf_idx1][1]; // Read VRF
        }
        // Processing
        // PUT AN IF HERE IF YOU WANNA SUPPORT OTHER ALU-LIKE OPERATIONS
        if (vs_count0==0){ // I had read this before
          pkt_in = pkt_in_first_beat;
        }
        else{
          pkt_in = n2k.read();
        }
        // this_rank = pkt_in.user.range(7,0); //no need to compute rank again b/c it should be same as before (pkt size is not less than VLEN)
        vrf_data_out0.range(31,0) = vrf_data0.range(31,0) + (pkt_in.data.range(31,0) * srf_data0.range(31,0));
        vrf_data_out0.range(63,32) = vrf_data0.range(63,32) + (pkt_in.data.range(63,32) * srf_data0.range(63,32));
        vrf_data_out0.range(95,64) = vrf_data0.range(95,64) + (pkt_in.data.range(95,64) * srf_data0.range(95,64));
        vrf_data_out0.range(127,96) = vrf_data0.range(127,96) + (pkt_in.data.range(127,96) * srf_data0.range(127,96));
        vrf_data_out0.range(159,128) = vrf_data0.range(159,128) + (pkt_in.data.range(159,128) * srf_data0.range(159,128));
        vrf_data_out0.range(191,160) = vrf_data0.range(191,160) + (pkt_in.data.range(191,160) * srf_data0.range(191,160));
        vrf_data_out0.range(223,192) = vrf_data0.range(223,192) + (pkt_in.data.range(223,192) * srf_data0.range(223,192));
        vrf_data_out0.range(255,224) = vrf_data0.range(255,224) + (pkt_in.data.range(255,224) * srf_data0.range(255,224));
        vrf_data_out0.range(287,256) = vrf_data0.range(287,256) + (pkt_in.data.range(287,256) * srf_data0.range(287,256));
        vrf_data_out0.range(319,288) = vrf_data0.range(319,288) + (pkt_in.data.range(319,288) * srf_data0.range(319,288));
        vrf_data_out0.range(351,320) = vrf_data0.range(351,320) + (pkt_in.data.range(351,320) * srf_data0.range(351,320));
        vrf_data_out0.range(383,352) = vrf_data0.range(383,352) + (pkt_in.data.range(383,352) * srf_data0.range(383,352));
        vrf_data_out0.range(415,384) = vrf_data0.range(415,384) + (pkt_in.data.range(415,384) * srf_data0.range(415,384));
        vrf_data_out0.range(447,416) = vrf_data0.range(447,416) + (pkt_in.data.range(447,416) * srf_data0.range(447,416));
        vrf_data_out0.range(479,448) = vrf_data0.range(479,448) + (pkt_in.data.range(479,448) * srf_data0.range(479,448));
        vrf_data_out0.range(511,480) = vrf_data0.range(511,480) + (pkt_in.data.range(511,480) * srf_data0.range(511,480));

        vrf_data_out1.range(31,0) = vrf_data1.range(31,0) + (pkt_in.data.range(31,0) * srf_data1.range(31,0));
        vrf_data_out1.range(63,32) = vrf_data1.range(63,32) + (pkt_in.data.range(63,32) * srf_data1.range(63,32));
        vrf_data_out1.range(95,64) = vrf_data1.range(95,64) + (pkt_in.data.range(95,64) * srf_data1.range(95,64));
        vrf_data_out1.range(127,96) = vrf_data1.range(127,96) + (pkt_in.data.range(127,96) * srf_data1.range(127,96));
        vrf_data_out1.range(159,128) = vrf_data1.range(159,128) + (pkt_in.data.range(159,128) * srf_data1.range(159,128));
        vrf_data_out1.range(191,160) = vrf_data1.range(191,160) + (pkt_in.data.range(191,160) * srf_data1.range(191,160));
        vrf_data_out1.range(223,192) = vrf_data1.range(223,192) + (pkt_in.data.range(223,192) * srf_data1.range(223,192));
        vrf_data_out1.range(255,224) = vrf_data1.range(255,224) + (pkt_in.data.range(255,224) * srf_data1.range(255,224));
        vrf_data_out1.range(287,256) = vrf_data1.range(287,256) + (pkt_in.data.range(287,256) * srf_data1.range(287,256));
        vrf_data_out1.range(319,288) = vrf_data1.range(319,288) + (pkt_in.data.range(319,288) * srf_data1.range(319,288));
        vrf_data_out1.range(351,320) = vrf_data1.range(351,320) + (pkt_in.data.range(351,320) * srf_data1.range(351,320));
        vrf_data_out1.range(383,352) = vrf_data1.range(383,352) + (pkt_in.data.range(383,352) * srf_data1.range(383,352));
        vrf_data_out1.range(415,384) = vrf_data1.range(415,384) + (pkt_in.data.range(415,384) * srf_data1.range(415,384));
        vrf_data_out1.range(447,416) = vrf_data1.range(447,416) + (pkt_in.data.range(447,416) * srf_data1.range(447,416));
        vrf_data_out1.range(479,448) = vrf_data1.range(479,448) + (pkt_in.data.range(479,448) * srf_data1.range(479,448));
        vrf_data_out1.range(511,480) = vrf_data1.range(511,480) + (pkt_in.data.range(511,480) * srf_data1.range(511,480));

        if (this_rank == 0){
          vrf0[vrf_idx0][0] = vrf_data_out0; //concatenate result to VRF
          vrf1[vrf_idx1][0] = vrf_data_out1; //concatenate result to VRF
        }
        else{
          vrf0[vrf_idx0][1] = vrf_data_out0; //concatenate result to VRF
          vrf1[vrf_idx1][1] = vrf_data_out1; //concatenate result to VRF
        }
        global_in++;
      }
      // update pc
      if(this_rank==0){
        pc0[0] = pc0[0] + 1;
        pc1[0] = pc1[0] + 1; 
      }
      else{
        pc0[1] = pc0[1] + 1;
        pc1[1] = pc1[1] + 1;
      }
      lock0 = 1; // do not allow other vector instruction
      lock1 = 1; // do not allow other vector instruction
      // stall_vmacc_0 = 0;
      // stall_vmacc_1 = 0;
    }

    // else if (op0 == 0 && op1 != 0){ // synchronization
    //   stall_vmacc_0 = 1;
    //   stall_vmacc_1 = 0;
    // }

    // else if (op0 != 0 && op1 == 0){ // synchronization
    //   stall_vmacc_0 = 0;
    //   stall_vmacc_1 = 1;
    // }

    // else{ // synchronization
    //   stall_vmacc_0 = 0;
    //   stall_vmacc_1 = 0;
    // }

    // if(op1 == 0){ // vmacc // PUT ALU-LIKE OPERATIONS IN THIS FOR LOOP
    //   if(this_rank==0)
    //     srf_data1 = vrf1[vr_addr1][0];
    //   else
    //     srf_data1 = vrf1[vr_addr1][1];
    //   for (vs_count1=0; vs_count1<VLEN1_mux; vs_count1++){
    //     #pragma HLS PIPELINE II=1
    //     vrf_idx1 = vw_addr1+vs_count1; // compute VRF index
    //     if (this_rank == 0)
    //       vrf_data1 = vrf1[vrf_idx1][0]; // Read VRF
    //     else
    //       vrf_data1 = vrf1[vrf_idx1][1]; // Read VRF
    //     // Processing
    //     // PUT AN IF HERE IF YOU WANNA SUPPORT OTHER ALU-LIKE OPERATIONS
    //     vrf_data_out1.range(31,0) = vrf_data1.range(31,0) + (pkt_in.data.range(31,0) * srf_data1.range(31,0));
    //     vrf_data_out1.range(63,32) = vrf_data1.range(63,32) + (pkt_in.data.range(63,32) * srf_data1.range(63,32));
    //     vrf_data_out1.range(95,64) = vrf_data1.range(95,64) + (pkt_in.data.range(95,64) * srf_data1.range(95,64));
    //     vrf_data_out1.range(127,96) = vrf_data1.range(127,96) + (pkt_in.data.range(127,96) * srf_data1.range(127,96));
    //     vrf_data_out1.range(159,128) = vrf_data1.range(159,128) + (pkt_in.data.range(159,128) * srf_data1.range(159,128));
    //     vrf_data_out1.range(191,160) = vrf_data1.range(191,160) + (pkt_in.data.range(191,160) * srf_data1.range(191,160));
    //     vrf_data_out1.range(223,192) = vrf_data1.range(223,192) + (pkt_in.data.range(223,192) * srf_data1.range(223,192));
    //     vrf_data_out1.range(255,224) = vrf_data1.range(255,224) + (pkt_in.data.range(255,224) * srf_data1.range(255,224));
    //     vrf_data_out1.range(287,256) = vrf_data1.range(287,256) + (pkt_in.data.range(287,256) * srf_data1.range(287,256));
    //     vrf_data_out1.range(319,288) = vrf_data1.range(319,288) + (pkt_in.data.range(319,288) * srf_data1.range(319,288));
    //     vrf_data_out1.range(351,320) = vrf_data1.range(351,320) + (pkt_in.data.range(351,320) * srf_data1.range(351,320));
    //     vrf_data_out1.range(383,352) = vrf_data1.range(383,352) + (pkt_in.data.range(383,352) * srf_data1.range(383,352));
    //     vrf_data_out1.range(415,384) = vrf_data1.range(415,384) + (pkt_in.data.range(415,384) * srf_data1.range(415,384));
    //     vrf_data_out1.range(447,416) = vrf_data1.range(447,416) + (pkt_in.data.range(447,416) * srf_data1.range(447,416));
    //     vrf_data_out1.range(479,448) = vrf_data1.range(479,448) + (pkt_in.data.range(479,448) * srf_data1.range(479,448));
    //     vrf_data_out1.range(511,480) = vrf_data1.range(511,480) + (pkt_in.data.range(511,480) * srf_data1.range(511,480));
    //     if(this_rank==0)
    //       vrf1[vrf_idx1][0] = vrf_data_out1; //concatenate result to VRF
    //     else
    //       vrf1[vrf_idx1][1] = vrf_data_out1; //concatenate result to VRF
    //   }
    // }

    if(op0 == 1){ // vle32
      for (vs_count0=0; vs_count0<VLEN0_mux; vs_count0++){
        #pragma HLS LATENCY min=1 max=1000
        #pragma HLS PIPELINE II=1
        idx_mm0 = first_dr0 + vs_count0; // compute mm_data index
        fetched_mm0 = mm_data0[idx_mm0]; // fetch mm_data
        vrf_idx0 = vw_addr0 + vs_count0; // compute VRF index
        if (this_rank == 0){
          vrf0[vrf_idx0][0] = fetched_mm0; // update vrf
        }
        else{
          vrf0[vrf_idx0][1] = fetched_mm0; // update vrf
        }
      }
    }

    if(op1 == 1){ // vle32
      for (vs_count1=0; vs_count1<VLEN1_mux; vs_count1++){
        #pragma HLS LATENCY min=1 max=1000
        #pragma HLS PIPELINE II=1
        idx_mm1 = first_dr1 + vs_count1; // compute mm_data index
        fetched_mm1 = mm_data1[idx_mm1]; // fetch mm_data
        vrf_idx1 = vw_addr1 + vs_count1; // compute VRF index
        if (this_rank == 0){
          vrf1[vrf_idx1][0] = fetched_mm1; // update vrf
        }
        else{
          vrf1[vrf_idx1][1] = fetched_mm1; // update vrf
        }
      }
    }

    // synchronization
    if(op0 == 3 && op1 == 3){ //vstreamout
        for (vs_count0=0; vs_count0<VLEN0_mux; vs_count0++){
          #pragma HLS PIPELINE II=1
          vrf_idx0 = vr_addr_sout0 + vs_count0; // compute VRF index
          if(this_rank==0){
            pkt_out.data = vrf0[vrf_idx0][0];
            pkt_out.dest = 0;
            pkt_out.last = (((((global_out0 + 1) * DWIDTH/8) % 1408) == 0))? 1: 0;
            global_out0++;}
          else{
            pkt_out.data = vrf0[vrf_idx0][1];
            pkt_out.dest = 1;
            pkt_out.last = (((((global_out1 + 1) * DWIDTH/8) % 1408) == 0))? 1: 0;
            global_out1++;}
          pkt_out.keep = -1;
          k2n.write(pkt_out);
        }
        for (vs_count1=0; vs_count1<VLEN1_mux; vs_count1++){
          #pragma HLS PIPELINE II=1
          vrf_idx1 = vr_addr_sout1 + vs_count1; // compute VRF index
          if(this_rank==0){
            pkt_out.data = vrf1[vrf_idx1][0];
            pkt_out.dest = 0;
            pkt_out.last = (((((global_out0 + 1) * DWIDTH/8) % 1408) == 0))? 1: 0;
            global_out0++;}
          else{
            pkt_out.data = vrf1[vrf_idx1][1];
            pkt_out.dest = 1;
            pkt_out.last = (((((global_out1 + 1) * DWIDTH/8) % 1408) == 0))? 1: 0;
            global_out1++;}
          pkt_out.keep = -1;
          k2n.write(pkt_out);
        }
        if(this_rank==0){
          pc0[0] = pc0[0] + 1;
          pc1[0] = pc1[0] + 1; 
        }
        else{
          pc0[1] = pc0[1] + 1;
          pc1[1] = pc1[1] + 1;
        }
        // stall_vstreamout_0 = 0;
        // stall_vstreamout_1 = 0;
    }

    // if(op0 != 3 && op1 == 3){ // synchronization
    //     stall_vstreamout_0 = 0;
    //     stall_vstreamout_1 = 0;
    // }

  }

}
}

