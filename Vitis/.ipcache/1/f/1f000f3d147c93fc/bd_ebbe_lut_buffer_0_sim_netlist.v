// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Wed Aug 17 18:32:49 2022
// Host        : caadlab-01 running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_ebbe_lut_buffer_0_sim_netlist.v
// Design      : bd_ebbe_lut_buffer_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_ebbe_lut_buffer_0,lut_buffer_v2_0_0_lut_buffer,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "lut_buffer_v2_0_0_lut_buffer,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (tdi_i,
    tms_i,
    tck_i,
    drck_i,
    sel_i,
    shift_i,
    update_i,
    capture_i,
    runtest_i,
    reset_i,
    bscanid_en_i,
    tdo_o,
    tdi_o,
    tms_o,
    tck_o,
    drck_o,
    sel_o,
    shift_o,
    update_o,
    capture_o,
    runtest_o,
    reset_o,
    bscanid_en_o,
    tdo_i);
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TDI" *) input tdi_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TMS" *) input tms_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TCK" *) input tck_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan DRCK" *) input drck_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan SEL" *) input sel_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan SHIFT" *) input shift_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan UPDATE" *) input update_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan CAPTURE" *) input capture_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan RUNTEST" *) input runtest_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan RESET" *) input reset_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan BSCANID_EN" *) input bscanid_en_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TDO" *) output tdo_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TDI" *) output tdi_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TMS" *) output tms_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TCK" *) output tck_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan DRCK" *) output drck_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan SEL" *) output sel_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan SHIFT" *) output shift_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan UPDATE" *) output update_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan CAPTURE" *) output capture_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan RUNTEST" *) output runtest_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan RESET" *) output reset_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan BSCANID_EN" *) output bscanid_en_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TDO" *) input tdo_i;

  wire bscanid_en_i;
  wire bscanid_en_o;
  wire capture_i;
  wire capture_o;
  wire drck_i;
  wire drck_o;
  wire reset_i;
  wire reset_o;
  wire runtest_i;
  wire runtest_o;
  wire sel_i;
  wire sel_o;
  wire shift_i;
  wire shift_o;
  wire tck_i;
  wire tck_o;
  wire tdi_i;
  wire tdi_o;
  wire tdo_i;
  wire tdo_o;
  wire tms_i;
  wire tms_o;
  wire update_i;
  wire update_o;
  wire [31:0]NLW_inst_bscanid_o_UNCONNECTED;

  (* C_EN_BSCANID_VEC = "0" *) 
  (* DONT_TOUCH *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lut_buffer_v2_0_0_lut_buffer inst
       (.bscanid_en_i(bscanid_en_i),
        .bscanid_en_o(bscanid_en_o),
        .bscanid_i({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .bscanid_o(NLW_inst_bscanid_o_UNCONNECTED[31:0]),
        .capture_i(capture_i),
        .capture_o(capture_o),
        .drck_i(drck_i),
        .drck_o(drck_o),
        .reset_i(reset_i),
        .reset_o(reset_o),
        .runtest_i(runtest_i),
        .runtest_o(runtest_o),
        .sel_i(sel_i),
        .sel_o(sel_o),
        .shift_i(shift_i),
        .shift_o(shift_o),
        .tck_i(tck_i),
        .tck_o(tck_o),
        .tdi_i(tdi_i),
        .tdi_o(tdi_o),
        .tdo_i(tdo_i),
        .tdo_o(tdo_o),
        .tms_i(tms_i),
        .tms_o(tms_o),
        .update_i(update_i),
        .update_o(update_o));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
E/IDxqyIbtnagqQH8zNAv+zzM0pj3T8ofKyxFXN0s5hGXnkR6ZggI+Wu/9GWugo9aLM6HOu6/jgt
BvI/cUfp5FQ+pLzfOXVT8pe8VqLIh/AO1Pvu0rTDsmNlD4mhjQYBGe5IZ20Pnwnst/kMHYpWhqGl
Gfaxr/NV/vS9b+D+5V0=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
pYFrb2kLLX4JCPfDbI1PJnGNe4sCSCQiuHWV8VndaCXq5hrQahVb1yeaXNgFMeAGVv/SHfrKtcrc
00ZC8bJr/6VMjjEL2IVdI42l0ThWIOuVjXVYtdeYm1FZklJy3IPAViPGpWZDT4ldYs+BSkGRM77l
oqrfxfcBgTWIYyj52rqTlM9d5aO8NAdHhON6Nc/z6EU2Q862gGyV5z1+7iZ/RGGiPkRruWlTLtv6
2i78i9HEeiCyJB8uo5e0rSM0XcIDnMD//GphCkJx/vPepqPjOt1MnryEWSKnC8i4ZlTnBuVzPp96
rDcEI7cAujm9iJHKuEcMUvGybvqmG9WSC2WHsA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
sMWNa8IRUAmNJJG7ofQNP6428+mh1ASxoCYqchnM/leJyZXXDy6jWg6Tave0NzjrBXTLitGa5BVt
vSNAWFBjSIE2/JBSTu360imNvg/Gt3n9yMbnMX5cNYLEFO/GfcuE5xQhY841qdIBl9Mj1euNGyUj
e275QXsxAJPbALW1Ipk=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XkI6naHH2px89eWxLSEvC4MDxSyfJ18gpSXMc6acn/Vxb9FX0Ag1+bXlE/DpAIiImQNhrWsVjfhr
uYMcRz/mpmDsL0xweigfd24vz0+2rniB3fyfoJAJePL+QEnhKz0yDjNvqBfJ9ReSoefDeLw2GvAb
3+jLydBoSOmtgFQ/QAN0pjz6Er4yedIE+jBa3DC1XyWYX1UWxzvvLKVXme+yvMNUht83u8fvzA8c
heueZJXyyJCnTWIR1TFZg8wosQYeEjrz/KmuZODcIQm52OMxWESfVOYqqSyw1awKPAW2qWosGzb5
mBLPImSm0mr2rSTeSfrOKxnTfMpbwz9U2CGAvg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
H/QAD/6dtbTsD9Wi2gAiq6VJ2XnwLcufsfpQqLIDITJM11I5jHJCLhahhjc8xVYTpjAe6TE0gpJL
rhEzBRMIVyoT8rp1PE71ckqogFOUuTF4pl6BnEdhhQfw1NsUoY/PYggc2vwxwL+aNy19ptpQHPXw
HBHmpyXXSX5wrmQzdO4YP0ePhEaRhC33ix6e6MyL/watIxwZ4AgMRIY3tww032etLMMvYBiE4pyM
J2yIdNx7HorzqRAehFeKPRDLFH5cOWOnFeTVMpZIcxD36hlga3fAgropLyhpsDwQ//cn7+Vgu1zm
GQ2aqPOMs7LrMMQlpFnzXT4P6I0YmtMexGNK6A==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jJjHq8oJlHFHk86w3CZjJ0E5d0s/5YGmwXxMDySntex3lnkj/L8YNquAUgz0d1AKC2nfIYkSZmMz
a70oMHKzbrWMbpVQ1K9VXgxV2KZ3ptfMO8zyEIxKZh7mG/FrlVjEFIqXFnfI7WcFPlLL0poNQeuE
dSaEJFREjeHqLGXj06zUB+rFCdMeJ51AAxVZUScv9o8v8lykl6AYJBeBJphMPDlQsWGoJPsZPjs7
Ucb9mOvPAUcYJq6E3BGOyzi2wbn/8UoaYLWz13LRRuWxblqx4/dfBuEqI3svXyEeZHtL86VgjKeR
ool1b8dAacuypEbc0CjkCexM3u37+Ks8u/XcwA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kzo6BjCiAcmzQqjT9lZsdXQgEJ12K5y3Yf7f2eutdK9hZpaXDS6TWd/93RX3jT6JMmRaz/Y706PX
BHOME2tiDzWDxpjEFFLUQFi4GkPlFa7t2toaOH6EyJ2YDQnxYvlrgJq5LEnBlxD9vkoW++4BpHos
qUnoTfgU8tCJPsaNfsHb6n9ArNHS3WtlayKGi92fSpJO8MMywlqWDEQjtA1AMMW+M4foBMKxwLa4
9Q0Ol9uHH6etKCPYJP4CVeGlof0EkK4P/qnDXv+yIeJE4vqRbQRCfb825UdSPnLRcThDxtRbeMQV
iGoC+jaVAtBmRXJDRY+wPuaGApEJOaUDGk1Vbg==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
ewCK2JM/sH9UBqpYLWugJ2rQfV1MsrSkX0fq/OqatvCtdD8GQQYWuXRum2klDEXF1v4rTHoirvC0
aO6/HYSA0+9F4cQ6d5lyT3sG5nF8uZ7ZUMSfp64hQFsO06UDzRYtk2PfzOY56nL0I3OXRabB7/gw
JnB3bloSih5oiv0THsegJu47Vyhi0FdWJ8MAnshIAetaTOle/5o2IRRGTRC1kyk0YqM4rqfh5iYg
IDOpzvkNIEfAM//GwYRiRo6ukovMhK2fSdSY3wPpc0cjmWwHD9roo5SZF7t0xwOim3XXM4DOMbLg
X4vDuk/VRcanqFH7Z0HYqlN1a2o2sdDa7i9hEuSY6FRIBmKhjT44TNNlghSxWt+zZx8oFMiWsIVl
0/9BAPMvH15NVwWPVFzZ8J3lISQ2PwSIWlEjCRKhTz3toYw1i3DMOlwJRYzlXzAVEkJJqLLET6w2
aUlEyfHuvUvOMlftXriUxWMl6JaIbEoaq9d5OiL8Dj5d8Ya8hjqrVmFu

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GWQF9IvA//zUHFCDeWronggZ7/c6ijiRwOjtF6/uc/R4jb0zwj+US4qpijLj1Z41bttLFMpmBtOt
YYYp//dXRyB75g4lMV1Lp1Te478/OONRDmUOT9y9/uuqaV0Tbh7UbkiYp7BajKMJqv8PO/QkpoPZ
tIWbCmqyql77BlyTLMx5SooFqxtLp6wLQBRruaJiTojvrGXyUw1p5HbQ+1qo1c61ZteyERSWZGpE
AoBt0oQ3BXh1YM14cCtGiSiHU4PSv52LfoQ9uVv3wYFu80uHiL+3Hxm0lTw08+US20vIqULVZjUh
Ad96WseeuFRaFD4dT0EQa7amOWbE+5/ans6cJQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2960)
`pragma protect data_block
QjUqy+lIRpCmm/VCLS0rkm3kRz7rkmKGcz3CtAuCB12UDOdc8ldveOwHrVbDcmzoMmgxkKAHbLii
t3GeywPIPiHX394ar1PY/YtcyP0qj00MxgDjTPZCsPLaFrJYimys2/7UzEHdxGpacaLZmYHugZ7V
tMdKdWD/MCNaiSni0S0QhwvEVMKf28PDoSvIfY9lTYbvzsBLpz21DLZ4cKqhu7hya5o5hHyVWbj9
g4nE0tcT4gTwXqScX+jfYnIJlKNPEYSew94T5AlJ88TFbXq+L8A8x825d1IL9HtFqeH2pGiPaukv
HU3iyz4UtrANseRrHwwlEXaNR4uE+L82Pk+ZuWFvcxpZ94dKGwEd8PcBIOmpYyqHSEPoiv3h0fcO
YEjmkjdQlEIrEB2zaLgLRtCPlnpulhornQM2RS6VOnYAyJItpWDjiYJIU+eJkQZh+6mFYRpzshXm
lV/s4tHBNJoWH2J/D2JVQQq2a+v8rHGfZd7QaSP9ACS5d5qr3Tp6LnK1tqaBkq3M9q9Q4Sb3KbyD
VjHWsxgEdRfyYpa1UwUjHxuUycdW30AlGmIUiiiS5vmstg6sl+fYVyy2q8iqAEAkVx7HDLZ9v9X0
jmCeiDG7mL3YQSww1WvytcjHTwNGJ6ESISMByOwnmYRXVooAgpgrmD4LNeEirNB7M+ZjY4UVarKv
j6E+sfZYhKwnLTHcBazneSF7hHQMI6PbJU4tD89iLci5Btnr6OV0lkMr9KQ7eWe6Qp0wZ4JObB/V
j8bHIWx0X14paJF5T7X7kvq6iO0QOWHkLscBw96IXGycsXDtYBam5NYAJ1KtPXTOvPFv1e4DJa1J
7hD34H/9ehviFHPzE4tCEF72sEC+xUNZq+Ohi+C/Rb3loLJzN5Tqs5uJHorJXjV7ooWIfCFtnfD1
hvSeKDy8ahPOOL4TRg8n+jMHx+2eTnPCybfzVtCiQVnzuKslgyY+/LK148txWIVjPbVFAsiZDTFO
GIuABdBfKJIQKj8VLGNVwG6iCPjqi4i1XkP2HD7G5S1xWEiBEk4D+CA8yyEaNrgtNYSzBUpSTndn
ZMFptRmCPdgyQSmgYSyKtN03UA9et36Eh3h9um8cYKu0AM8JJts3je/eqeffV851xCCaXvpIUIyy
1R/fZNKH97ePdBJqoQ7/qnTnPPQ7PZxLIwwDKmr87OSF5aP6ZjNnDI+YDk0e3xIt8OPjoaiO/MOv
1zPUcfZr98Snoj90X+SeuI57JBOMRb0Kdh9t83/Y8MYf2dfzY0oZrFaDwURcMJWoTSfXrfKDppJA
Jf1XcJe8LheqtjGayKuzqUX/LGZVWOFAjgvoizfUnWlr7Brl+xWZ9Ko5FzeG4iHhvh1eCahA76Fz
80UwpCsEYAcn0lNE3ZorDWSvTPrC90Z88cnWxE8+DlH4z5QNmRkPb3+WMDgX4uDVI0/BhD2P3nW2
6LQUMTwspFarbMI7giAZoca4jrLoN3hoMApKzIuQdmpIMAxWfYpIy9MgscDT1c9EBuIFLH8ZIBxK
Mjb0g3WdgoDWpNdh05ipG63XRymg63NJgJQ1xM4+elLC8QrwSBE5am39rQBR+Lkj8sTFbaRHpgx/
l8BqbBjF6kIybSYdb0XY7KiehXNlslb4L2O0oqXnxyNfyRaELl7JsxhtjG3GjSXuaArDwuf86nqu
7rlQzcINP4I7iLsA6Y59QHSBt9nfdg8pO0K0uFySx18qlNTVcIiUPX9WvP1jywgK7Ak2BECms5DM
JnkbCcedKDwIz2Oxa9AVkJ6KWipt1NQuarIfVduq9assLgYnAQLgbgAAtDNvyxg0g7fmf0lfem3/
uI3TCAliwHooPqQgEpN99AL156m9XbblCqJyaJ7ELZbDPLxC8o2M+7ZLajwWP77Fys200VfkP7vs
unIV57IBFMCZSait+Kk5mAh9FcevShN0jXHYSrJL7wDIZ2ZELT2n/gWfTb8DMF/4vHKgRikJouRV
iaS0fJGNkmGCggt3SL0qBUG/13DFHfVI4S+mcKV9HXGJFO8LLp/DDziJ/11cpus5xe6XiCwxFqAD
z/8DeA0UukABeJj1nKRUSYggBCuA93jAY356MUxNbKbLbJ9BWBRhtL64EgXJJ7fGJbWj8vTJewwk
WABEqfICpPklnnBLBX+Ym9CmbIuQFJrQxVAzqOTNZQXGMs6KjL0xaAc4AssIZqwYL6thBlJdgAje
LAH8/vZMt5bGWK/vq9npvhQpmHcP6T4W4rFkk3AWI3E62fHonFTWKClE02i2x9PHolL4XR+j4Dgw
/eW2ryFez8Is+5Sq9u6H7dMsJgPrS9h3Y7PYInOTdAIRXzNPwD+Wy2uDV5ZwdnpDEkfYxGYw+QH7
x+pwYXmhkC4r81h2Li4uNAPXZ20iR/JXqkBR6t6Ihgw0QPcrw/oxXW5A2jlBfmIFBL6Bg+m/kSJ5
lJDLC5u3xLROD3Kl1Xk2zEPnTrlwcZxEQbC0kcjs6VMc7YmeLqY5l+fSmF+pgOXh1XjFiAiXX91P
3vh6MHaumxc1toELGXLnQ+njjP66kG6QvvGABc8GfzjMlR3fsaAA9HQwvIq5v3ERjNzJsWD/bLS0
sgmuMsRPgh4PQNHm3o+1fOguUCZJNTMdZDMst6JSo/FaS83xSHm56rgkvfKUK/mM9olPqO856DSa
q2brLVGuGKd9c7CLXZWO5BsJMpJKObLB0HZSfVOJqWtke7ET93MwCff1Q5OUPaRrOlPv3XRJDukf
XpEgCKFcryS0lfb4p+g1xty71dFFban6EL3Jrr0ABmDD1/qmFhZa84wbFuyY6i2mTSd7dh1R+LGj
3v4TV6zYxSzeOKozKGkgYLBTmj1+QAqaNgHZJicwMtb7yZ0W8QX93r18pfwCgn4aJrv62eungPqu
uupKuyYPBNAbJvYUwcUR7I+YR2YJ+snDiVDjQIzFbi2UCWknO3qNPo2M4OIAwHoocmWcubpSwwV2
o8pG85sKPFrs9szSIlNE7zZxb2RcwkSNeaDbsza40VRYg/o6BACSJIvCQ8/3IdNIj9FHvbvs/un7
oMcaiieOQb9yZD8Mb63s3uKG/OnO8FDkcWTOqKLgMhplJ0WWMbglsU9Suqo9pBCsvFQWYimis+tE
pffveGQichn6NfcXK5N1vrvep2pJn2MelVueqXF8iu9bOm0x1eDVM/hP9OB7KiP+4MjVmklVoawX
XVBrsF+LivD6O8MuSvZ0sc8dQeGPpJykmUaVJG65WMJwPEkRadsJkhSGZSwF0mtbylkH7C5/oeSy
JT0OX4TZwNsc6n9PHO97XYzKyu6b2cdCbTUYXLNyJFJALdkr0xWcBFc0cnZEzeDXsV2xIL5aw+9r
AZHFJln4/ObYtGCVStNpNGvfyBqhoxoQ0PbmQhgEb2jkXrrayor5ol/F0QhX3jQ9y2o7QFFHW53i
bz5NeANabMc6gpJftll60HTAtwGYTp57RfOgTBU/ZYkaSJ/BnXtHLH95IjYwEOltkstEIoJBVrg+
QaczmcNEivsAyPH2YhrUq5UPo9kaxx+/+MsJI8ftdGn3ptRBmbXksV7W8S+1LhpPIw5LpaVcpx1J
19IUA7TIG8WtEkZCf4hvHq3nv/CeqY170/m7E0aU20h6MXriTZJNRix+l9wTwN7IQw9unpV7j4iz
+9O/N+OZw/z4w9lIc1SJnIy0tsoOlZdgDWeWkVge9/HBT8ZVMo/WHAAnkeGwqq+wnot7Uq7/SawW
3ODxVLFBM7bLTigVtLjCxBydtNwzfL2vrWbF8uaBaQaF3nKxiKf52f/z3CS/nvAncxoDBo3vA/tU
zZ2j6cHniv6p1el86cFyRbEUkrbViUIRdir7aIOMGsYCUlU0UmvOL+Zn2OSvRc03hF73zAFzNHYG
do3bGQlSLuBNLN+hfuWQArMZkBOQzzO1sk70S1iJLrF7P/4Ik+FQnRZrvUB/2arv3gRuyfw=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
