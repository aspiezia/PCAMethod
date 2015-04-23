`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:40:46 05/12/2008 
// Design Name: 
// Module Name:    chireg 
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
module chireg(CLOCK, CE, DIN, DOUT, RESET);
	parameter PARAMETERBITS = 14;	
    input CLOCK;
    input CE;
    input [PARAMETERBITS-1:0] DIN;
    output [PARAMETERBITS-1:0] DOUT;
    input RESET;
	 reg [PARAMETERBITS-1:0] DOUT;
	 
	 always @(posedge CLOCK) begin
	 if (RESET)
		DOUT <= 0;
		
		else if(CE)
		DOUT <= DIN;
	end

endmodule
