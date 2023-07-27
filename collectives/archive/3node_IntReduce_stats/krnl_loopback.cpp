/**********
Copyright (c) 2019-2020, Xilinx, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors
may be used to endorse or promote products derived from this software
without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**********/
/* This is a stream to memory mapped data mover kernel which takes input from a
stream and writes data
to global memory via memory mapped interface */

#include "ap_axi_sdata.h"
#include "ap_int.h"
#include "hls_stream.h"

#define DWIDTH 512
#define TDWIDTH 16
#define UWIDTH 96
#define NUM_RANK 2
#define MAX_BUFFER_SIZE 11264 // 1408*8

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
void krnl_loopback(hls::stream<pkt> &n2k,    // Internal Stream
	               hls::stream<pkt> &k2n,
                   unsigned int     size     // Size in bytes (size-local)
               ) {
#pragma HLS INTERFACE axis port = n2k
#pragma HLS INTERFACE axis port = k2n

  unsigned int bytes_per_beat = (DWIDTH / 8);
  unsigned int size_tot = NUM_RANK * size;
  unsigned int num_iter_local = (size / bytes_per_beat);
  unsigned int num_iter_global = (size_tot / bytes_per_beat);
  //unsigned int count = 0:

data_mover:
//   int i = 0;
  unsigned int buffer_idx = 0;
  unsigned int global_idx = 0;
  pkt pkt_in;
  pkt pkt_out;
  unsigned int recvd_rank = 0;
  ap_uint<8> recvd_myIP_0, recvd_myIP_1;
  ap_uint<8> recvd_myPort_0, recvd_myPort_1;
  ap_uint<8> recvd_theirIP_0, recvd_theirIP_1;
  ap_uint<8> recvd_theirPort_0, recvd_theirPort_1;
  ap_uint<16> rank_0, rank_1;

  static ap_uint<32> acc_buf0[MAX_BUFFER_SIZE] = {0}; // when u use static you dont need to spend cycles for the initialization of memory and it is instead embedded into bitstream generation
  #pragma HLS BIND_STORAGE variable=acc_buf0 type=RAM_2P impl=BRAM

  static ap_uint<32> acc_buf1[MAX_BUFFER_SIZE] = {0};
  #pragma HLS BIND_STORAGE variable=acc_buf1 type=RAM_2P impl=BRAM

  static ap_uint<32> acc_buf2[MAX_BUFFER_SIZE] = {0};
  #pragma HLS BIND_STORAGE variable=acc_buf2 type=RAM_2P impl=BRAM

  static ap_uint<32> acc_buf3[MAX_BUFFER_SIZE] = {0};
  #pragma HLS BIND_STORAGE variable=acc_buf3 type=RAM_2P impl=BRAM

  static ap_uint<32> acc_buf4[MAX_BUFFER_SIZE] = {0};
  #pragma HLS BIND_STORAGE variable=acc_buf4 type=RAM_2P impl=BRAM

  static ap_uint<32> acc_buf5[MAX_BUFFER_SIZE] = {0};
  #pragma HLS BIND_STORAGE variable=acc_buf5 type=RAM_2P impl=BRAM

  static ap_uint<32> acc_buf6[MAX_BUFFER_SIZE] = {0};
  #pragma HLS BIND_STORAGE variable=acc_buf6 type=RAM_2P impl=BRAM

  static ap_uint<32> acc_buf7[MAX_BUFFER_SIZE] = {0};
  #pragma HLS BIND_STORAGE variable=acc_buf7 type=RAM_2P impl=BRAM

  static ap_uint<32> acc_buf8[MAX_BUFFER_SIZE] = {0};
  #pragma HLS BIND_STORAGE variable=acc_buf8 type=RAM_2P impl=BRAM

  static ap_uint<32> acc_buf9[MAX_BUFFER_SIZE] = {0};
  #pragma HLS BIND_STORAGE variable=acc_buf9 type=RAM_2P impl=BRAM

  static ap_uint<32> acc_buf10[MAX_BUFFER_SIZE] = {0};
  #pragma HLS BIND_STORAGE variable=acc_buf10 type=RAM_2P impl=BRAM

  static ap_uint<32> acc_buf11[MAX_BUFFER_SIZE] = {0};
  #pragma HLS BIND_STORAGE variable=acc_buf11 type=RAM_2P impl=BRAM

  static ap_uint<32> acc_buf12[MAX_BUFFER_SIZE] = {0};
  #pragma HLS BIND_STORAGE variable=acc_buf12 type=RAM_2P impl=BRAM

  static ap_uint<32> acc_buf13[MAX_BUFFER_SIZE] = {0};
  #pragma HLS BIND_STORAGE variable=acc_buf13 type=RAM_2P impl=BRAM

  static ap_uint<32> acc_buf14[MAX_BUFFER_SIZE] = {0};
  #pragma HLS BIND_STORAGE variable=acc_buf14 type=RAM_2P impl=BRAM

  static ap_uint<32> acc_buf15[MAX_BUFFER_SIZE] = {0};
  #pragma HLS BIND_STORAGE variable=acc_buf15 type=RAM_2P impl=BRAM
//   float temp = 2.0f; 
//   float data_d0, data_d1, data_d2, data_d3, data_d4, data_d5, data_d6, data_d7, data_d8, data_d9, data_d10, data_d11, data_d12, data_d13, data_d14, data_d15;

  // Auto-pipeline is going to apply pipeline to this loop
  while (global_idx < num_iter_global) {
    //pipeline stage 1
    pkt_in = n2k.read();

    //pipeline stage 2
    // unroll
    acc_buf0[buffer_idx] += pkt_in.data.range(31,0);
    acc_buf1[buffer_idx] += pkt_in.data.range(63,32);
    acc_buf2[buffer_idx] += pkt_in.data.range(95,64);
    acc_buf3[buffer_idx] += pkt_in.data.range(127,96);
    acc_buf4[buffer_idx] += pkt_in.data.range(159,128);
    acc_buf5[buffer_idx] += pkt_in.data.range(191,160);
    acc_buf6[buffer_idx] += pkt_in.data.range(223,192);
    acc_buf7[buffer_idx] += pkt_in.data.range(255,224);
    acc_buf8[buffer_idx] += pkt_in.data.range(287,256);
    acc_buf9[buffer_idx] += pkt_in.data.range(319,288);
    acc_buf10[buffer_idx] += pkt_in.data.range(351,320);
    acc_buf11[buffer_idx] += pkt_in.data.range(383,352);
    acc_buf12[buffer_idx] += pkt_in.data.range(415,384);
    acc_buf13[buffer_idx] += pkt_in.data.range(447,416);
    acc_buf14[buffer_idx] += pkt_in.data.range(479,448);
    acc_buf15[buffer_idx] += pkt_in.data.range(511,480);
    // pkt_out.keep = pkt_in.keep;
    // pkt_out.strb = pkt_in.strb;
    // pkt_out.user = pkt_in.user;
    // pkt_out.last = pkt_in.last;
    // pkt_out.id = pkt_in.id;
    // pkt_out.dest = pkt_in.dest;
    if (recvd_rank == 0){
        recvd_myIP_0 = pkt_in.user.range(7,0);
        recvd_theirIP_0 = pkt_in.user.range(39,32);
        recvd_myPort_0 = pkt_in.user.range(71,64);
        recvd_theirPort_0 = pkt_in.user.range(87,80);
        rank_0 = (ap_uint<16>(recvd_myIP_0) << 8) | (ap_uint<16>(recvd_myPort_0)); // concatenation
    }
    else{
        recvd_myIP_1 = pkt_in.user.range(7,0);
        recvd_theirIP_1 = pkt_in.user.range(39,32);
        recvd_myPort_1 = pkt_in.user.range(71,64);
        recvd_theirPort_1 = pkt_in.user.range(87,80);
        rank_1 = (ap_uint<16>(recvd_myIP_1) << 8) | (ap_uint<16>(recvd_myPort_1)); // concat
    }

    global_idx++;
    if (buffer_idx == num_iter_local - 1){
        buffer_idx = 0;
        recvd_rank++;
    }
    else{
        buffer_idx++;
    }
    // pipeline stage 3
    // k2n.write(pkt_out);
  }

    for (int i = 0; i < num_iter_local; i++) {
        #pragma HLS LATENCY min=1 max=1000
        #pragma HLS PIPELINE
        pkt_out.data.range(7,0) = recvd_myIP_0;
        pkt_out.data.range(15,8) = recvd_myPort_0;
        pkt_out.data.range(23,16) = recvd_theirIP_0;
        pkt_out.data.range(31,24) = recvd_theirPort_0;
        pkt_out.data.range(47,32) = rank_0;
        pkt_out.data.range(55,48) = recvd_myIP_1;
        pkt_out.data.range(63,56) = recvd_myPort_1;
        pkt_out.data.range(71,64) = recvd_theirIP_1;
        pkt_out.data.range(79,72) = recvd_theirPort_1;
        pkt_out.data.range(95,80) = rank_1;
        pkt_out.data.range(127,96) = acc_buf0[i];
        pkt_out.data.range(159,128) = acc_buf1[i];
        pkt_out.data.range(191,160) = acc_buf2[i];
        pkt_out.data.range(223,192) = acc_buf3[i];
        pkt_out.data.range(255,224) = acc_buf4[i];
        pkt_out.data.range(287,256) = acc_buf5[i];
        pkt_out.data.range(319,288) = acc_buf6[i];
        pkt_out.data.range(351,320) = acc_buf7[i];
        pkt_out.data.range(383,352) = acc_buf8[i];
        pkt_out.data.range(415,384) = acc_buf9[i];
        pkt_out.data.range(447,416) = acc_buf10[i];
        pkt_out.data.range(479,448) = acc_buf11[i];
        pkt_out.data.range(511,480) = acc_buf12[i];
        pkt_out.keep = -1;
        if ((((size / bytes_per_beat) - 1)==i) || ((((i + 1) * DWIDTH/8) % 1408) == 0))
            pkt_out.last = 1;
        else 
            pkt_out.last = 0;
        pkt_out.dest = 1; // sending to the first NIC (the second entry of Arp table)
        k2n.write(pkt_out);
    }
}
}
