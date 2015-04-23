`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:04:53 04/24/2009 
// Design Name: 
// Module Name:    chisq_unit 
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

module chisq_unit (
	chi1,
	chi2,
	chi3,
	clock,
	reset,
	dv,
	chisq
);

	 parameter PARAMETERBITS = 14;
	 parameter CHISQBITS = 32;
    input [PARAMETERBITS-1:0] chi1;
    input [PARAMETERBITS-1:0] chi2;
    input [PARAMETERBITS-1:0] chi3;
    input clock;
    input reset;
    input dv;
    output [CHISQBITS-1:0] chisq;
	 
wire [PARAMETERBITS-1:0] chi1_reg;
wire [PARAMETERBITS-1:0] chi2_reg;
wire [PARAMETERBITS-1:0] chi3_reg;

	chireg #(PARAMETERBITS) chireg1(.CLOCK(clock), .CE(dv), .DIN(chi1), .DOUT(chi1_reg), .RESET(reset));
	chireg #(PARAMETERBITS) chireg2(.CLOCK(clock), .CE(dv), .DIN(chi2), .DOUT(chi2_reg), .RESET(reset));
	chireg #(PARAMETERBITS) chireg3(.CLOCK(clock), .CE(dv), .DIN(chi3), .DOUT(chi3_reg), .RESET(reset));

wire [1:0] selmux1;
wire [PARAMETERBITS-1:0] chi;

chiser #(PARAMETERBITS) chimux1( // multiplexer from chi to the squaring accumulate DSP
		.CHI1(chi1_reg),
		.CHI2(chi2_reg),
		.CHI3(chi3_reg),
		.SEL(selmux1),
		.CLOCK(clock),
		.CHI(chi)
       );
	
// cycle selmux every dv	
chisq_unit_fsm u_chisq_unit_fsm (
	.clock(clock),
	.reset(reset),
	.start(dv),
	.mux(selmux1)
);

wire load_mux1;

SRL16 #(  
// shift register to load the accumulator
// is sync'd such as sum 0 with chi1
      .INIT(16'h0000) // Initial Value of Shift Register
  ) SRL_CHILOAD (
   .Q(load_mux1),       // SRL data output
   .A0(1'b0),     // Select[0] input
   .A1(1'b1),     // Select[1] input
   .A2(1'b0),     // Select[2] input
   .A3(1'b0),     // Select[3] input
	.CLK(clock),   // Clock input
   .D(dv)        // SRL data input
);

wire [CHISQBITS-1:0] chisq_int;
wire overflow;

dsp_chisq_macc #(PARAMETERBITS,CHISQBITS) chisquare (    // squaring/accumulate DSP
    .CHI_IN(chi), 
    .CLK_IN(clock), 
    .LOAD_IN(~load_mux1), 
	 .RESET(reset),
    .P_OUT(chisq_int),
	 .OVERFLOW(overflow)
);

assign chisq = overflow ? {CHISQBITS{1'b1}} : chisq_int;

endmodule
