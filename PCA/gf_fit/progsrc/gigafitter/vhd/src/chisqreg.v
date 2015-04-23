`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:14:26 03/07/2008 
// Design Name: 
// Module Name:    chisqreg 
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
module chisqreg(CHISQIN, CHISQOUT, CLOCK, CE, RESET);
    parameter CHISQPASSBITS = 11;
	 input [CHISQPASSBITS-1:0] CHISQIN;
    output [CHISQPASSBITS-1:0] CHISQOUT;
    input CLOCK;
    input CE;
    input RESET;
	 reg [CHISQPASSBITS-1:0]CHISQOUT;

   always @(posedge CLOCK) begin
      if (RESET) begin
         CHISQOUT <= 0;
      end
      else if (CE) begin
         CHISQOUT <= CHISQIN;
      end
		end
endmodule
