`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:27:29 02/15/2009 
// Design Name: 
// Module Name:    hit_reg 
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
module hit_reg_new(DIN, DOUT, RESET, CLOCK, CE);
	 parameter HITBITS = 10;
	 //parameter HITBITS = 15;
	 input [HITBITS-1:0] DIN;
    output [HITBITS-1:0] DOUT;
    input CLOCK;
    input CE;
	 input RESET;
	 reg [HITBITS-1:0] DOUT;
	always @(posedge CLOCK)
	if (RESET) DOUT <= {{HITBITS}{1'b0}};
	else if (CE)	DOUT <= DIN;
	
endmodule
