`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:02:27 04/03/2008 
// Design Name: 
// Module Name:    formatter_mux 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: Simple synchronous 8 to 1 multiplexer 
//
//////////////////////////////////////////////////////////////////////////////////
module formatter_mux(CLOCK, IN1, IN2, IN3, IN4, IN5, IN6, IN7, IN8, OUT, SEL);
    input CLOCK;
    output [20:0] OUT;
	 input [20:0] IN1, IN2, IN3, IN4, IN5, IN6, IN7, IN8;
    input [2:0] SEL;  // SEL �lo stato,espresso in 4 bit
	 reg [20:0] OUT;

   always @(posedge CLOCK)
	   case (SEL)
         3'b000: OUT <= IN1;
         3'b001: OUT <= IN2;
         3'b010: OUT <= IN3;
         3'b011: OUT <= IN4;
         3'b100: OUT <= IN5;
         3'b101: OUT <= IN6;
         3'b110: OUT <= IN7;
         3'b111: OUT <= IN8;
      endcase

endmodule
