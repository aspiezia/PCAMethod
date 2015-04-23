////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.39
//  \   \         Application: netgen
//  /   /         Filename: parameters_chipass_sr.v
// /___/   /\     Timestamp: Thu Jul  9 18:07:50 2009
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog /home/dasnake/lavori/gigafitter/firmware/mezzanina_4w_6f/tmp/_cg/parameters_chipass_sr.ngc /home/dasnake/lavori/gigafitter/firmware/mezzanina_4w_6f/tmp/_cg/parameters_chipass_sr.v 
// Device	: 5vsx95tff1136-1
// Input file	: /home/dasnake/lavori/gigafitter/firmware/mezzanina_4w_6f/tmp/_cg/parameters_chipass_sr.ngc
// Output file	: /home/dasnake/lavori/gigafitter/firmware/mezzanina_4w_6f/tmp/_cg/parameters_chipass_sr.v
// # of Modules	: 1
// Design Name	: parameters_chipass_sr
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

module parameters_chipass_sr (
  clk, d, q
);
  input clk;
  input [31 : 0] d;
  output [31 : 0] q;
  
  // synthesis translate_off
  
  wire \BU2/sclr ;
  wire \BU2/sset ;
  wire \BU2/sinit ;
  wire \BU2/ainit ;
  wire \BU2/aclr ;
  wire \BU2/ce ;
  wire \BU2/aset ;
  wire \BU2/U0/Mshreg_q_31_98 ;
  wire \BU2/U0/Mshreg_q_30_97 ;
  wire \BU2/U0/Mshreg_q_29_96 ;
  wire \BU2/U0/Mshreg_q_28_95 ;
  wire \BU2/U0/Mshreg_q_27_94 ;
  wire \BU2/U0/Mshreg_q_26_93 ;
  wire \BU2/U0/Mshreg_q_25_92 ;
  wire \BU2/U0/Mshreg_q_24_91 ;
  wire \BU2/U0/Mshreg_q_23_90 ;
  wire \BU2/U0/Mshreg_q_22_89 ;
  wire \BU2/U0/Mshreg_q_21_88 ;
  wire \BU2/U0/Mshreg_q_20_87 ;
  wire \BU2/U0/Mshreg_q_19_86 ;
  wire \BU2/U0/Mshreg_q_18_85 ;
  wire \BU2/U0/Mshreg_q_17_84 ;
  wire \BU2/U0/Mshreg_q_16_83 ;
  wire \BU2/U0/Mshreg_q_15_82 ;
  wire \BU2/U0/Mshreg_q_14_81 ;
  wire \BU2/U0/Mshreg_q_13_80 ;
  wire \BU2/U0/Mshreg_q_12_79 ;
  wire \BU2/U0/Mshreg_q_11_78 ;
  wire \BU2/U0/Mshreg_q_10_77 ;
  wire \BU2/U0/Mshreg_q_9_76 ;
  wire \BU2/U0/Mshreg_q_8_75 ;
  wire \BU2/U0/Mshreg_q_7_74 ;
  wire \BU2/U0/Mshreg_q_6_73 ;
  wire \BU2/U0/Mshreg_q_5_72 ;
  wire \BU2/U0/Mshreg_q_4_71 ;
  wire \BU2/U0/Mshreg_q_3_70 ;
  wire \BU2/U0/Mshreg_q_2_69 ;
  wire \BU2/U0/Mshreg_q_1_68 ;
  wire \BU2/U0/Mshreg_q_0_67 ;
  wire \BU2/U0/N1 ;
  wire \BU2/U0/N0 ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire \NLW_BU2/U0/Mshreg_q_31_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_30_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_29_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_28_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_27_Q15_UNCONNECTED ;
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
  wire \NLW_BU2/U0/Mshreg_q_14_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_13_Q15_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_12_Q15_UNCONNECTED ;
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
  wire [31 : 0] d_2;
  wire [31 : 0] q_3;
  wire [3 : 0] \BU2/a ;
  assign
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
  \BU2/U0/q_31  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_31_98 ),
    .Q(q_3[31])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_31  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[31]),
    .Q(\BU2/U0/Mshreg_q_31_98 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_31_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_30  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_30_97 ),
    .Q(q_3[30])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_30  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[30]),
    .Q(\BU2/U0/Mshreg_q_30_97 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_30_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_29  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_29_96 ),
    .Q(q_3[29])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_29  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[29]),
    .Q(\BU2/U0/Mshreg_q_29_96 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_29_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_28  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_28_95 ),
    .Q(q_3[28])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_28  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[28]),
    .Q(\BU2/U0/Mshreg_q_28_95 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_28_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_27  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_27_94 ),
    .Q(q_3[27])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_27  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[27]),
    .Q(\BU2/U0/Mshreg_q_27_94 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_27_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_26  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_26_93 ),
    .Q(q_3[26])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_26  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[26]),
    .Q(\BU2/U0/Mshreg_q_26_93 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_26_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_25  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_25_92 ),
    .Q(q_3[25])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_25  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[25]),
    .Q(\BU2/U0/Mshreg_q_25_92 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_25_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_24  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_24_91 ),
    .Q(q_3[24])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_24  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[24]),
    .Q(\BU2/U0/Mshreg_q_24_91 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_24_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_23  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_23_90 ),
    .Q(q_3[23])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_23  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[23]),
    .Q(\BU2/U0/Mshreg_q_23_90 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_23_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_22  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_22_89 ),
    .Q(q_3[22])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_22  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[22]),
    .Q(\BU2/U0/Mshreg_q_22_89 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_22_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_21  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_21_88 ),
    .Q(q_3[21])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_21  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[21]),
    .Q(\BU2/U0/Mshreg_q_21_88 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_21_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_20  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_20_87 ),
    .Q(q_3[20])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_20  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[20]),
    .Q(\BU2/U0/Mshreg_q_20_87 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_20_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_19  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_19_86 ),
    .Q(q_3[19])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_19  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[19]),
    .Q(\BU2/U0/Mshreg_q_19_86 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_19_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_18  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_18_85 ),
    .Q(q_3[18])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_18  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[18]),
    .Q(\BU2/U0/Mshreg_q_18_85 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_18_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_17  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_17_84 ),
    .Q(q_3[17])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_17  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[17]),
    .Q(\BU2/U0/Mshreg_q_17_84 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_17_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_16  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_16_83 ),
    .Q(q_3[16])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_16  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[16]),
    .Q(\BU2/U0/Mshreg_q_16_83 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_16_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_15  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_15_82 ),
    .Q(q_3[15])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_15  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[15]),
    .Q(\BU2/U0/Mshreg_q_15_82 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_15_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_14  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_14_81 ),
    .Q(q_3[14])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_14  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[14]),
    .Q(\BU2/U0/Mshreg_q_14_81 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_14_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_13  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_13_80 ),
    .Q(q_3[13])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_13  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[13]),
    .Q(\BU2/U0/Mshreg_q_13_80 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_13_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_12  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_12_79 ),
    .Q(q_3[12])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_12  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[12]),
    .Q(\BU2/U0/Mshreg_q_12_79 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_12_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_11  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_11_78 ),
    .Q(q_3[11])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_11  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[11]),
    .Q(\BU2/U0/Mshreg_q_11_78 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_11_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_10  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_10_77 ),
    .Q(q_3[10])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_10  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[10]),
    .Q(\BU2/U0/Mshreg_q_10_77 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_10_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_9  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_9_76 ),
    .Q(q_3[9])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_9  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[9]),
    .Q(\BU2/U0/Mshreg_q_9_76 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_9_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_8  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_8_75 ),
    .Q(q_3[8])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_8  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[8]),
    .Q(\BU2/U0/Mshreg_q_8_75 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_8_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_7  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_7_74 ),
    .Q(q_3[7])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_7  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[7]),
    .Q(\BU2/U0/Mshreg_q_7_74 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_7_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_6  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_6_73 ),
    .Q(q_3[6])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_6  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[6]),
    .Q(\BU2/U0/Mshreg_q_6_73 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_6_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_5  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_5_72 ),
    .Q(q_3[5])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_5  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[5]),
    .Q(\BU2/U0/Mshreg_q_5_72 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_5_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_4  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_4_71 ),
    .Q(q_3[4])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_4  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[4]),
    .Q(\BU2/U0/Mshreg_q_4_71 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_4_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_3  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_3_70 ),
    .Q(q_3[3])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_3  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[3]),
    .Q(\BU2/U0/Mshreg_q_3_70 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_3_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_2  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_2_69 ),
    .Q(q_3[2])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_2  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[2]),
    .Q(\BU2/U0/Mshreg_q_2_69 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_2_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_1  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_1_68 ),
    .Q(q_3[1])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_1  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[1]),
    .Q(\BU2/U0/Mshreg_q_1_68 ),
    .Q15(\NLW_BU2/U0/Mshreg_q_1_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_0  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_0_67 ),
    .Q(q_3[0])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/Mshreg_q_0  (
    .A0(\BU2/U0/N1 ),
    .A1(\BU2/U0/N0 ),
    .A2(\BU2/U0/N1 ),
    .A3(\BU2/U0/N0 ),
    .CE(\BU2/U0/N1 ),
    .CLK(clk),
    .D(d_2[0]),
    .Q(\BU2/U0/Mshreg_q_0_67 ),
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
