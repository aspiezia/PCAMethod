`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:24:29 07/06/2009 
// Design Name: 
// Module Name:    comp_quality_shift 
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
module comp_quality_shift(
    input [2:0] quality,
    input clock,
    output [2:0] quality_shifted
    );

   SRL16 #(  // shift register to track chi overflows
      .INIT(16'h0000) // Initial Value of Shift Register
   ) SRL_QUALITY0 (
      .Q(quality_shifted[0]),       // SRL data output
      .A0(1'b1),     // Select[0] input
      .A1(1'b0),     // Select[1] input
      .A2(1'b1),     // Select[2] input
      .A3(1'b0),     // Select[3] input
		.CLK(clock),   // Clock input
      .D(quality[0])        // SRL data input
		);

   SRL16 #(  // shift register to track chi overflows
      .INIT(16'h0000) // Initial Value of Shift Register
   ) SRL_QUALITY1 (
      .Q(quality_shifted[1]),       // SRL data output
      .A0(1'b1),     // Select[0] input
      .A1(1'b0),     // Select[1] input
      .A2(1'b1),     // Select[2] input
      .A3(1'b0),     // Select[3] input
		.CLK(clock),   // Clock input
      .D(quality[1])        // SRL data input
		);
		
   SRL16 #(  // shift register to track chi overflows
      .INIT(16'h0000) // Initial Value of Shift Register
   ) SRL_QUALITY2 (
      .Q(quality_shifted[2]),       // SRL data output
      .A0(1'b1),     // Select[0] input
      .A1(1'b0),     // Select[1] input
      .A2(1'b1),     // Select[2] input
      .A3(1'b0),     // Select[3] input
		.CLK(clock),   // Clock input
      .D(quality[2])        // SRL data input
		);

endmodule
