////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.39
//  \   \         Application: netgen
//  /   /         Filename: comp_gfunc.v
// /___/   /\     Timestamp: Sun Jul 12 00:19:38 2009
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog /home/dasnake/lavori/gigafitter/firmware/mezzanina_4w_6f/tmp/_cg/comp_gfunc.ngc /home/dasnake/lavori/gigafitter/firmware/mezzanina_4w_6f/tmp/_cg/comp_gfunc.v 
// Device	: 5vsx95tff1136-1
// Input file	: /home/dasnake/lavori/gigafitter/firmware/mezzanina_4w_6f/tmp/_cg/comp_gfunc.ngc
// Output file	: /home/dasnake/lavori/gigafitter/firmware/mezzanina_4w_6f/tmp/_cg/comp_gfunc.v
// # of Modules	: 1
// Design Name	: comp_gfunc
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

module comp_gfunc (
  ce, clk, qa_lt_b, a, b
);
  input ce;
  input clk;
  output qa_lt_b;
  input [6 : 0] a;
  input [6 : 0] b;
  
  // synthesis translate_off
  
  wire \BU2/N1 ;
  wire \BU2/a_ge_b ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire [6 : 0] a_2;
  wire [6 : 0] b_3;
  wire [2 : 0] \BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/part_compare_result ;
  wire [1 : 0] \BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/sel ;
  wire [2 : 0] \BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/carry ;
  assign
    a_2[6] = a[6],
    a_2[5] = a[5],
    a_2[4] = a[4],
    a_2[3] = a[3],
    a_2[2] = a[2],
    a_2[1] = a[1],
    a_2[0] = a[0],
    b_3[6] = b[6],
    b_3[5] = b[5],
    b_3[4] = b[4],
    b_3[3] = b[3],
    b_3[2] = b[2],
    b_3[1] = b[1],
    b_3[0] = b[0];
  VCC   VCC_0 (
    .P(NLW_VCC_P_UNCONNECTED)
  );
  GND   GND_1 (
    .G(NLW_GND_G_UNCONNECTED)
  );
  LUT6 #(
    .INIT ( 64'h20A22020BAFBBABA ))
  \BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/part_compare_result<2>1  (
    .I0(b_3[2]),
    .I1(a_2[1]),
    .I2(b_3[1]),
    .I3(a_2[0]),
    .I4(b_3[0]),
    .I5(a_2[2]),
    .O(\BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/part_compare_result [2])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/sel<1>21  (
    .I0(a_2[3]),
    .I1(b_3[3]),
    .I2(a_2[4]),
    .I3(b_3[4]),
    .O(\BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/sel [1])
  );
  LUT4 #(
    .INIT ( 16'h20BA ))
  \BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/part_compare_result<1>1  (
    .I0(b_3[4]),
    .I1(a_2[3]),
    .I2(b_3[3]),
    .I3(a_2[4]),
    .O(\BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/part_compare_result [1])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/sel<0>21  (
    .I0(a_2[5]),
    .I1(b_3[5]),
    .I2(a_2[6]),
    .I3(b_3[6]),
    .O(\BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/sel [0])
  );
  LUT4 #(
    .INIT ( 16'h20BA ))
  \BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/part_compare_result<0>1  (
    .I0(b_3[6]),
    .I1(a_2[5]),
    .I2(b_3[5]),
    .I3(a_2[6]),
    .O(\BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/part_compare_result [0])
  );
  MUXCY 
  \BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/i_compare_struct.i_gen_multi_bit_lut_compare.i_gen_luts_and_muxcys[2].i_bottom_lut.data_muxcy  (
    .CI(\BU2/N1 ),
    .DI(\BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/part_compare_result [2]),
    .S(\BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/part_compare_result [2]),
    .O(\BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/carry [2])
  );
  MUXCY 
  \BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/i_compare_struct.i_gen_multi_bit_lut_compare.i_gen_luts_and_muxcys[1].i_mid_luts.data_muxcy  (
    .CI(\BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/carry [2]),
    .DI(\BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/part_compare_result [1]),
    .S(\BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/sel [1]),
    .O(\BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/carry [1])
  );
  MUXCY 
  \BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/i_compare_struct.i_gen_multi_bit_lut_compare.i_gen_luts_and_muxcys[0].i_top_lut.data_muxcy  (
    .CI(\BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/carry [1]),
    .DI(\BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/part_compare_result [0]),
    .S(\BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/sel [0]),
    .O(\BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/carry [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/gen_output_reg.output_reg/fd/output_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gen_structure_logic.gen_nonpipelined.a_lt_ge_gt_le_b.i_gen_carry_chain_comp/carry [0]),
    .Q(qa_lt_b)
  );
  VCC   \BU2/XST_VCC  (
    .P(\BU2/N1 )
  );
  GND   \BU2/XST_GND  (
    .G(\BU2/a_ge_b )
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
