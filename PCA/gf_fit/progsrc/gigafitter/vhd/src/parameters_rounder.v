`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:23:04 06/04/2009 
// Design Name: 
// Module Name:    parameters_rounder 
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
module parameters_rounder(
	parameters_in,
	parameters_out,
	clock,
	reset
    );


parameter PHIWIDTH = 14;
parameter DWIDTH = 11;
parameter CWIDTH = 10;

input [PHIWIDTH+DWIDTH+CWIDTH-1:0] parameters_in;
output [PHIWIDTH+DWIDTH+CWIDTH-4:0] parameters_out;
input clock, reset;

reg signed [PHIWIDTH-1:0] phi_reg1;
reg signed [DWIDTH-1:0] d_reg1;
reg signed [CWIDTH-1:0] c_reg1;

reg signed [PHIWIDTH-2:0] phi_reg2;
reg signed [DWIDTH-2:0] d_reg2;
reg signed [CWIDTH-2:0] c_reg2;

always @(posedge clock)
begin
	d_reg1 <= parameters_in[0+:DWIDTH];
	c_reg1 <= parameters_in[DWIDTH+:CWIDTH];
	phi_reg1 <= parameters_in[(DWIDTH+CWIDTH)+:PHIWIDTH];
end

always @(posedge clock)
begin
	if(d_reg1[DWIDTH-1]) begin
		d_reg2[DWIDTH-2] <= 1'b1;
		d_reg2[0+:DWIDTH-2] <= ~((d_reg1 - 1)>>1);
	end
	else d_reg2 <= (d_reg1 + 1) >> 1;
	if(c_reg1[CWIDTH-1]) begin
		c_reg2[CWIDTH-2] <= 1'b1;
		c_reg2[0+:CWIDTH-2] <= ~((c_reg1 - 1)>>1);
	end
	else c_reg2 <= (c_reg1 + 1) >> 1;
	phi_reg2 <= (phi_reg1 + 1)>>1;
end

assign parameters_out = {phi_reg2,c_reg2,d_reg2};

endmodule
