`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:23:06 07/06/2009 
// Design Name: 
// Module Name:    multibit_reg_init 
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
module multibit_reg_init(
	clock,
	reset,
	ce,
	d,
	q
    );

parameter BITS = 16;
parameter INIT = 16'h0000;

input clock;
input reset;
input ce;
input [BITS-1:0] d;
output [BITS-1:0] q;

reg [BITS-1:0] q_reg;
always @(posedge clock)
begin
	if(reset)
		q_reg <= INIT;
	else
		if (ce) q_reg <= d;
		else q_reg <= q;
end

assign q = q_reg;
endmodule
