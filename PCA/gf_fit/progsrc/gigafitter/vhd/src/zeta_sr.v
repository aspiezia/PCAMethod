////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.39
//  \   \         Application: netgen
//  /   /         Filename: zeta_sr.v
// /___/   /\     Timestamp: Thu Dec  3 15:50:10 2009
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog /home/dasnake/lavori/gigafitter/firmware/mezzanina_4w_6f_2c/tmp/_cg/zeta_sr.ngc /home/dasnake/lavori/gigafitter/firmware/mezzanina_4w_6f_2c/tmp/_cg/zeta_sr.v 
// Device	: 5vsx95tff1136-1
// Input file	: /home/dasnake/lavori/gigafitter/firmware/mezzanina_4w_6f_2c/tmp/_cg/zeta_sr.ngc
// Output file	: /home/dasnake/lavori/gigafitter/firmware/mezzanina_4w_6f_2c/tmp/_cg/zeta_sr.v
// # of Modules	: 1
// Design Name	: zeta_sr
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

module zeta_sr (
  clk, d, q
);
  input clk;
  input [5 : 0] d;
  output [5 : 0] q;
  
  // synthesis translate_off
  
  wire \BU2/sclr ;
  wire \BU2/sset ;
  wire \BU2/sinit ;
  wire \BU2/ainit ;
  wire \BU2/aclr ;
  wire \BU2/ce ;
  wire \BU2/aset ;
  wire \BU2/U0/Mshreg_q_4_20 ;
  wire \BU2/U0/Mshreg_q_3_19 ;
  wire \BU2/U0/Mshreg_q_5_18 ;
  wire \BU2/U0/Mshreg_q_1_17 ;
  wire \BU2/U0/Mshreg_q_0_16 ;
  wire \BU2/U0/Mshreg_q_2_15 ;
  wire \BU2/U0/N1 ;
  wire \BU2/U0/N0 ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire \NLW_BU2/U0/Mshreg_q_4_Q31_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_3_Q31_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_5_Q31_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_1_Q31_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_0_Q31_UNCONNECTED ;
  wire \NLW_BU2/U0/Mshreg_q_2_Q31_UNCONNECTED ;
  wire [5 : 0] d_2;
  wire [5 : 0] q_3;
  wire [3 : 0] \BU2/a ;
  assign
    d_2[5] = d[5],
    d_2[4] = d[4],
    d_2[3] = d[3],
    d_2[2] = d[2],
    d_2[1] = d[1],
    d_2[0] = d[0],
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
  \BU2/U0/q_4  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_4_20 ),
    .Q(q_3[4])
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \BU2/U0/Mshreg_q_4  (
    .CLK(clk),
    .D(d_2[4]),
    .CE(\BU2/U0/N1 ),
    .Q(\BU2/U0/Mshreg_q_4_20 ),
    .Q31(\NLW_BU2/U0/Mshreg_q_4_Q31_UNCONNECTED ),
    .A({\BU2/U0/N1 , \BU2/U0/N0 , \BU2/U0/N1 , \BU2/U0/N0 , \BU2/U0/N0 })
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_3  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_3_19 ),
    .Q(q_3[3])
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \BU2/U0/Mshreg_q_3  (
    .CLK(clk),
    .D(d_2[3]),
    .CE(\BU2/U0/N1 ),
    .Q(\BU2/U0/Mshreg_q_3_19 ),
    .Q31(\NLW_BU2/U0/Mshreg_q_3_Q31_UNCONNECTED ),
    .A({\BU2/U0/N1 , \BU2/U0/N0 , \BU2/U0/N1 , \BU2/U0/N0 , \BU2/U0/N0 })
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_5  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_5_18 ),
    .Q(q_3[5])
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \BU2/U0/Mshreg_q_5  (
    .CLK(clk),
    .D(d_2[5]),
    .CE(\BU2/U0/N1 ),
    .Q(\BU2/U0/Mshreg_q_5_18 ),
    .Q31(\NLW_BU2/U0/Mshreg_q_5_Q31_UNCONNECTED ),
    .A({\BU2/U0/N1 , \BU2/U0/N0 , \BU2/U0/N1 , \BU2/U0/N0 , \BU2/U0/N0 })
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_1  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_1_17 ),
    .Q(q_3[1])
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \BU2/U0/Mshreg_q_1  (
    .CLK(clk),
    .D(d_2[1]),
    .CE(\BU2/U0/N1 ),
    .Q(\BU2/U0/Mshreg_q_1_17 ),
    .Q31(\NLW_BU2/U0/Mshreg_q_1_Q31_UNCONNECTED ),
    .A({\BU2/U0/N1 , \BU2/U0/N0 , \BU2/U0/N1 , \BU2/U0/N0 , \BU2/U0/N0 })
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_0  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_0_16 ),
    .Q(q_3[0])
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \BU2/U0/Mshreg_q_0  (
    .CLK(clk),
    .D(d_2[0]),
    .CE(\BU2/U0/N1 ),
    .Q(\BU2/U0/Mshreg_q_0_16 ),
    .Q31(\NLW_BU2/U0/Mshreg_q_0_Q31_UNCONNECTED ),
    .A({\BU2/U0/N1 , \BU2/U0/N0 , \BU2/U0/N1 , \BU2/U0/N0 , \BU2/U0/N0 })
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/q_2  (
    .C(clk),
    .CE(\BU2/U0/N1 ),
    .D(\BU2/U0/Mshreg_q_2_15 ),
    .Q(q_3[2])
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \BU2/U0/Mshreg_q_2  (
    .CLK(clk),
    .D(d_2[2]),
    .CE(\BU2/U0/N1 ),
    .Q(\BU2/U0/Mshreg_q_2_15 ),
    .Q31(\NLW_BU2/U0/Mshreg_q_2_Q31_UNCONNECTED ),
    .A({\BU2/U0/N1 , \BU2/U0/N0 , \BU2/U0/N1 , \BU2/U0/N0 , \BU2/U0/N0 })
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
