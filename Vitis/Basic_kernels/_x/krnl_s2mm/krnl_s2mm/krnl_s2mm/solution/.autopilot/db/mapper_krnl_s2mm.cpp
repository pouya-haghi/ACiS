#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
unsigned int ap_apatb_n2k_V_data_V_cap_bc;
static AESL_RUNTIME_BC __xlx_n2k_V_data_V_V_size_Reader("../tv/stream_size/stream_size_in_n2k_V_data_V.dat");
unsigned int ap_apatb_n2k_V_keep_V_cap_bc;
static AESL_RUNTIME_BC __xlx_n2k_V_keep_V_V_size_Reader("../tv/stream_size/stream_size_in_n2k_V_keep_V.dat");
unsigned int ap_apatb_n2k_V_strb_V_cap_bc;
static AESL_RUNTIME_BC __xlx_n2k_V_strb_V_V_size_Reader("../tv/stream_size/stream_size_in_n2k_V_strb_V.dat");
unsigned int ap_apatb_n2k_V_user_V_cap_bc;
static AESL_RUNTIME_BC __xlx_n2k_V_user_V_V_size_Reader("../tv/stream_size/stream_size_in_n2k_V_user_V.dat");
unsigned int ap_apatb_n2k_V_last_V_cap_bc;
static AESL_RUNTIME_BC __xlx_n2k_V_last_V_V_size_Reader("../tv/stream_size/stream_size_in_n2k_V_last_V.dat");
unsigned int ap_apatb_n2k_V_id_V_cap_bc;
static AESL_RUNTIME_BC __xlx_n2k_V_id_V_V_size_Reader("../tv/stream_size/stream_size_in_n2k_V_id_V.dat");
unsigned int ap_apatb_n2k_V_dest_V_cap_bc;
static AESL_RUNTIME_BC __xlx_n2k_V_dest_V_V_size_Reader("../tv/stream_size/stream_size_in_n2k_V_dest_V.dat");
struct __cosim_s40__ { char data[64]; };
extern "C" void krnl_s2mm(__cosim_s40__*, int, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, int);
extern "C" void apatb_krnl_s2mm_hw(volatile void * __xlx_apatb_param_out_r, volatile void * __xlx_apatb_param_n2k_V_data_V, volatile void * __xlx_apatb_param_n2k_V_keep_V, volatile void * __xlx_apatb_param_n2k_V_strb_V, volatile void * __xlx_apatb_param_n2k_V_user_V, volatile void * __xlx_apatb_param_n2k_V_last_V, volatile void * __xlx_apatb_param_n2k_V_id_V, volatile void * __xlx_apatb_param_n2k_V_dest_V, int __xlx_apatb_param_size) {
  // Collect __xlx_out_r__tmp_vec
  vector<sc_bv<512> >__xlx_out_r__tmp_vec;
  for (int j = 0, e = 1; j != e; ++j) {
    sc_bv<512> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_out_r)[j*64+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_out_r)[j*64+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_out_r)[j*64+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_out_r)[j*64+3];
    _xlx_tmp_sc.range(39, 32) = ((char*)__xlx_apatb_param_out_r)[j*64+4];
    _xlx_tmp_sc.range(47, 40) = ((char*)__xlx_apatb_param_out_r)[j*64+5];
    _xlx_tmp_sc.range(55, 48) = ((char*)__xlx_apatb_param_out_r)[j*64+6];
    _xlx_tmp_sc.range(63, 56) = ((char*)__xlx_apatb_param_out_r)[j*64+7];
    _xlx_tmp_sc.range(71, 64) = ((char*)__xlx_apatb_param_out_r)[j*64+8];
    _xlx_tmp_sc.range(79, 72) = ((char*)__xlx_apatb_param_out_r)[j*64+9];
    _xlx_tmp_sc.range(87, 80) = ((char*)__xlx_apatb_param_out_r)[j*64+10];
    _xlx_tmp_sc.range(95, 88) = ((char*)__xlx_apatb_param_out_r)[j*64+11];
    _xlx_tmp_sc.range(103, 96) = ((char*)__xlx_apatb_param_out_r)[j*64+12];
    _xlx_tmp_sc.range(111, 104) = ((char*)__xlx_apatb_param_out_r)[j*64+13];
    _xlx_tmp_sc.range(119, 112) = ((char*)__xlx_apatb_param_out_r)[j*64+14];
    _xlx_tmp_sc.range(127, 120) = ((char*)__xlx_apatb_param_out_r)[j*64+15];
    _xlx_tmp_sc.range(135, 128) = ((char*)__xlx_apatb_param_out_r)[j*64+16];
    _xlx_tmp_sc.range(143, 136) = ((char*)__xlx_apatb_param_out_r)[j*64+17];
    _xlx_tmp_sc.range(151, 144) = ((char*)__xlx_apatb_param_out_r)[j*64+18];
    _xlx_tmp_sc.range(159, 152) = ((char*)__xlx_apatb_param_out_r)[j*64+19];
    _xlx_tmp_sc.range(167, 160) = ((char*)__xlx_apatb_param_out_r)[j*64+20];
    _xlx_tmp_sc.range(175, 168) = ((char*)__xlx_apatb_param_out_r)[j*64+21];
    _xlx_tmp_sc.range(183, 176) = ((char*)__xlx_apatb_param_out_r)[j*64+22];
    _xlx_tmp_sc.range(191, 184) = ((char*)__xlx_apatb_param_out_r)[j*64+23];
    _xlx_tmp_sc.range(199, 192) = ((char*)__xlx_apatb_param_out_r)[j*64+24];
    _xlx_tmp_sc.range(207, 200) = ((char*)__xlx_apatb_param_out_r)[j*64+25];
    _xlx_tmp_sc.range(215, 208) = ((char*)__xlx_apatb_param_out_r)[j*64+26];
    _xlx_tmp_sc.range(223, 216) = ((char*)__xlx_apatb_param_out_r)[j*64+27];
    _xlx_tmp_sc.range(231, 224) = ((char*)__xlx_apatb_param_out_r)[j*64+28];
    _xlx_tmp_sc.range(239, 232) = ((char*)__xlx_apatb_param_out_r)[j*64+29];
    _xlx_tmp_sc.range(247, 240) = ((char*)__xlx_apatb_param_out_r)[j*64+30];
    _xlx_tmp_sc.range(255, 248) = ((char*)__xlx_apatb_param_out_r)[j*64+31];
    _xlx_tmp_sc.range(263, 256) = ((char*)__xlx_apatb_param_out_r)[j*64+32];
    _xlx_tmp_sc.range(271, 264) = ((char*)__xlx_apatb_param_out_r)[j*64+33];
    _xlx_tmp_sc.range(279, 272) = ((char*)__xlx_apatb_param_out_r)[j*64+34];
    _xlx_tmp_sc.range(287, 280) = ((char*)__xlx_apatb_param_out_r)[j*64+35];
    _xlx_tmp_sc.range(295, 288) = ((char*)__xlx_apatb_param_out_r)[j*64+36];
    _xlx_tmp_sc.range(303, 296) = ((char*)__xlx_apatb_param_out_r)[j*64+37];
    _xlx_tmp_sc.range(311, 304) = ((char*)__xlx_apatb_param_out_r)[j*64+38];
    _xlx_tmp_sc.range(319, 312) = ((char*)__xlx_apatb_param_out_r)[j*64+39];
    _xlx_tmp_sc.range(327, 320) = ((char*)__xlx_apatb_param_out_r)[j*64+40];
    _xlx_tmp_sc.range(335, 328) = ((char*)__xlx_apatb_param_out_r)[j*64+41];
    _xlx_tmp_sc.range(343, 336) = ((char*)__xlx_apatb_param_out_r)[j*64+42];
    _xlx_tmp_sc.range(351, 344) = ((char*)__xlx_apatb_param_out_r)[j*64+43];
    _xlx_tmp_sc.range(359, 352) = ((char*)__xlx_apatb_param_out_r)[j*64+44];
    _xlx_tmp_sc.range(367, 360) = ((char*)__xlx_apatb_param_out_r)[j*64+45];
    _xlx_tmp_sc.range(375, 368) = ((char*)__xlx_apatb_param_out_r)[j*64+46];
    _xlx_tmp_sc.range(383, 376) = ((char*)__xlx_apatb_param_out_r)[j*64+47];
    _xlx_tmp_sc.range(391, 384) = ((char*)__xlx_apatb_param_out_r)[j*64+48];
    _xlx_tmp_sc.range(399, 392) = ((char*)__xlx_apatb_param_out_r)[j*64+49];
    _xlx_tmp_sc.range(407, 400) = ((char*)__xlx_apatb_param_out_r)[j*64+50];
    _xlx_tmp_sc.range(415, 408) = ((char*)__xlx_apatb_param_out_r)[j*64+51];
    _xlx_tmp_sc.range(423, 416) = ((char*)__xlx_apatb_param_out_r)[j*64+52];
    _xlx_tmp_sc.range(431, 424) = ((char*)__xlx_apatb_param_out_r)[j*64+53];
    _xlx_tmp_sc.range(439, 432) = ((char*)__xlx_apatb_param_out_r)[j*64+54];
    _xlx_tmp_sc.range(447, 440) = ((char*)__xlx_apatb_param_out_r)[j*64+55];
    _xlx_tmp_sc.range(455, 448) = ((char*)__xlx_apatb_param_out_r)[j*64+56];
    _xlx_tmp_sc.range(463, 456) = ((char*)__xlx_apatb_param_out_r)[j*64+57];
    _xlx_tmp_sc.range(471, 464) = ((char*)__xlx_apatb_param_out_r)[j*64+58];
    _xlx_tmp_sc.range(479, 472) = ((char*)__xlx_apatb_param_out_r)[j*64+59];
    _xlx_tmp_sc.range(487, 480) = ((char*)__xlx_apatb_param_out_r)[j*64+60];
    _xlx_tmp_sc.range(495, 488) = ((char*)__xlx_apatb_param_out_r)[j*64+61];
    _xlx_tmp_sc.range(503, 496) = ((char*)__xlx_apatb_param_out_r)[j*64+62];
    _xlx_tmp_sc.range(511, 504) = ((char*)__xlx_apatb_param_out_r)[j*64+63];
    __xlx_out_r__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_out_r = 1;
  int __xlx_offset_param_out_r = 0;
  int __xlx_offset_byte_param_out_r = 0*64;
  __cosim_s40__* __xlx_out_r__input_buffer= new __cosim_s40__[__xlx_out_r__tmp_vec.size()];
  for (int i = 0; i < __xlx_out_r__tmp_vec.size(); ++i) {
    ((long long*)__xlx_out_r__input_buffer)[i*8+0] = __xlx_out_r__tmp_vec[i].range(63, 0).to_uint64();
    ((long long*)__xlx_out_r__input_buffer)[i*8+1] = __xlx_out_r__tmp_vec[i].range(127, 64).to_uint64();
    ((long long*)__xlx_out_r__input_buffer)[i*8+2] = __xlx_out_r__tmp_vec[i].range(191, 128).to_uint64();
    ((long long*)__xlx_out_r__input_buffer)[i*8+3] = __xlx_out_r__tmp_vec[i].range(255, 192).to_uint64();
    ((long long*)__xlx_out_r__input_buffer)[i*8+4] = __xlx_out_r__tmp_vec[i].range(319, 256).to_uint64();
    ((long long*)__xlx_out_r__input_buffer)[i*8+5] = __xlx_out_r__tmp_vec[i].range(383, 320).to_uint64();
    ((long long*)__xlx_out_r__input_buffer)[i*8+6] = __xlx_out_r__tmp_vec[i].range(447, 384).to_uint64();
    ((long long*)__xlx_out_r__input_buffer)[i*8+7] = __xlx_out_r__tmp_vec[i].range(511, 448).to_uint64();
  }
  // collect __xlx_n2k_V_data_V_tmp_vec
  unsigned __xlx_n2k_V_data_V_V_tmp_Count = 0;
  unsigned __xlx_n2k_V_data_V_V_read_Size = __xlx_n2k_V_data_V_V_size_Reader.read_size();
  vector<__cosim_s40__> __xlx_n2k_V_data_V_tmp_vec;
  while (!((hls::stream<__cosim_s40__>*)__xlx_apatb_param_n2k_V_data_V)->empty() && __xlx_n2k_V_data_V_V_tmp_Count < __xlx_n2k_V_data_V_V_read_Size) {
    __xlx_n2k_V_data_V_tmp_vec.push_back(((hls::stream<__cosim_s40__>*)__xlx_apatb_param_n2k_V_data_V)->read());
    __xlx_n2k_V_data_V_V_tmp_Count++;
  }
  ap_apatb_n2k_V_data_V_cap_bc = __xlx_n2k_V_data_V_tmp_vec.size();
  // store input buffer
  __cosim_s40__* __xlx_n2k_V_data_V_input_buffer= new __cosim_s40__[__xlx_n2k_V_data_V_tmp_vec.size()];
  for (int i = 0; i < __xlx_n2k_V_data_V_tmp_vec.size(); ++i) {
    __xlx_n2k_V_data_V_input_buffer[i] = __xlx_n2k_V_data_V_tmp_vec[i];
  }
  // collect __xlx_n2k_V_keep_V_tmp_vec
  unsigned __xlx_n2k_V_keep_V_V_tmp_Count = 0;
  unsigned __xlx_n2k_V_keep_V_V_read_Size = __xlx_n2k_V_keep_V_V_size_Reader.read_size();
  vector<long long> __xlx_n2k_V_keep_V_tmp_vec;
  while (!((hls::stream<long long>*)__xlx_apatb_param_n2k_V_keep_V)->empty() && __xlx_n2k_V_keep_V_V_tmp_Count < __xlx_n2k_V_keep_V_V_read_Size) {
    __xlx_n2k_V_keep_V_tmp_vec.push_back(((hls::stream<long long>*)__xlx_apatb_param_n2k_V_keep_V)->read());
    __xlx_n2k_V_keep_V_V_tmp_Count++;
  }
  ap_apatb_n2k_V_keep_V_cap_bc = __xlx_n2k_V_keep_V_tmp_vec.size();
  // store input buffer
  long long* __xlx_n2k_V_keep_V_input_buffer= new long long[__xlx_n2k_V_keep_V_tmp_vec.size()];
  for (int i = 0; i < __xlx_n2k_V_keep_V_tmp_vec.size(); ++i) {
    __xlx_n2k_V_keep_V_input_buffer[i] = __xlx_n2k_V_keep_V_tmp_vec[i];
  }
  // collect __xlx_n2k_V_strb_V_tmp_vec
  unsigned __xlx_n2k_V_strb_V_V_tmp_Count = 0;
  unsigned __xlx_n2k_V_strb_V_V_read_Size = __xlx_n2k_V_strb_V_V_size_Reader.read_size();
  vector<long long> __xlx_n2k_V_strb_V_tmp_vec;
  while (!((hls::stream<long long>*)__xlx_apatb_param_n2k_V_strb_V)->empty() && __xlx_n2k_V_strb_V_V_tmp_Count < __xlx_n2k_V_strb_V_V_read_Size) {
    __xlx_n2k_V_strb_V_tmp_vec.push_back(((hls::stream<long long>*)__xlx_apatb_param_n2k_V_strb_V)->read());
    __xlx_n2k_V_strb_V_V_tmp_Count++;
  }
  ap_apatb_n2k_V_strb_V_cap_bc = __xlx_n2k_V_strb_V_tmp_vec.size();
  // store input buffer
  long long* __xlx_n2k_V_strb_V_input_buffer= new long long[__xlx_n2k_V_strb_V_tmp_vec.size()];
  for (int i = 0; i < __xlx_n2k_V_strb_V_tmp_vec.size(); ++i) {
    __xlx_n2k_V_strb_V_input_buffer[i] = __xlx_n2k_V_strb_V_tmp_vec[i];
  }
  // collect __xlx_n2k_V_user_V_tmp_vec
  unsigned __xlx_n2k_V_user_V_V_tmp_Count = 0;
  unsigned __xlx_n2k_V_user_V_V_read_Size = __xlx_n2k_V_user_V_V_size_Reader.read_size();
  vector<char> __xlx_n2k_V_user_V_tmp_vec;
  while (!((hls::stream<char>*)__xlx_apatb_param_n2k_V_user_V)->empty() && __xlx_n2k_V_user_V_V_tmp_Count < __xlx_n2k_V_user_V_V_read_Size) {
    __xlx_n2k_V_user_V_tmp_vec.push_back(((hls::stream<char>*)__xlx_apatb_param_n2k_V_user_V)->read());
    __xlx_n2k_V_user_V_V_tmp_Count++;
  }
  ap_apatb_n2k_V_user_V_cap_bc = __xlx_n2k_V_user_V_tmp_vec.size();
  // store input buffer
  char* __xlx_n2k_V_user_V_input_buffer= new char[__xlx_n2k_V_user_V_tmp_vec.size()];
  for (int i = 0; i < __xlx_n2k_V_user_V_tmp_vec.size(); ++i) {
    __xlx_n2k_V_user_V_input_buffer[i] = __xlx_n2k_V_user_V_tmp_vec[i];
  }
  // collect __xlx_n2k_V_last_V_tmp_vec
  unsigned __xlx_n2k_V_last_V_V_tmp_Count = 0;
  unsigned __xlx_n2k_V_last_V_V_read_Size = __xlx_n2k_V_last_V_V_size_Reader.read_size();
  vector<char> __xlx_n2k_V_last_V_tmp_vec;
  while (!((hls::stream<char>*)__xlx_apatb_param_n2k_V_last_V)->empty() && __xlx_n2k_V_last_V_V_tmp_Count < __xlx_n2k_V_last_V_V_read_Size) {
    __xlx_n2k_V_last_V_tmp_vec.push_back(((hls::stream<char>*)__xlx_apatb_param_n2k_V_last_V)->read());
    __xlx_n2k_V_last_V_V_tmp_Count++;
  }
  ap_apatb_n2k_V_last_V_cap_bc = __xlx_n2k_V_last_V_tmp_vec.size();
  // store input buffer
  char* __xlx_n2k_V_last_V_input_buffer= new char[__xlx_n2k_V_last_V_tmp_vec.size()];
  for (int i = 0; i < __xlx_n2k_V_last_V_tmp_vec.size(); ++i) {
    __xlx_n2k_V_last_V_input_buffer[i] = __xlx_n2k_V_last_V_tmp_vec[i];
  }
  // collect __xlx_n2k_V_id_V_tmp_vec
  unsigned __xlx_n2k_V_id_V_V_tmp_Count = 0;
  unsigned __xlx_n2k_V_id_V_V_read_Size = __xlx_n2k_V_id_V_V_size_Reader.read_size();
  vector<char> __xlx_n2k_V_id_V_tmp_vec;
  while (!((hls::stream<char>*)__xlx_apatb_param_n2k_V_id_V)->empty() && __xlx_n2k_V_id_V_V_tmp_Count < __xlx_n2k_V_id_V_V_read_Size) {
    __xlx_n2k_V_id_V_tmp_vec.push_back(((hls::stream<char>*)__xlx_apatb_param_n2k_V_id_V)->read());
    __xlx_n2k_V_id_V_V_tmp_Count++;
  }
  ap_apatb_n2k_V_id_V_cap_bc = __xlx_n2k_V_id_V_tmp_vec.size();
  // store input buffer
  char* __xlx_n2k_V_id_V_input_buffer= new char[__xlx_n2k_V_id_V_tmp_vec.size()];
  for (int i = 0; i < __xlx_n2k_V_id_V_tmp_vec.size(); ++i) {
    __xlx_n2k_V_id_V_input_buffer[i] = __xlx_n2k_V_id_V_tmp_vec[i];
  }
  // collect __xlx_n2k_V_dest_V_tmp_vec
  unsigned __xlx_n2k_V_dest_V_V_tmp_Count = 0;
  unsigned __xlx_n2k_V_dest_V_V_read_Size = __xlx_n2k_V_dest_V_V_size_Reader.read_size();
  vector<short> __xlx_n2k_V_dest_V_tmp_vec;
  while (!((hls::stream<short>*)__xlx_apatb_param_n2k_V_dest_V)->empty() && __xlx_n2k_V_dest_V_V_tmp_Count < __xlx_n2k_V_dest_V_V_read_Size) {
    __xlx_n2k_V_dest_V_tmp_vec.push_back(((hls::stream<short>*)__xlx_apatb_param_n2k_V_dest_V)->read());
    __xlx_n2k_V_dest_V_V_tmp_Count++;
  }
  ap_apatb_n2k_V_dest_V_cap_bc = __xlx_n2k_V_dest_V_tmp_vec.size();
  // store input buffer
  short* __xlx_n2k_V_dest_V_input_buffer= new short[__xlx_n2k_V_dest_V_tmp_vec.size()];
  for (int i = 0; i < __xlx_n2k_V_dest_V_tmp_vec.size(); ++i) {
    __xlx_n2k_V_dest_V_input_buffer[i] = __xlx_n2k_V_dest_V_tmp_vec[i];
  }
  // DUT call
  krnl_s2mm(__xlx_out_r__input_buffer, __xlx_offset_byte_param_out_r, __xlx_n2k_V_data_V_input_buffer, __xlx_n2k_V_keep_V_input_buffer, __xlx_n2k_V_strb_V_input_buffer, __xlx_n2k_V_user_V_input_buffer, __xlx_n2k_V_last_V_input_buffer, __xlx_n2k_V_id_V_input_buffer, __xlx_n2k_V_dest_V_input_buffer, __xlx_apatb_param_size);
// print __xlx_apatb_param_out_r
  sc_bv<512>*__xlx_out_r_output_buffer = new sc_bv<512>[__xlx_size_param_out_r];
  for (int i = 0; i < __xlx_size_param_out_r; ++i) {
    char* start = (char*)(&(__xlx_out_r__input_buffer[__xlx_offset_param_out_r]));
    __xlx_out_r_output_buffer[i].range(63, 0) = ((long long*)start)[i*8+0];
    __xlx_out_r_output_buffer[i].range(127, 64) = ((long long*)start)[i*8+1];
    __xlx_out_r_output_buffer[i].range(191, 128) = ((long long*)start)[i*8+2];
    __xlx_out_r_output_buffer[i].range(255, 192) = ((long long*)start)[i*8+3];
    __xlx_out_r_output_buffer[i].range(319, 256) = ((long long*)start)[i*8+4];
    __xlx_out_r_output_buffer[i].range(383, 320) = ((long long*)start)[i*8+5];
    __xlx_out_r_output_buffer[i].range(447, 384) = ((long long*)start)[i*8+6];
    __xlx_out_r_output_buffer[i].range(511, 448) = ((long long*)start)[i*8+7];
  }
  for (int i = 0; i < __xlx_size_param_out_r; ++i) {
    ((char*)__xlx_apatb_param_out_r)[i*64+0] = __xlx_out_r_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+1] = __xlx_out_r_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+2] = __xlx_out_r_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+3] = __xlx_out_r_output_buffer[i].range(31, 24).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+4] = __xlx_out_r_output_buffer[i].range(39, 32).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+5] = __xlx_out_r_output_buffer[i].range(47, 40).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+6] = __xlx_out_r_output_buffer[i].range(55, 48).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+7] = __xlx_out_r_output_buffer[i].range(63, 56).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+8] = __xlx_out_r_output_buffer[i].range(71, 64).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+9] = __xlx_out_r_output_buffer[i].range(79, 72).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+10] = __xlx_out_r_output_buffer[i].range(87, 80).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+11] = __xlx_out_r_output_buffer[i].range(95, 88).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+12] = __xlx_out_r_output_buffer[i].range(103, 96).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+13] = __xlx_out_r_output_buffer[i].range(111, 104).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+14] = __xlx_out_r_output_buffer[i].range(119, 112).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+15] = __xlx_out_r_output_buffer[i].range(127, 120).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+16] = __xlx_out_r_output_buffer[i].range(135, 128).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+17] = __xlx_out_r_output_buffer[i].range(143, 136).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+18] = __xlx_out_r_output_buffer[i].range(151, 144).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+19] = __xlx_out_r_output_buffer[i].range(159, 152).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+20] = __xlx_out_r_output_buffer[i].range(167, 160).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+21] = __xlx_out_r_output_buffer[i].range(175, 168).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+22] = __xlx_out_r_output_buffer[i].range(183, 176).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+23] = __xlx_out_r_output_buffer[i].range(191, 184).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+24] = __xlx_out_r_output_buffer[i].range(199, 192).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+25] = __xlx_out_r_output_buffer[i].range(207, 200).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+26] = __xlx_out_r_output_buffer[i].range(215, 208).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+27] = __xlx_out_r_output_buffer[i].range(223, 216).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+28] = __xlx_out_r_output_buffer[i].range(231, 224).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+29] = __xlx_out_r_output_buffer[i].range(239, 232).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+30] = __xlx_out_r_output_buffer[i].range(247, 240).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+31] = __xlx_out_r_output_buffer[i].range(255, 248).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+32] = __xlx_out_r_output_buffer[i].range(263, 256).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+33] = __xlx_out_r_output_buffer[i].range(271, 264).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+34] = __xlx_out_r_output_buffer[i].range(279, 272).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+35] = __xlx_out_r_output_buffer[i].range(287, 280).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+36] = __xlx_out_r_output_buffer[i].range(295, 288).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+37] = __xlx_out_r_output_buffer[i].range(303, 296).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+38] = __xlx_out_r_output_buffer[i].range(311, 304).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+39] = __xlx_out_r_output_buffer[i].range(319, 312).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+40] = __xlx_out_r_output_buffer[i].range(327, 320).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+41] = __xlx_out_r_output_buffer[i].range(335, 328).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+42] = __xlx_out_r_output_buffer[i].range(343, 336).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+43] = __xlx_out_r_output_buffer[i].range(351, 344).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+44] = __xlx_out_r_output_buffer[i].range(359, 352).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+45] = __xlx_out_r_output_buffer[i].range(367, 360).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+46] = __xlx_out_r_output_buffer[i].range(375, 368).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+47] = __xlx_out_r_output_buffer[i].range(383, 376).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+48] = __xlx_out_r_output_buffer[i].range(391, 384).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+49] = __xlx_out_r_output_buffer[i].range(399, 392).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+50] = __xlx_out_r_output_buffer[i].range(407, 400).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+51] = __xlx_out_r_output_buffer[i].range(415, 408).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+52] = __xlx_out_r_output_buffer[i].range(423, 416).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+53] = __xlx_out_r_output_buffer[i].range(431, 424).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+54] = __xlx_out_r_output_buffer[i].range(439, 432).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+55] = __xlx_out_r_output_buffer[i].range(447, 440).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+56] = __xlx_out_r_output_buffer[i].range(455, 448).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+57] = __xlx_out_r_output_buffer[i].range(463, 456).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+58] = __xlx_out_r_output_buffer[i].range(471, 464).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+59] = __xlx_out_r_output_buffer[i].range(479, 472).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+60] = __xlx_out_r_output_buffer[i].range(487, 480).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+61] = __xlx_out_r_output_buffer[i].range(495, 488).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+62] = __xlx_out_r_output_buffer[i].range(503, 496).to_uint();
    ((char*)__xlx_apatb_param_out_r)[i*64+63] = __xlx_out_r_output_buffer[i].range(511, 504).to_uint();
  }
}
