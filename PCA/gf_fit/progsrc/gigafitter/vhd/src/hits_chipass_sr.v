////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.39
//  \   \         Application: netgen
//  /   /         Filename: hits_chipass_sr.v
// /___/   /\     Timestamp: Thu Jul  9 18:09:47 2009
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog /home/dasnake/lavori/gigafitter/firmware/mezzanina_4w_6f/tmp/_cg/hits_chipass_sr.ngc /home/dasnake/lavori/gigafitter/firmware/mezzanina_4w_6f/tmp/_cg/hits_chipass_sr.v 
// Device	: 5vsx95tff1136-1
// Input file	: /home/dasnake/lavori/gigafitter/firmware/mezzanina_4w_6f/tmp/_cg/hits_chipass_sr.ngc
// Output file	: /home/dasnake/lavori/gigafitter/firmware/mezzanina_4w_6f/tmp/_cg/hits_chipass_sr.v
// # of Modules	: 1
// Design Name	: hits_chipass_sr
// Xilinx        : /home/dasnake/Xilinx/10.1/ISE
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Development System Reference Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module hits_chipass_sr (
  clk, d, q
);
  input clk;
  input [59 : 0] d;
  output [59 : 0] q;
  
  // synthesis translate_off
  
  wire \BU2/sclr ;
  wire \BU2/sset ;
  wire \BU2/sinit ;
  wire \BU2/ainit ;
  wire \BU2/aclr ;
  wire \BU2/ce ;
  wire \BU2/aset ;
  wire \BU2/U0/Mshreg_q_58_182 ;
  wire \BU2/U0/Mshreg_q_57_181 ;
  wire \BU2/U0/Mshreg_q_59_180 ;
  wire \BU2/U0/Mshreg_q_56_179 ;
  wire \BU2/U0/Mshreg_q_55_178 ;
  wire \BU2/U0/Mshreg_q_54_177 ;
  wire \BU2/U0/Mshreg_q_53_176 ;
  wire \BU2/U0/Mshreg_q_52_175 ;
  wire \BU2/U0/Mshreg_q_51_174 ;
  wire \BU2/U0/Mshreg_q_50_173 ;
  wire \BU2/U0/Mshreg_q_49_172 ;
  wire \BU2/U0/Mshreg_q_48_171 ;
  wire \BU2/U0/Mshreg_q_47_170 ;
  wire \BU2/U0/Mshreg_q_46_169 ;
  wire \BU2/U0/Mshreg_q_45_168 ;
  wire \BU2/U0/Mshreg_q_43_167 ;
  wire \BU2/U0/Mshreg_q_42_166 ;
  wire \BU2/U0/Mshreg_q_44_165 ;
  wire \BU2/U0/Mshreg_q_41_164 ;
  wire \BU2/U0/Mshreg_q_40_163 ;
  wire \BU2/U0/Mshreg_q_39_162 ;
  wire \BU2/U0/Mshreg_q_38_161 ;
  wire \BU2/U0/Mshreg_q_37_160 ;
  wire \BU2/U0/Mshreg_q_36_159 ;
  wire \BU2/U0/Mshreg_q_35_158 ;
  wire \BU2/U0/Mshreg_q_34_157 ;
  wire \BU2/U0/Mshreg_q_33_156 ;
  wire \BU2/U0/Mshreg_q_32_155 ;
  wire \BU2/U0/Mshreg_q_31_154 ;
  wire \BU2/U0/Mshreg_q_30_153 ;
  wire \BU2/U0/Mshreg_q_28_152 ;
  wire \BU2/U0/Mshreg_q_27_151 ;
  wire \BU2/U0/Mshreg_q_29_150 ;
  wire \BU2/U0/Mshreg_q_26_149 ;
  wire \BU2/U0/Mshreg_q_25_148 ;
  wire \BU2/U0/Mshreg_q_24_147 ;
  wire \BU2/U0/Mshreg_q_23_146 ;
  wire \BU2/U0/Mshreg_q_22_145 ;
  wire \BU2/U0/Mshreg_q_21_144 ;
  wire \BU2/U0/Mshreg_q_20_143 ;
  wire \BU2/U0/Mshreg_q_19_142 ;
  wire \BU2/U0/Mshreg_q_18_141 ;
  wire \BU2/U0/Mshreg_q_17_140 ;
  wire \BU2/U0/Mshreg_q_16_139 ;
  wire \BU2/U0/Mshreg_q_15_138 ;
  wire \BU2/U0/Mshreg_q_13_137 ;
  wire \BU2/U0/Mshreg_q_12_136 ;
  wire \BU2/U0/Mshreg_q_14_135 ;
  wire \BU2/U0/Mshreg_q_11_134 ;
  wire \BU2/U0/Mshreg_q_10_133 ;
  wire \BU2/U0/Mshreg_q_9_132 ;
  wire \BU2/U0/Mshreg_q_8_131 ;
  wire \BU2/U0/Mshreg_q_7_130 ;
  wire \BU2/U0/Mshreg_q_6_129 ;
  wire \BU2/U0/Mshreg_q_5_128 ;
  wire \BU2/U0/Mshreg_q_4_127 ;
  wire \BU2/U0/Mshreg_q_3_126 ;
  wire \BU2/U0/Mshreg_q_2_125 ;
  wire \BU2/U0/Mshreg_q_1_124 ;
  wire \BU2/U0/Mshreg_q_0_123 ;
  wire \BU2/U0/N1 ;
  wire \BU2/U0/N0 ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire \NLW_BU2/U0/Mshreg_q_58_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_57_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_59_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_56_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_55_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_54_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_53_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_52_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_51_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_50_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_49_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_48_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_47_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_46_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_45_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_43_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_42_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_44_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_41_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_40_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_39_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_38_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_37_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_36_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_35_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_34_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_33_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_32_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_31_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_30_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_28_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_27_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_29_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_26_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_25_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_24_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_23_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_22_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_21_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_20_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_19_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_18_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_17_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_16_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_15_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_13_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_12_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_14_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_11_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_10_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_9_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_8_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_7_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_6_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_5_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_4_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_3_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_2_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_1_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_0_Q15_UNCONNECTED ;
  wire [59 : 0] d_2;
  wire [59 : 0] q_3;
  wire [3 : 0] \BU2/a ;
  assign
    d_2[59] = d[59],
    d_2[58] = d[58],
    d_2[57] = d[57],
    d_2[56] = d[56],
    d_2[55] = d[55],
    d_2[54] = d[54],
    d_2[53] = d[53],
    d_2[52] = d[52],
    d_2[51] = d[51],
    d_2[50] = d[50],
    d_2[49] = d[49],
    d_2[48] = d[48],
    d_2[47] = d[47],
    d_2[46] = d[46],
    d_2[45] = d[45],
    d_2[44] = d[44],
    d_2[43] = d[43],
    d_2[42] = d[42],
    d_2[41] = d[41],
    d_2[40] = d[40],
    d_2[39] = d[39],
    d_2[38] = d[38],
    d_2[37] = d[37],
    d_2[36] = d[36],
    d_2[35] = d[35],
    d_2[34] = d[34],
    d_2[33] = d[33],
    d_2[32] = d[32],
    d_2[31] = d[31],
    d_2[30] = d[30],
    d_2[29] = d[29],
    d_2[28] = d[28],
    d_2[27] = d[27],
    d_2[26] = d[26],
    d_2[25] = d[25],
    d_2[24] = d[24],
    d_2[23] = d[23],
    d_2[22] = d[22],
    d_2[21] = d[21],
    d_2[20] = d[20],
    d_2[19] = d[19],
    d_2[18] = d[18],
    d_2[17] = d[17],
    d_2[16] = d[16],
    d_2[15] = d[15],
    d_2[14] = d[14],
    d_2[13] = d[13],
    d_2[12] = d[12],
    d_2[11] = d[11],
    d_2[10] = d[10],
    d_2[9] = d[9],
    d_2[8] = d[8],
    d_2[7] = d[7],
    d_2[6] = d[6],
    d_2[5] = d[5],
    d_2[4] = d[4],
    d_2[3] = d[3],
    d_2[2] = d[2],
    d_2[1] = d[1],
    d_2[0] = d[0],
    q[59] = q_3[59],
    q[58] = q_3[58],
    q[57] = q_3[57],
    q[56] = q_3[56],
    q[55] = q_3[55],
    q[54] = q_3[54],
    q[53] = q_3[53],
    q[52] = q_3[52],
    q[51] = q_3[51],
    q[50] = q_3[50],
    q[49] = q_3[49],
    q[48] = q_3[48],
    q[47] = q_3[47],
    q[46] = q_3[46],
    q[45] = q_3[45],
    q[44] = q_3[44],
    q[43] = q_3[43],
    q[42] = q_3[42],
    q[41] = q_3[41],
    q[40] = q_3[40],
    q[39] = q_3[39],
    q[38] = q_3[38],
    q[37] = q_3[37],
    q[36] = q_3[36],
    q[35] = q_3[35],
    q[34] = q_3[34],
    q[33] = q_3[33],
    q[32] = q_3[32],
    q[31] = q_3[31],
    q[30] = q_3[30],
    q[29] = q_3[29],
    q[28] = q_3[28],
    q[27] = q_3[27],
    q[26] = q_3[26],
    q[25] = q_3[25],
    q[24] = q_3[24],
    q[23] = q_3[23],
    q[22] = q_3[22],
    q[21] = q_3[21],
    q[20] = q_3[20],
    q[19] = q_3[19],
    q[18] = q_3[18],
    q[17] = q_3[17],
    q[16] = q_3[16],
    q[15] = q_3[15],
    q[14] = q_3[14],
    q[13] = q_3[13],
    q[12] = q_3[12],
    q[11] = q_3[11],
    q[10] = q_3[10],
    q[9] = q_3[9],
    q[8] = q_3[8],
    q[7] = q_3[7],
    q[6] = q_3[6],
    q[5] = q_3[5],
    q[4] = q_3[4],
    q[3] = q_3[3],
    q[2] = q_3[2],
    q[1] = q_3[1],
    q[0] = q_3[0];
  VCC   VCC_0 (
    .P(NLW_VCC_P_UNCONNECTED)
  );
  GND   GND_1 (
    .G(NLW_GND_G_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_58  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_58_182 ),
    .Q(q_3[58])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_58  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[58]),
    .Q(\BU2/U0/Mshreg_q_58_182 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_58_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_57  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_57_181 ),
    .Q(q_3[57])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_57  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[57]),
    .Q(\BU2/U0/Mshreg_q_57_181 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_57_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_59  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_59_180 ),
    .Q(q_3[59])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_59  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[59]),
    .Q(\BU2/U0/Mshreg_q_59_180 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_59_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_56  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_56_179 ),
    .Q(q_3[56])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_56  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[56]),
    .Q(\BU2/U0/Mshreg_q_56_179 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_56_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_55  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_55_178 ),
    .Q(q_3[55])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_55  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[55]),
    .Q(\BU2/U0/Mshreg_q_55_178 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_55_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_54  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_54_177 ),
    .Q(q_3[54])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_54  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[54]),
    .Q(\BU2/U0/Mshreg_q_54_177 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_54_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_53  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_53_176 ),
    .Q(q_3[53])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_53  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[53]),
    .Q(\BU2/U0/Mshreg_q_53_176 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_53_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_52  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_52_175 ),
    .Q(q_3[52])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_52  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[52]),
    .Q(\BU2/U0/Mshreg_q_52_175 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_52_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_51  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_51_174 ),
    .Q(q_3[51])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_51  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[51]),
    .Q(\BU2/U0/Mshreg_q_51_174 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_51_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_50  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_50_173 ),
    .Q(q_3[50])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_50  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[50]),
    .Q(\BU2/U0/Mshreg_q_50_173 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_50_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_49  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_49_172 ),
    .Q(q_3[49])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_49  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[49]),
    .Q(\BU2/U0/Mshreg_q_49_172 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_49_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_48  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_48_171 ),
    .Q(q_3[48])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_48  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[48]),
    .Q(\BU2/U0/Mshreg_q_48_171 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_48_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_47  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_47_170 ),
    .Q(q_3[47])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_47  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[47]),
    .Q(\BU2/U0/Mshreg_q_47_170 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_47_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_46  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_46_169 ),
    .Q(q_3[46])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_46  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[46]),
    .Q(\BU2/U0/Mshreg_q_46_169 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_46_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_45  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_45_168 ),
    .Q(q_3[45])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_45  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[45]),
    .Q(\BU2/U0/Mshreg_q_45_168 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_45_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_43  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_43_167 ),
    .Q(q_3[43])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_43  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[43]),
    .Q(\BU2/U0/Mshreg_q_43_167 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_43_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_42  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_42_166 ),
    .Q(q_3[42])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_42  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[42]),
    .Q(\BU2/U0/Mshreg_q_42_166 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_42_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_44  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_44_165 ),
    .Q(q_3[44])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_44  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[44]),
    .Q(\BU2/U0/Mshreg_q_44_165 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_44_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_41  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_41_164 ),
    .Q(q_3[41])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_41  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[41]),
    .Q(\BU2/U0/Mshreg_q_41_164 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_41_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_40  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_40_163 ),
    .Q(q_3[40])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_40  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[40]),
    .Q(\BU2/U0/Mshreg_q_40_163 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_40_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_39  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_39_162 ),
    .Q(q_3[39])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_39  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[39]),
    .Q(\BU2/U0/Mshreg_q_39_162 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_39_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_38  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_38_161 ),
    .Q(q_3[38])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_38  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[38]),
    .Q(\BU2/U0/Mshreg_q_38_161 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_38_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_37  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_37_160 ),
    .Q(q_3[37])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_37  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[37]),
    .Q(\BU2/U0/Mshreg_q_37_160 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_37_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_36  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_36_159 ),
    .Q(q_3[36])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_36  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[36]),
    .Q(\BU2/U0/Mshreg_q_36_159 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_36_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_35  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_35_158 ),
    .Q(q_3[35])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_35  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[35]),
    .Q(\BU2/U0/Mshreg_q_35_158 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_35_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_34  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_34_157 ),
    .Q(q_3[34])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_34  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[34]),
    .Q(\BU2/U0/Mshreg_q_34_157 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_34_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_33  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_33_156 ),
    .Q(q_3[33])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_33  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[33]),
    .Q(\BU2/U0/Mshreg_q_33_156 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_33_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_32  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_32_155 ),
    .Q(q_3[32])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_32  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[32]),
    .Q(\BU2/U0/Mshreg_q_32_155 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_32_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_31  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_31_154 ),
    .Q(q_3[31])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_31  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[31]),
    .Q(\BU2/U0/Mshreg_q_31_154 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_31_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_30  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_30_153 ),
    .Q(q_3[30])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_30  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[30]),
    .Q(\BU2/U0/Mshreg_q_30_153 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_30_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_28  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_28_152 ),
    .Q(q_3[28])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_28  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[28]),
    .Q(\BU2/U0/Mshreg_q_28_152 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_28_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_27  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_27_151 ),
    .Q(q_3[27])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_27  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[27]),
    .Q(\BU2/U0/Mshreg_q_27_151 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_27_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_29  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_29_150 ),
    .Q(q_3[29])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_29  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[29]),
    .Q(\BU2/U0/Mshreg_q_29_150 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_29_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_26  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_26_149 ),
    .Q(q_3[26])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_26  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[26]),
    .Q(\BU2/U0/Mshreg_q_26_149 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_26_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_25  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_25_148 ),
    .Q(q_3[25])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_25  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[25]),
    .Q(\BU2/U0/Mshreg_q_25_148 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_25_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_24  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_24_147 ),
    .Q(q_3[24])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_24  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[24]),
    .Q(\BU2/U0/Mshreg_q_24_147 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_24_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_23  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_23_146 ),
    .Q(q_3[23])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_23  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[23]),
    .Q(\BU2/U0/Mshreg_q_23_146 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_23_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_22  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_22_145 ),
    .Q(q_3[22])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_22  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[22]),
    .Q(\BU2/U0/Mshreg_q_22_145 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_22_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_21  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_21_144 ),
    .Q(q_3[21])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_21  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[21]),
    .Q(\BU2/U0/Mshreg_q_21_144 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_21_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_20  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_20_143 ),
    .Q(q_3[20])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_20  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[20]),
    .Q(\BU2/U0/Mshreg_q_20_143 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_20_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_19  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_19_142 ),
    .Q(q_3[19])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_19  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[19]),
    .Q(\BU2/U0/Mshreg_q_19_142 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_19_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_18  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_18_141 ),
    .Q(q_3[18])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_18  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[18]),
    .Q(\BU2/U0/Mshreg_q_18_141 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_18_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_17  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_17_140 ),
    .Q(q_3[17])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_17  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[17]),
    .Q(\BU2/U0/Mshreg_q_17_140 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_17_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_16  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_16_139 ),
    .Q(q_3[16])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_16  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[16]),
    .Q(\BU2/U0/Mshreg_q_16_139 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_16_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_15  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_15_138 ),
    .Q(q_3[15])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_15  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[15]),
    .Q(\BU2/U0/Mshreg_q_15_138 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_15_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_13  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_13_137 ),
    .Q(q_3[13])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_13  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[13]),
    .Q(\BU2/U0/Mshreg_q_13_137 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_13_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_12  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_12_136 ),
    .Q(q_3[12])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_12  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[12]),
    .Q(\BU2/U0/Mshreg_q_12_136 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_12_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_14  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_14_135 ),
    .Q(q_3[14])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_14  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[14]),
    .Q(\BU2/U0/Mshreg_q_14_135 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_14_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_11  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_11_134 ),
    .Q(q_3[11])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_11  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[11]),
    .Q(\BU2/U0/Mshreg_q_11_134 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_11_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_10  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_10_133 ),
    .Q(q_3[10])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_10  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[10]),
    .Q(\BU2/U0/Mshreg_q_10_133 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_10_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_9  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_9_132 ),
    .Q(q_3[9])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_9  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[9]),
    .Q(\BU2/U0/Mshreg_q_9_132 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_9_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_8  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_8_131 ),
    .Q(q_3[8])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_8  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[8]),
    .Q(\BU2/U0/Mshreg_q_8_131 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_8_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_7  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_7_130 ),
    .Q(q_3[7])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_7  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[7]),
    .Q(\BU2/U0/Mshreg_q_7_130 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_7_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_6  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_6_129 ),
    .Q(q_3[6])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_6  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[6]),
    .Q(\BU2/U0/Mshreg_q_6_129 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_6_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_5  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_5_128 ),
    .Q(q_3[5])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_5  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[5]),
    .Q(\BU2/U0/Mshreg_q_5_128 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_5_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_4  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_4_127 ),
    .Q(q_3[4])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_4  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[4]),
    .Q(\BU2/U0/Mshreg_q_4_127 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_4_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_3  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_3_126 ),
    .Q(q_3[3])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_3  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[3]),
    .Q(\BU2/U0/Mshreg_q_3_126 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_3_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_2  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_2_125 ),
    .Q(q_3[2])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_2  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[2]),
    .Q(\BU2/U0/Mshreg_q_2_125 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_2_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_1  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_1_124 ),
    .Q(q_3[1])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_1  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[1]),
    .Q(\BU2/U0/Mshreg_q_1_124 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_1_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_0  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_0_123 ),
    .Q(q_3[0])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_0  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N1 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[0]),
    .Q(\BU2/U0/Mshreg_q_0_123 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_0_Q15_UNCONNECTED )
  );
  VCC   \BU2/U0/XST_VCC  (
    .P(\BU2/U0/N1 )
  );
  GND   \BU2/U0/XST_GND  (
    .G(\BU2/U0/N0 )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

    wire GSR;
    wire GTS;
    wire PRLD;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

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

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

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

endmodule

// synthesis translate_on
