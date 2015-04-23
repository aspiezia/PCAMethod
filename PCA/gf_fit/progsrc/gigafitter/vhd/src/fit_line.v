`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:02:09 04/27/2009 
// Design Name: 
// Module Name:    fit_line 
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
module fit_line(
	clock, reset, data_out_fifo_45_comb, start, const_data,
	in_valid, ser_ee,
	hits1, hits2, hits3, hits4, hits5, hits6,
	parameters, chi1_out, chi2_out, chi3_out, lcmap, hitmap,
	fit_overflow, chi_overflow,
	fit_ready);
	
	
parameter BUS_WIDTH_IN = 16; // Length of hits and costants words
parameter BUS_WIDTH_IN_CONST = 18;	 
parameter CHI1WIDTH = 15;
parameter CHI2WIDTH = 15;
parameter CHI3WIDTH = 15;
parameter PHIWIDTH = 14;
parameter DWIDTH = 11;
parameter CWIDTH = 10;
parameter HITBITS_SVX = 8;
parameter HITBITS_XFT = 13;

    input clock;
    input reset;
	 input [102:0] data_out_fifo_45_comb;
	 input start;
	 input [755:0] const_data;
	 input in_valid;
	 output ser_ee;
	 output [HITBITS_SVX-1:0] hits1;
	 output [HITBITS_SVX-1:0] hits2;
	 output [HITBITS_SVX-1:0] hits3;
	 output [HITBITS_SVX-1:0] hits4;
	 output [HITBITS_SVX-1:0] hits5;
	 output [HITBITS_XFT-1:0] hits6;
	 output [PHIWIDTH+CWIDTH+DWIDTH-1:0] parameters;
	 output [CHI1WIDTH-1:0] chi1_out;
	 output [CHI2WIDTH-1:0] chi2_out;
	 output [CHI3WIDTH-1:0] chi3_out;
	 output [4:0] hitmap;
	 output [4:0] lcmap;
	 output fit_ready;
	 output fit_overflow;
	 output chi_overflow;

	 
wire [BUS_WIDTH_IN-1:0] data_out_ser;
wire ser_ev;
wire [(HITBITS_XFT-9):0] xft_phi_msb;

wire [BUS_WIDTH_IN_CONST-1:0] c_chi1_0;
wire [BUS_WIDTH_IN_CONST-1:0] c_chi2_0;
wire [BUS_WIDTH_IN_CONST-1:0] c_chi3_0;
wire [BUS_WIDTH_IN_CONST-1:0] c_c_0;
wire [BUS_WIDTH_IN_CONST-1:0] c_d_0;
wire [BUS_WIDTH_IN_CONST-1:0] c_phi_0;
wire [BUS_WIDTH_IN_CONST-1:0] c_chi1;
wire [BUS_WIDTH_IN_CONST-1:0] c_chi2;
wire [BUS_WIDTH_IN_CONST-1:0] c_chi3;
wire [BUS_WIDTH_IN_CONST-1:0] c_c;
wire [BUS_WIDTH_IN_CONST-1:0] c_d;
wire [BUS_WIDTH_IN_CONST-1:0] c_phi;

wire [4:0] hitmap_ser;
wire [4:0] lcmap_ser;

wire hit6;

serializzatore_45 u_serializzatore_45 (
	.clock(clock),
	.reset(reset), //controllare
	.start(start),
	.data_in_ser(data_out_fifo_45_comb),
	.in_valid(in_valid),
	//out
	.out_ser(data_out_ser),
	.dv(ser_dv),
	.ev(ser_ev),
	.ee(ser_ee),
	.hit6(hit6),
	.hitmap(hitmap_ser),
	.lcmap(lcmap_ser),
	.const_data(const_data),
	.c_chi1_0(c_chi1_0),
	.c_chi2_0(c_chi2_0),
	.c_chi3_0(c_chi3_0),
	.c_c_0(c_c_0),
	.c_d_0(c_d_0),
	.c_phi_0(c_phi_0),
	.c_chi1(c_chi1),
	.c_chi2(c_chi2),
	.c_chi3(c_chi3),
	.c_c(c_c),
	.c_d(c_d),
	.c_phi(c_phi),
	.xft_phi_msb(xft_phi_msb)

);

wire [PHIWIDTH-1:0] phi_out;
wire [CWIDTH-1:0] c_out;
wire [DWIDTH-1:0] d_out;
wire chi1_ovf, chi2_ovf, chi3_ovf;
wire c_ovf,d_ovf,phi_ovf;

assign fit_overflow = c_ovf | d_ovf | phi_ovf;
assign chi_overflow = chi1_ovf | chi2_ovf | chi3_ovf;

scalar4 u_fitter (           
	.CHI1IN(c_chi1), 
	.CHI10IN(c_chi1_0), 
	.CHI1OUT(chi1_out), 
	.CHI1OF(chi1_ovf), 
	.CHI2IN(c_chi2), 
	.CHI20IN(c_chi2_0), 
	.CHI2OUT(chi2_out), 
	.CHI2OF(chi2_ovf), 
	.CHI3IN(c_chi3), 
	.CHI30IN(c_chi3_0), 
	.CHI3OUT(chi3_out), 
	.CHI3OF(chi3_ovf), 
	.PHIIN(c_phi), 
	.PHI0IN(c_phi_0), 
	.PHIOUT(phi_out), 
	.PHIOF(phi_ovf), 
	.DIN(c_d), 
	.D0IN(c_d_0), 
	.DOUT(d_out), 
	.DOF(d_ovf), 
	.CIN(c_c), 
	.C0IN(c_c_0), 
	.COUT(c_out),
	.COF(c_ovf),
	.HIN(data_out_ser[15:0]), 
	.EV(ser_ev), 
	.READY(fit_ready), 
	.CLOCK(clock), 
	.RESET(reset), 
	.DV(ser_dv)
//	.NCVERROR
	);



//Hit Spy for 6 multipliers
hitspy6_chipass u_hits_spy(
	.HITIN(data_out_ser[1+:15]), 
	.CLOCK(clock),
	.RESET(reset), 
	.DV(ser_dv), 
	.HITMAP(hitmap_ser),                   
	.hits1(hits1), 
	.hits2(hits2),
	.hits3(hits3), 
	.hits4(hits4),
	.hits5(hits5), 
	.hits6(hits6),
	.xft_phi_msb(xft_phi_msb)
);

assign parameters[0+:DWIDTH]  = d_out;
assign parameters[(DWIDTH)+:CWIDTH] = c_out;
assign parameters[(CWIDTH+DWIDTH)+:PHIWIDTH] = phi_out;


hitmap_lcmap_shift u_hitmap_lcmap_shift(
	.hitmap_in(hitmap_ser),
	.lcmap_in(lcmap_ser),
	.hitmap_out(hitmap),
	.lcmap_out(lcmap),
	.clock(clock),
	.reset(reset),
	.ce(hit6)
);

endmodule
