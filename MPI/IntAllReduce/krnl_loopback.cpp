#include "ap_axi_sdata.h"
#include "ap_int.h"
#include "hls_stream.h"

#define DWIDTH 512
#define TDWIDTH 16
#define UWIDTH 96
#define MAX_RANK 8
#define MAX_BUFFER_SIZE 11264 // 1408*8

typedef ap_axiu<DWIDTH, UWIDTH, 1, TDWIDTH> pkt;

extern "C" {
void krnl_loopback(hls::stream<pkt> &n2k,    // Internal Stream
	               hls::stream<pkt> &k2n,
                   unsigned int     size, // Size in bytes (size-local)
                   unsigned int     num_rank // Number of ranks
                   ) {
#pragma HLS INTERFACE axis port = n2k
#pragma HLS INTERFACE axis port = k2n

  unsigned int bytes_per_beat = (DWIDTH / 8);
  unsigned int size_tot = num_rank * size;
  unsigned int num_iter_local = (size / bytes_per_beat);
  unsigned int num_iter_global = (size_tot / bytes_per_beat);

  unsigned int buffer_idx_mux = 0;
  static unsigned int buffer_idx[MAX_RANK]; // Array to hold buffer indices for each rank
  #pragma HLS ARRAY_PARTITION variable=buffer_idx complete dim=1
  #pragma HLS UNROLL

  unsigned int global_idx = 0;
  pkt pkt_in;
  pkt pkt_out;

  // Define buffer arrays for each rank
    static ap_uint<512> acc_buf[MAX_BUFFER_SIZE * MAX_RANK] = {0};
    #pragma HLS BIND_STORAGE variable=acc_buf type=RAM_2P impl=BRAM
  
  // Initialize buffer indices for each rank
  for (int rank = 0; rank < num_rank; rank++) {
    buffer_idx[rank] = 0;
  }

  // Loop unrolling and pipelining for the main processing loop
  loop_main: while (global_idx < num_iter_global) {
    #pragma HLS PIPELINE II=1

    //Read incoming packet
    pkt_in = n2k.read();

    // Compute the incoming rank
    ap_uint<8> this_rank = pkt_in.user.range(7,0); //myPort

    // Pick the right index to update the buffer
    unsigned int buffer_idx_this_rank = buffer_idx[this_rank];
    buffer_idx_mux = buffer_idx_this_rank;

   for (int i = 0; i < DWIDTH/32; i++) {
    #pragma HLS UNROLL
    ap_uint<32> acc_buf_data = acc_buf[this_rank * MAX_BUFFER_SIZE + buffer_idx_mux + i];
    acc_buf_data += pkt_in.data.range((i+1)*32-1, i*32);
    acc_buf[this_rank * MAX_BUFFER_SIZE + buffer_idx_mux + i] = acc_buf_data;
}

    // Update the buffer index for the current rank
    if (buffer_idx[this_rank] == num_iter_local - 1)
        buffer_idx[this_rank] = 0;
    else
        buffer_idx[this_rank]++;

    // Update the global index
    global_idx++;
  }

  // Perform multicast for each rank
pkt_out.dest = 1; // Set the destination to the first NIC (second entry of Arp table)

loop_multicast: for (int rank = 0; rank < num_rank; rank++) {
    // #pragma HLS PIPELINE II=1
    unsigned int base_idx = rank * MAX_BUFFER_SIZE;

    // Loop unrolling for the multicast operation
    for (int i = 0; i < num_iter_local; i++) {
        #pragma HLS UNROLL
        pkt_out.data.range(31,0) = acc_buf[base_idx + (i * (DWIDTH/32))];
        pkt_out.data.range(63,32) = acc_buf[base_idx + (i * (DWIDTH/32)) + 1];
        pkt_out.data.range(95,64) = acc_buf[base_idx + (i * (DWIDTH/32)) + 2];
        pkt_out.data.range(127,96) = acc_buf[base_idx + (i * (DWIDTH/32)) + 3];
        pkt_out.data.range(159,128) = acc_buf[base_idx + (i * (DWIDTH/32)) + 4];
        pkt_out.data.range(191,160) = acc_buf[base_idx + (i * (DWIDTH/32)) + 5];
        pkt_out.data.range(223,192) = acc_buf[base_idx + (i * (DWIDTH/32)) + 6];
        pkt_out.data.range(255,224) = acc_buf[base_idx + (i * (DWIDTH/32)) + 7];
        pkt_out.data.range(287,256) = acc_buf[base_idx + (i * (DWIDTH/32)) + 8];
        pkt_out.data.range(319,288) = acc_buf[base_idx + (i * (DWIDTH/32)) + 9];
        pkt_out.data.range(351,320) = acc_buf[base_idx + (i * (DWIDTH/32)) + 10];
        pkt_out.data.range(383,352) = acc_buf[base_idx + (i * (DWIDTH/32)) + 11];
        pkt_out.data.range(415,384) = acc_buf[base_idx + (i * (DWIDTH/32)) + 12];
        pkt_out.data.range(447,416) = acc_buf[base_idx + (i * (DWIDTH/32)) + 13];
        pkt_out.data.range(479,448) = acc_buf[base_idx + (i * (DWIDTH/32)) + 14];
        pkt_out.data.range(511,480) = acc_buf[base_idx + (i * (DWIDTH/32)) + 15];
        
        pkt_out.keep = -1;
        if ((((size / bytes_per_beat) - 1) == i) || ((((i + 1) * DWIDTH/8) % 1408) == 0))
            pkt_out.last = 1;
        else 
            pkt_out.last = 0;

        k2n.write(pkt_out);
    }
  }
}
}