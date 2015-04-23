`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:01:06 03/14/2008 
// Design Name: 
// Module Name:    simpleregister 
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
module simpleregister(CLOCK, DIN, DOUT);
    input CLOCK;
    input DIN;
    output DOUT;
	 reg DOUT;

always @(posedge CLOCK)

        DOUT <= DIN;

endmodule
