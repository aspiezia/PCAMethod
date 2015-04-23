`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:29:30 05/12/2009 
// Design Name: 
// Module Name:    hitspy6_chipass 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module hitspy6_chipass(
	CLOCK, 
	HITIN, 
	HITMAP, 
	DV, 
	RESET, 
	hits1, 
	hits2,
	hits3, 
	hits4,
	hits5, 
	hits6,
	xft_phi_msb
);
    parameter HITBITS_SVX = 8;
	 parameter HITBITS_XFT = 13;
	 parameter HITBITS_REG0 = 10;
	 
	 input CLOCK;
    input [14:0] HITIN;
    input [4:0] HITMAP;
	 input DV;
    input RESET;
	 input [(HITBITS_XFT-9):0] xft_phi_msb;
	output [HITBITS_SVX-1:0] hits1;
	output [HITBITS_SVX-1:0] hits2;
	output [HITBITS_SVX-1:0] hits3;
	output [HITBITS_SVX-1:0] hits4;
	output [HITBITS_SVX-1:0] hits5;
	output [HITBITS_XFT-1:0] hits6;
	 
	 wire [HITBITS_REG0-1:0] reg0;
    wire [HITBITS_SVX-1:0] reg1, reg2, reg3, reg4, reg5;
	 wire [HITBITS_XFT-1:0] reg6;
	 wire [(HITBITS_XFT-9):0] xft_phi_msb_reg0;
	 wire [4:0] lcmap_in;
	 wire [4:0] hitmap_in;
 	
	 wire CE_R1, CE_R2, CE_R3, CE_R4, CE_R5, CE_R6;
	 wire CE_COPY, CE_COPY2;
	 	 
	 hit_reg_new #(HITBITS_REG0) hit_reg0(
	 //hit_reg hit_reg0(
	  .DIN(HITIN[0+:HITBITS_REG0]), 
	  .DOUT(reg0), 
	  .CLOCK(CLOCK), 
	  .CE(DV),
	  .RESET(RESET)
	 );

	 hit_reg_new #(HITBITS_XFT-8) hit_xft_phi_reg0(
	 //hit_reg hit_reg0(
	  .DIN(xft_phi_msb), 
	  .DOUT(xft_phi_msb_reg0), 
	  .CLOCK(CLOCK), 
	  .CE(DV),
	  .RESET(RESET)
	 );

	 	 
	 //--------------------------------------------------//
	 // FSM //
	 
	  hitspy_control_in hitspy_control_in1(
	  .DV(DV),
	  .reset(RESET),
	  .clock(CLOCK),
	  .hitmap(HITMAP),
	  .CE_R1(CE_R1),
	  .CE_R2(CE_R2),
	  .CE_R3(CE_R3),
	  .CE_R4(CE_R4),
	  .CE_R5(CE_R5),
	  .CE_R6(CE_R6),
	  .CE_COPY(CE_COPY),
	  .CE_COPY2(CE_COPY2),
	  .MH1(MH1),
	  .MH2(MH2),
	  .MH3(MH3),
	  .MH4(MH4),
	  .MH5(MH5)
	 );
	 
	 //---------------------------------------------------//
	 // hits written in the registers reg1...6 according to //
	 // the CE_R1...R6 determined by the hitmap //
	 // #(nbit) 
	 hit_reg_new #(HITBITS_SVX) hit_reg1(
	   .DIN(reg0[0+:8]), 
	   .DOUT(reg1), 
	   .CLOCK(CLOCK), 
	   .CE(CE_R1),
		.RESET(MH1)
	 );
	 
	 hit_reg_new #(HITBITS_SVX) hit_reg2(
	   .DIN(reg0[0+:8]),
	   .DOUT(reg2), 
	   .CLOCK(CLOCK), 
	   .CE(CE_R2),
		.RESET(MH2)
	 );
	 
	 hit_reg_new #(HITBITS_SVX) hit_reg3(
	   .DIN(reg0[0+:8]),
	   .DOUT(reg3), 
	   .CLOCK(CLOCK), 
	   .CE(CE_R3),
		.RESET(MH3)
	 );
	 
	 hit_reg_new #(HITBITS_SVX) hit_reg4(
	   .DIN(reg0[0+:8]),
		.DOUT(reg4), 
	   .CLOCK(CLOCK), 
	   .CE(CE_R4),
		.RESET(MH4)
	 );
	 
	 hit_reg_new #(HITBITS_SVX) hit_reg5(
	   .DIN(reg0[0+:8]),
		.DOUT(reg5), 
	   .CLOCK(CLOCK), 
	   .CE(CE_R5),
		.RESET(MH5)
	 );
	 
	 hit_reg_new #(HITBITS_XFT) hit_reg6(
	   .DIN({xft_phi_msb_reg0,reg0[2+:8]}), 
		.DOUT(reg6),
	   .CLOCK(CLOCK), 
	   .CE(CE_R6),
		.RESET(RESET)
	 );
	 	
	 
	 //--------------------------------------------//
	 // registers to store hits while waiting chipass (11 clock cycles)
	 
	 hit_reg_new #(HITBITS_SVX) copy_reg1(
	   .DIN(reg1), 
	   .DOUT(hits1), 
	   .CLOCK(CLOCK), 
	   .CE(CE_COPY),
		.RESET(RESET)
	 );
	 
	  hit_reg_new #(HITBITS_SVX) copy_reg2(
	   .DIN(reg2), 
	   .DOUT(hits2), 
	   .CLOCK(CLOCK), 
	   .CE(CE_COPY),
		.RESET(RESET)
	 );
	 
	  hit_reg_new #(HITBITS_SVX) copy_reg3(
	   .DIN(reg3), 
	   .DOUT(hits3), 
	   .CLOCK(CLOCK), 
	   .CE(CE_COPY),
		.RESET(RESET)
	 );
	 
	  hit_reg_new #(HITBITS_SVX) copy_reg4(
	   .DIN(reg4), 
	   .DOUT(hits4), 
	   .CLOCK(CLOCK), 
	   .CE(CE_COPY),
		.RESET(RESET)
	 );
	 
	  hit_reg_new #(HITBITS_SVX) copy_reg5(
	   .DIN(reg5), 
	   .DOUT(hits5), 
	   .CLOCK(CLOCK), 
	   .CE(CE_COPY),
		.RESET(RESET)
	 );
	 
	  hit_reg_new #(HITBITS_XFT) copy_reg6(
	   .DIN(reg6), 
	   .DOUT(hits6), 
	   .CLOCK(CLOCK), 
	   .CE(CE_COPY),
		.RESET(RESET)
	 );
	 
	 
endmodule
