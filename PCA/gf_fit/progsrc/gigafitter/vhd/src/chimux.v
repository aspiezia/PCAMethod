`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:21:50 03/05/2008 
// Design Name: 
// Module Name:    chimux 
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
module chiser(SEL, CHI1, CHI2, CHI3, CLOCK, CHI);
    parameter PARAMETERBITS = 14;
	 input [PARAMETERBITS-1:0] CHI1, CHI2, CHI3;
    input [1:0] SEL;
	 input CLOCK;
	 output [PARAMETERBITS-1:0] CHI;
	 
	 reg [PARAMETERBITS-1:0] CHI;

always @(posedge CLOCK)begin
      case (SEL)
         2'b00: CHI <= CHI1;
         2'b01: CHI <= CHI2;
         2'b10: CHI <= CHI3;
         2'b11: CHI <= CHI1;
      endcase
		end

endmodule
