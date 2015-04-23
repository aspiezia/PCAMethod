`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:07:23 04/18/2008 
// Design Name: 
// Module Name:    sel_reg 
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
module sel_reg(IN, OUT, CLOCK);
    input [2:0] IN;
    output [2:0] OUT;
    input CLOCK;
	 
	 reg [2:0] OUT;
	reg [2:0] out0;

always @(negedge CLOCK)
begin
	out0 <= IN;
	OUT <= out0;
end
endmodule
