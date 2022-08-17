#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_gmem "../tv/cdatafile/c.krnl_mm2s.autotvin_gmem.dat"
#define AUTOTB_TVOUT_gmem "../tv/cdatafile/c.krnl_mm2s.autotvout_gmem.dat"
// wrapc file define:
#define AUTOTB_TVIN_in_r "../tv/cdatafile/c.krnl_mm2s.autotvin_in_r.dat"
#define AUTOTB_TVOUT_in_r "../tv/cdatafile/c.krnl_mm2s.autotvout_in_r.dat"
// wrapc file define:
#define AUTOTB_TVIN_k2n_V_data_V "../tv/cdatafile/c.krnl_mm2s.autotvin_k2n_V_data_V.dat"
#define AUTOTB_TVOUT_k2n_V_data_V "../tv/cdatafile/c.krnl_mm2s.autotvout_k2n_V_data_V.dat"
#define AUTOTB_TVIN_k2n_V_keep_V "../tv/cdatafile/c.krnl_mm2s.autotvin_k2n_V_keep_V.dat"
#define AUTOTB_TVOUT_k2n_V_keep_V "../tv/cdatafile/c.krnl_mm2s.autotvout_k2n_V_keep_V.dat"
#define AUTOTB_TVIN_k2n_V_strb_V "../tv/cdatafile/c.krnl_mm2s.autotvin_k2n_V_strb_V.dat"
#define AUTOTB_TVOUT_k2n_V_strb_V "../tv/cdatafile/c.krnl_mm2s.autotvout_k2n_V_strb_V.dat"
#define AUTOTB_TVIN_k2n_V_user_V "../tv/cdatafile/c.krnl_mm2s.autotvin_k2n_V_user_V.dat"
#define AUTOTB_TVOUT_k2n_V_user_V "../tv/cdatafile/c.krnl_mm2s.autotvout_k2n_V_user_V.dat"
#define AUTOTB_TVIN_k2n_V_last_V "../tv/cdatafile/c.krnl_mm2s.autotvin_k2n_V_last_V.dat"
#define AUTOTB_TVOUT_k2n_V_last_V "../tv/cdatafile/c.krnl_mm2s.autotvout_k2n_V_last_V.dat"
#define AUTOTB_TVIN_k2n_V_id_V "../tv/cdatafile/c.krnl_mm2s.autotvin_k2n_V_id_V.dat"
#define AUTOTB_TVOUT_k2n_V_id_V "../tv/cdatafile/c.krnl_mm2s.autotvout_k2n_V_id_V.dat"
#define AUTOTB_TVIN_k2n_V_dest_V "../tv/cdatafile/c.krnl_mm2s.autotvin_k2n_V_dest_V.dat"
#define AUTOTB_TVOUT_k2n_V_dest_V "../tv/cdatafile/c.krnl_mm2s.autotvout_k2n_V_dest_V.dat"
#define WRAPC_STREAM_SIZE_OUT_k2n_V_data_V "../tv/stream_size/stream_size_out_k2n_V_data_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_k2n_V_data_V "../tv/stream_size/stream_egress_status_k2n_V_data_V.dat"
#define WRAPC_STREAM_SIZE_OUT_k2n_V_keep_V "../tv/stream_size/stream_size_out_k2n_V_keep_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_k2n_V_keep_V "../tv/stream_size/stream_egress_status_k2n_V_keep_V.dat"
#define WRAPC_STREAM_SIZE_OUT_k2n_V_strb_V "../tv/stream_size/stream_size_out_k2n_V_strb_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_k2n_V_strb_V "../tv/stream_size/stream_egress_status_k2n_V_strb_V.dat"
#define WRAPC_STREAM_SIZE_OUT_k2n_V_user_V "../tv/stream_size/stream_size_out_k2n_V_user_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_k2n_V_user_V "../tv/stream_size/stream_egress_status_k2n_V_user_V.dat"
#define WRAPC_STREAM_SIZE_OUT_k2n_V_last_V "../tv/stream_size/stream_size_out_k2n_V_last_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_k2n_V_last_V "../tv/stream_size/stream_egress_status_k2n_V_last_V.dat"
#define WRAPC_STREAM_SIZE_OUT_k2n_V_id_V "../tv/stream_size/stream_size_out_k2n_V_id_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_k2n_V_id_V "../tv/stream_size/stream_egress_status_k2n_V_id_V.dat"
#define WRAPC_STREAM_SIZE_OUT_k2n_V_dest_V "../tv/stream_size/stream_size_out_k2n_V_dest_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_k2n_V_dest_V "../tv/stream_size/stream_egress_status_k2n_V_dest_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_size "../tv/cdatafile/c.krnl_mm2s.autotvin_size.dat"
#define AUTOTB_TVOUT_size "../tv/cdatafile/c.krnl_mm2s.autotvout_size.dat"
// wrapc file define:
#define AUTOTB_TVIN_dest "../tv/cdatafile/c.krnl_mm2s.autotvin_dest.dat"
#define AUTOTB_TVOUT_dest "../tv/cdatafile/c.krnl_mm2s.autotvout_dest.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_gmem "../tv/rtldatafile/rtl.krnl_mm2s.autotvout_gmem.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_in_r "../tv/rtldatafile/rtl.krnl_mm2s.autotvout_in_r.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_k2n_V_data_V "../tv/rtldatafile/rtl.krnl_mm2s.autotvout_k2n_V_data_V.dat"
#define AUTOTB_TVOUT_PC_k2n_V_keep_V "../tv/rtldatafile/rtl.krnl_mm2s.autotvout_k2n_V_keep_V.dat"
#define AUTOTB_TVOUT_PC_k2n_V_strb_V "../tv/rtldatafile/rtl.krnl_mm2s.autotvout_k2n_V_strb_V.dat"
#define AUTOTB_TVOUT_PC_k2n_V_user_V "../tv/rtldatafile/rtl.krnl_mm2s.autotvout_k2n_V_user_V.dat"
#define AUTOTB_TVOUT_PC_k2n_V_last_V "../tv/rtldatafile/rtl.krnl_mm2s.autotvout_k2n_V_last_V.dat"
#define AUTOTB_TVOUT_PC_k2n_V_id_V "../tv/rtldatafile/rtl.krnl_mm2s.autotvout_k2n_V_id_V.dat"
#define AUTOTB_TVOUT_PC_k2n_V_dest_V "../tv/rtldatafile/rtl.krnl_mm2s.autotvout_k2n_V_dest_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_size "../tv/rtldatafile/rtl.krnl_mm2s.autotvout_size.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_dest "../tv/rtldatafile/rtl.krnl_mm2s.autotvout_dest.dat"


inline void rev_endian(char* p, size_t nbytes)
{
  std::reverse(p, p+nbytes);
}

template<size_t bit_width>
struct transaction {
  typedef uint64_t depth_t;
  static const size_t wbytes = (bit_width+7)>>3;
  static const size_t dbytes = sizeof(depth_t);
  const depth_t depth;
  const size_t vbytes;
  const size_t tbytes;
  char * const p;
  typedef char (*p_dat)[wbytes];
  p_dat vp;

  void reorder() {
    rev_endian(p, dbytes);
    p_dat vp = (p_dat) (p+dbytes);
    for (depth_t i = 0; i < depth; ++i) {
      rev_endian(vp[i], wbytes);
    }
  }

  transaction(depth_t depth)
    : depth(depth), vbytes(wbytes*depth), tbytes(dbytes+vbytes),
      p(new char[tbytes]) {
    *(depth_t*)p = depth;
    vp = (p_dat) (p+dbytes);
  }

  template<size_t psize>
  void import(char* param, depth_t num, int64_t offset) {
    param -= offset*psize;
    for (depth_t i = 0; i < num; ++i) {
      memcpy(vp[i], param, wbytes);
      param += psize;
    }
    vp += num;
  }

  template<size_t psize>
  void send(char* param, depth_t num) {
    for (depth_t i = 0; i < num; ++i) {
      memcpy(param, vp[i], wbytes);
      param += psize;
    }
    vp += num;
  }

  template<size_t psize>
  void send(char* param, depth_t num, int64_t skip) {
    for (depth_t i = 0; i < num; ++i) {
      memcpy(param, vp[skip+i], wbytes);
      param += psize;
    }
  }

  ~transaction() { if (p) { delete[] p; } }
};
      

inline const std::string begin_str(int num)
{
  return std::string("[[transaction]] ")
         .append(std::to_string(num))
         .append("\n");
}

inline const std::string end_str()
{
  return std::string("[[/transaction]] \n");
}
      
class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  gmem_depth = 0;
  in_r_depth = 0;
  k2n_V_data_V_depth = 0;
  k2n_V_keep_V_depth = 0;
  k2n_V_strb_V_depth = 0;
  k2n_V_user_V_depth = 0;
  k2n_V_last_V_depth = 0;
  k2n_V_id_V_depth = 0;
  k2n_V_dest_V_depth = 0;
  size_depth = 0;
  dest_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{gmem " << gmem_depth << "}\n";
  total_list << "{in_r " << in_r_depth << "}\n";
  total_list << "{k2n_V_data_V " << k2n_V_data_V_depth << "}\n";
  total_list << "{k2n_V_keep_V " << k2n_V_keep_V_depth << "}\n";
  total_list << "{k2n_V_strb_V " << k2n_V_strb_V_depth << "}\n";
  total_list << "{k2n_V_user_V " << k2n_V_user_V_depth << "}\n";
  total_list << "{k2n_V_last_V " << k2n_V_last_V_depth << "}\n";
  total_list << "{k2n_V_id_V " << k2n_V_id_V_depth << "}\n";
  total_list << "{k2n_V_dest_V " << k2n_V_dest_V_depth << "}\n";
  total_list << "{size " << size_depth << "}\n";
  total_list << "{dest " << dest_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int gmem_depth;
    int in_r_depth;
    int k2n_V_data_V_depth;
    int k2n_V_keep_V_depth;
    int k2n_V_strb_V_depth;
    int k2n_V_user_V_depth;
    int k2n_V_last_V_depth;
    int k2n_V_id_V_depth;
    int k2n_V_dest_V_depth;
    int size_depth;
    int dest_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};

static bool RTLOutputCheckAndReplacement(std::string &AESL_token, std::string PortName) {
  bool err = false;
  size_t x_found;

  // search and replace 'X' with '0' from the 3rd char of token
  while ((x_found = AESL_token.find('X', 0)) != string::npos)
    err = true, AESL_token.replace(x_found, 1, "0");
  
  // search and replace 'x' with '0' from the 3rd char of token
  while ((x_found = AESL_token.find('x', 2)) != string::npos)
    err = true, AESL_token.replace(x_found, 1, "0");
  
  return err;}
struct __cosim_s40__ { char data[64]; };
extern "C" void krnl_mm2s_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, int, int);

extern "C" void apatb_krnl_mm2s_hw(volatile void * __xlx_apatb_param_in_r, volatile void * __xlx_apatb_param_k2n_V_data_V, volatile void * __xlx_apatb_param_k2n_V_keep_V, volatile void * __xlx_apatb_param_k2n_V_strb_V, volatile void * __xlx_apatb_param_k2n_V_user_V, volatile void * __xlx_apatb_param_k2n_V_last_V, volatile void * __xlx_apatb_param_k2n_V_id_V, volatile void * __xlx_apatb_param_k2n_V_dest_V, int __xlx_apatb_param_size, int __xlx_apatb_param_dest) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
static AESL_FILE_HANDLER aesl_fh;
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;
{unsigned xlx_stream_k2n_size = 0;

          std::vector<sc_bv<512> > k2n_V_data_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_k2n_V_data_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<512> > k2n_V_data_V_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token, "k2n");
  
            // push token into output port buffer
            if (AESL_token != "") {
              k2n_V_data_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "k2n" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {xlx_stream_k2n_size=k2n_V_data_V_pc_buffer.size();
k2n_V_data_V_pc_buffer_Copy=k2n_V_data_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<512> > k2n_V_keep_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_k2n_V_keep_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<512> > k2n_V_keep_V_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token, "k2n");
  
            // push token into output port buffer
            if (AESL_token != "") {
              k2n_V_keep_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "k2n" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {xlx_stream_k2n_size=k2n_V_keep_V_pc_buffer.size();
k2n_V_keep_V_pc_buffer_Copy=k2n_V_keep_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<512> > k2n_V_strb_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_k2n_V_strb_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<512> > k2n_V_strb_V_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token, "k2n");
  
            // push token into output port buffer
            if (AESL_token != "") {
              k2n_V_strb_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "k2n" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {xlx_stream_k2n_size=k2n_V_strb_V_pc_buffer.size();
k2n_V_strb_V_pc_buffer_Copy=k2n_V_strb_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<512> > k2n_V_user_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_k2n_V_user_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<512> > k2n_V_user_V_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token, "k2n");
  
            // push token into output port buffer
            if (AESL_token != "") {
              k2n_V_user_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "k2n" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {xlx_stream_k2n_size=k2n_V_user_V_pc_buffer.size();
k2n_V_user_V_pc_buffer_Copy=k2n_V_user_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<512> > k2n_V_last_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_k2n_V_last_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<512> > k2n_V_last_V_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token, "k2n");
  
            // push token into output port buffer
            if (AESL_token != "") {
              k2n_V_last_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "k2n" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {xlx_stream_k2n_size=k2n_V_last_V_pc_buffer.size();
k2n_V_last_V_pc_buffer_Copy=k2n_V_last_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<512> > k2n_V_id_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_k2n_V_id_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<512> > k2n_V_id_V_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token, "k2n");
  
            // push token into output port buffer
            if (AESL_token != "") {
              k2n_V_id_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "k2n" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {xlx_stream_k2n_size=k2n_V_id_V_pc_buffer.size();
k2n_V_id_V_pc_buffer_Copy=k2n_V_id_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<512> > k2n_V_dest_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_k2n_V_dest_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<512> > k2n_V_dest_V_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token, "k2n");
  
            // push token into output port buffer
            if (AESL_token != "") {
              k2n_V_dest_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "k2n" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {xlx_stream_k2n_size=k2n_V_dest_V_pc_buffer.size();
k2n_V_dest_V_pc_buffer_Copy=k2n_V_dest_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (int j = 0, e = xlx_stream_k2n_size; j != e; ++j) {
__cosim_s40__ xlx_stream_elt_data;
((long long*)&xlx_stream_elt_data)[0*8+0] = k2n_V_data_V_pc_buffer_Copy[j].range(63,0).to_int64();
((long long*)&xlx_stream_elt_data)[0*8+1] = k2n_V_data_V_pc_buffer_Copy[j].range(127,64).to_int64();
((long long*)&xlx_stream_elt_data)[0*8+2] = k2n_V_data_V_pc_buffer_Copy[j].range(191,128).to_int64();
((long long*)&xlx_stream_elt_data)[0*8+3] = k2n_V_data_V_pc_buffer_Copy[j].range(255,192).to_int64();
((long long*)&xlx_stream_elt_data)[0*8+4] = k2n_V_data_V_pc_buffer_Copy[j].range(319,256).to_int64();
((long long*)&xlx_stream_elt_data)[0*8+5] = k2n_V_data_V_pc_buffer_Copy[j].range(383,320).to_int64();
((long long*)&xlx_stream_elt_data)[0*8+6] = k2n_V_data_V_pc_buffer_Copy[j].range(447,384).to_int64();
((long long*)&xlx_stream_elt_data)[0*8+7] = k2n_V_data_V_pc_buffer_Copy[j].range(511,448).to_int64();
((hls::stream<__cosim_s40__>*)__xlx_apatb_param_k2n_V_data_V)->write(xlx_stream_elt_data);
long long xlx_stream_elt_keep;
((long long*)&xlx_stream_elt_keep)[0] = k2n_V_keep_V_pc_buffer_Copy[j].to_int64();
((hls::stream<long long>*)__xlx_apatb_param_k2n_V_keep_V)->write(xlx_stream_elt_keep);
long long xlx_stream_elt_strb;
((long long*)&xlx_stream_elt_strb)[0] = k2n_V_strb_V_pc_buffer_Copy[j].to_int64();
((hls::stream<long long>*)__xlx_apatb_param_k2n_V_strb_V)->write(xlx_stream_elt_strb);
char xlx_stream_elt_user;
((char*)&xlx_stream_elt_user)[0] = k2n_V_user_V_pc_buffer_Copy[j].to_uint64();
((hls::stream<char>*)__xlx_apatb_param_k2n_V_user_V)->write(xlx_stream_elt_user);
char xlx_stream_elt_last;
((char*)&xlx_stream_elt_last)[0] = k2n_V_last_V_pc_buffer_Copy[j].to_uint64();
((hls::stream<char>*)__xlx_apatb_param_k2n_V_last_V)->write(xlx_stream_elt_last);
char xlx_stream_elt_id;
((char*)&xlx_stream_elt_id)[0] = k2n_V_id_V_pc_buffer_Copy[j].to_uint64();
((hls::stream<char>*)__xlx_apatb_param_k2n_V_id_V)->write(xlx_stream_elt_id);
short xlx_stream_elt_dest;
((short*)&xlx_stream_elt_dest)[0] = k2n_V_dest_V_pc_buffer_Copy[j].to_int64();
((hls::stream<short>*)__xlx_apatb_param_k2n_V_dest_V)->write(xlx_stream_elt_dest);
}}
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_k2n_V_data_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_k2n_V_data_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_k2n_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_k2n_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_k2n_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_k2n_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_k2n_V_user_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_k2n_V_user_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_k2n_V_last_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_k2n_V_last_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_k2n_V_id_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_k2n_V_id_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_k2n_V_dest_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_k2n_V_dest_V);
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_in_r = 0;
// print gmem Transactions
{
aesl_fh.write(AUTOTB_TVIN_gmem, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_in_r = 0*64;
  if (__xlx_apatb_param_in_r) {
    for (int j = 0  - 0, e = 1 - 0; j != e; ++j) {
sc_bv<512> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)__xlx_apatb_param_in_r)[j*8+0];
__xlx_tmp_lv.range(127,64) = ((long long*)__xlx_apatb_param_in_r)[j*8+1];
__xlx_tmp_lv.range(191,128) = ((long long*)__xlx_apatb_param_in_r)[j*8+2];
__xlx_tmp_lv.range(255,192) = ((long long*)__xlx_apatb_param_in_r)[j*8+3];
__xlx_tmp_lv.range(319,256) = ((long long*)__xlx_apatb_param_in_r)[j*8+4];
__xlx_tmp_lv.range(383,320) = ((long long*)__xlx_apatb_param_in_r)[j*8+5];
__xlx_tmp_lv.range(447,384) = ((long long*)__xlx_apatb_param_in_r)[j*8+6];
__xlx_tmp_lv.range(511,448) = ((long long*)__xlx_apatb_param_in_r)[j*8+7];
aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
    }
  }
}

  tcl_file.set_num(1, &tcl_file.gmem_depth);
aesl_fh.write(AUTOTB_TVIN_gmem, end_str());
}

// print in_r Transactions
{
aesl_fh.write(AUTOTB_TVIN_in_r, begin_str(AESL_transaction));
{
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_in_r;
aesl_fh.write(AUTOTB_TVIN_in_r, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.in_r_depth);
aesl_fh.write(AUTOTB_TVIN_in_r, end_str());
}

// data
std::vector<__cosim_s40__> __xlx_apatb_param_k2n_V_data_V_stream_buf;
long __xlx_apatb_param_k2n_stream_buf_size = ((hls::stream<__cosim_s40__>*)__xlx_apatb_param_k2n_V_data_V)->size();
// keep
std::vector<long long> __xlx_apatb_param_k2n_V_keep_V_stream_buf;
// strb
std::vector<long long> __xlx_apatb_param_k2n_V_strb_V_stream_buf;
// user
std::vector<char> __xlx_apatb_param_k2n_V_user_V_stream_buf;
// last
std::vector<char> __xlx_apatb_param_k2n_V_last_V_stream_buf;
// id
std::vector<char> __xlx_apatb_param_k2n_V_id_V_stream_buf;
// dest
std::vector<short> __xlx_apatb_param_k2n_V_dest_V_stream_buf;
// print size Transactions
{
aesl_fh.write(AUTOTB_TVIN_size, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)&__xlx_apatb_param_size);
aesl_fh.write(AUTOTB_TVIN_size, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.size_depth);
aesl_fh.write(AUTOTB_TVIN_size, end_str());
}

// print dest Transactions
{
aesl_fh.write(AUTOTB_TVIN_dest, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)&__xlx_apatb_param_dest);
aesl_fh.write(AUTOTB_TVIN_dest, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.dest_depth);
aesl_fh.write(AUTOTB_TVIN_dest, end_str());
}

CodeState = CALL_C_DUT;
krnl_mm2s_hw_stub_wrapper(__xlx_apatb_param_in_r, __xlx_apatb_param_k2n_V_data_V, __xlx_apatb_param_k2n_V_keep_V, __xlx_apatb_param_k2n_V_strb_V, __xlx_apatb_param_k2n_V_user_V, __xlx_apatb_param_k2n_V_last_V, __xlx_apatb_param_k2n_V_id_V, __xlx_apatb_param_k2n_V_dest_V, __xlx_apatb_param_size, __xlx_apatb_param_dest);
CodeState = DUMP_OUTPUTS;

//********************** dump C output stream *******************
long __xlx_apatb_param_k2n_stream_buf_final_size = ((hls::stream<__cosim_s40__>*)__xlx_apatb_param_k2n_V_data_V)->size() - __xlx_apatb_param_k2n_stream_buf_size;
{
  while (!((hls::stream<__cosim_s40__>*)__xlx_apatb_param_k2n_V_data_V)->empty())
    __xlx_apatb_param_k2n_V_data_V_stream_buf.push_back(((hls::stream<__cosim_s40__>*)__xlx_apatb_param_k2n_V_data_V)->read());
  for (int i = 0; i < __xlx_apatb_param_k2n_V_data_V_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s40__>*)__xlx_apatb_param_k2n_V_data_V)->write(__xlx_apatb_param_k2n_V_data_V_stream_buf[i]);
  }
{
  while (!((hls::stream<long long>*)__xlx_apatb_param_k2n_V_keep_V)->empty())
    __xlx_apatb_param_k2n_V_keep_V_stream_buf.push_back(((hls::stream<long long>*)__xlx_apatb_param_k2n_V_keep_V)->read());
  for (int i = 0; i < __xlx_apatb_param_k2n_V_keep_V_stream_buf.size(); ++i)
    ((hls::stream<long long>*)__xlx_apatb_param_k2n_V_keep_V)->write(__xlx_apatb_param_k2n_V_keep_V_stream_buf[i]);
  }
{
  while (!((hls::stream<long long>*)__xlx_apatb_param_k2n_V_strb_V)->empty())
    __xlx_apatb_param_k2n_V_strb_V_stream_buf.push_back(((hls::stream<long long>*)__xlx_apatb_param_k2n_V_strb_V)->read());
  for (int i = 0; i < __xlx_apatb_param_k2n_V_strb_V_stream_buf.size(); ++i)
    ((hls::stream<long long>*)__xlx_apatb_param_k2n_V_strb_V)->write(__xlx_apatb_param_k2n_V_strb_V_stream_buf[i]);
  }
{
  while (!((hls::stream<char>*)__xlx_apatb_param_k2n_V_user_V)->empty())
    __xlx_apatb_param_k2n_V_user_V_stream_buf.push_back(((hls::stream<char>*)__xlx_apatb_param_k2n_V_user_V)->read());
  for (int i = 0; i < __xlx_apatb_param_k2n_V_user_V_stream_buf.size(); ++i)
    ((hls::stream<char>*)__xlx_apatb_param_k2n_V_user_V)->write(__xlx_apatb_param_k2n_V_user_V_stream_buf[i]);
  }
{
  while (!((hls::stream<char>*)__xlx_apatb_param_k2n_V_last_V)->empty())
    __xlx_apatb_param_k2n_V_last_V_stream_buf.push_back(((hls::stream<char>*)__xlx_apatb_param_k2n_V_last_V)->read());
  for (int i = 0; i < __xlx_apatb_param_k2n_V_last_V_stream_buf.size(); ++i)
    ((hls::stream<char>*)__xlx_apatb_param_k2n_V_last_V)->write(__xlx_apatb_param_k2n_V_last_V_stream_buf[i]);
  }
{
  while (!((hls::stream<char>*)__xlx_apatb_param_k2n_V_id_V)->empty())
    __xlx_apatb_param_k2n_V_id_V_stream_buf.push_back(((hls::stream<char>*)__xlx_apatb_param_k2n_V_id_V)->read());
  for (int i = 0; i < __xlx_apatb_param_k2n_V_id_V_stream_buf.size(); ++i)
    ((hls::stream<char>*)__xlx_apatb_param_k2n_V_id_V)->write(__xlx_apatb_param_k2n_V_id_V_stream_buf[i]);
  }
{
  while (!((hls::stream<short>*)__xlx_apatb_param_k2n_V_dest_V)->empty())
    __xlx_apatb_param_k2n_V_dest_V_stream_buf.push_back(((hls::stream<short>*)__xlx_apatb_param_k2n_V_dest_V)->read());
  for (int i = 0; i < __xlx_apatb_param_k2n_V_dest_V_stream_buf.size(); ++i)
    ((hls::stream<short>*)__xlx_apatb_param_k2n_V_dest_V)->write(__xlx_apatb_param_k2n_V_dest_V_stream_buf[i]);
  }
aesl_fh.write(AUTOTB_TVOUT_k2n_V_data_V, begin_str(AESL_transaction));
aesl_fh.write(AUTOTB_TVOUT_k2n_V_keep_V, begin_str(AESL_transaction));
aesl_fh.write(AUTOTB_TVOUT_k2n_V_strb_V, begin_str(AESL_transaction));
aesl_fh.write(AUTOTB_TVOUT_k2n_V_user_V, begin_str(AESL_transaction));
aesl_fh.write(AUTOTB_TVOUT_k2n_V_last_V, begin_str(AESL_transaction));
aesl_fh.write(AUTOTB_TVOUT_k2n_V_id_V, begin_str(AESL_transaction));
aesl_fh.write(AUTOTB_TVOUT_k2n_V_dest_V, begin_str(AESL_transaction));
for (int j = 0, e = __xlx_apatb_param_k2n_stream_buf_final_size; j != e; ++j) {
sc_bv<512> __xlx_tmp_0_lv;
{
sc_bv<512> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)&__xlx_apatb_param_k2n_V_data_V_stream_buf[__xlx_apatb_param_k2n_stream_buf_size+j])[0*8+0];
__xlx_tmp_lv.range(127,64) = ((long long*)&__xlx_apatb_param_k2n_V_data_V_stream_buf[__xlx_apatb_param_k2n_stream_buf_size+j])[0*8+1];
__xlx_tmp_lv.range(191,128) = ((long long*)&__xlx_apatb_param_k2n_V_data_V_stream_buf[__xlx_apatb_param_k2n_stream_buf_size+j])[0*8+2];
__xlx_tmp_lv.range(255,192) = ((long long*)&__xlx_apatb_param_k2n_V_data_V_stream_buf[__xlx_apatb_param_k2n_stream_buf_size+j])[0*8+3];
__xlx_tmp_lv.range(319,256) = ((long long*)&__xlx_apatb_param_k2n_V_data_V_stream_buf[__xlx_apatb_param_k2n_stream_buf_size+j])[0*8+4];
__xlx_tmp_lv.range(383,320) = ((long long*)&__xlx_apatb_param_k2n_V_data_V_stream_buf[__xlx_apatb_param_k2n_stream_buf_size+j])[0*8+5];
__xlx_tmp_lv.range(447,384) = ((long long*)&__xlx_apatb_param_k2n_V_data_V_stream_buf[__xlx_apatb_param_k2n_stream_buf_size+j])[0*8+6];
__xlx_tmp_lv.range(511,448) = ((long long*)&__xlx_apatb_param_k2n_V_data_V_stream_buf[__xlx_apatb_param_k2n_stream_buf_size+j])[0*8+7];
__xlx_tmp_0_lv = __xlx_tmp_lv;
}
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_0_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_k2n_V_data_V, __xlx_sprintf_buffer.data());
sc_bv<64> __xlx_tmp_1_lv = ((long long*)&__xlx_apatb_param_k2n_V_keep_V_stream_buf[__xlx_apatb_param_k2n_stream_buf_size+j])[0];
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_1_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_k2n_V_keep_V, __xlx_sprintf_buffer.data());
sc_bv<64> __xlx_tmp_2_lv = ((long long*)&__xlx_apatb_param_k2n_V_strb_V_stream_buf[__xlx_apatb_param_k2n_stream_buf_size+j])[0];
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_2_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_k2n_V_strb_V, __xlx_sprintf_buffer.data());
sc_bv<1> __xlx_tmp_3_lv = ((char*)&__xlx_apatb_param_k2n_V_user_V_stream_buf[__xlx_apatb_param_k2n_stream_buf_size+j])[0];
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_3_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_k2n_V_user_V, __xlx_sprintf_buffer.data());
sc_bv<1> __xlx_tmp_4_lv = ((char*)&__xlx_apatb_param_k2n_V_last_V_stream_buf[__xlx_apatb_param_k2n_stream_buf_size+j])[0];
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_4_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_k2n_V_last_V, __xlx_sprintf_buffer.data());
sc_bv<1> __xlx_tmp_5_lv = ((char*)&__xlx_apatb_param_k2n_V_id_V_stream_buf[__xlx_apatb_param_k2n_stream_buf_size+j])[0];
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_5_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_k2n_V_id_V, __xlx_sprintf_buffer.data());
sc_bv<16> __xlx_tmp_6_lv = ((short*)&__xlx_apatb_param_k2n_V_dest_V_stream_buf[__xlx_apatb_param_k2n_stream_buf_size+j])[0];
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_6_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_k2n_V_dest_V, __xlx_sprintf_buffer.data());
}
tcl_file.set_num(__xlx_apatb_param_k2n_stream_buf_final_size, &tcl_file.k2n_V_data_V_depth);
aesl_fh.write(AUTOTB_TVOUT_k2n_V_data_V, end_str());
tcl_file.set_num(__xlx_apatb_param_k2n_stream_buf_final_size, &tcl_file.k2n_V_keep_V_depth);
aesl_fh.write(AUTOTB_TVOUT_k2n_V_keep_V, end_str());
tcl_file.set_num(__xlx_apatb_param_k2n_stream_buf_final_size, &tcl_file.k2n_V_strb_V_depth);
aesl_fh.write(AUTOTB_TVOUT_k2n_V_strb_V, end_str());
tcl_file.set_num(__xlx_apatb_param_k2n_stream_buf_final_size, &tcl_file.k2n_V_user_V_depth);
aesl_fh.write(AUTOTB_TVOUT_k2n_V_user_V, end_str());
tcl_file.set_num(__xlx_apatb_param_k2n_stream_buf_final_size, &tcl_file.k2n_V_last_V_depth);
aesl_fh.write(AUTOTB_TVOUT_k2n_V_last_V, end_str());
tcl_file.set_num(__xlx_apatb_param_k2n_stream_buf_final_size, &tcl_file.k2n_V_id_V_depth);
aesl_fh.write(AUTOTB_TVOUT_k2n_V_id_V, end_str());
tcl_file.set_num(__xlx_apatb_param_k2n_stream_buf_final_size, &tcl_file.k2n_V_dest_V_depth);
aesl_fh.write(AUTOTB_TVOUT_k2n_V_dest_V, end_str());
{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_k2n_V_data_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_k2n_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_k2n_V_data_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_k2n_V_data_V, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_k2n_V_keep_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_k2n_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_k2n_V_keep_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_k2n_V_keep_V, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_k2n_V_strb_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_k2n_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_k2n_V_strb_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_k2n_V_strb_V, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_k2n_V_user_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_k2n_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_k2n_V_user_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_k2n_V_user_V, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_k2n_V_last_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_k2n_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_k2n_V_last_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_k2n_V_last_V, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_k2n_V_id_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_k2n_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_k2n_V_id_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_k2n_V_id_V, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_k2n_V_dest_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_k2n_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_k2n_V_dest_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_k2n_V_dest_V, end_str());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
