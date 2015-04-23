`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:20:16 05/04/2009 
// Design Name: 
// Module Name:    shift_comb_valid_ee 
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
module shift_comb_valid_ee(
    input clock,
    input valid_in,
    input ee_in,
	 input last_comb_in,
    output valid_out,
    output ee_out,
	 output last_comb_out
    );

SRLC32E #(
      .INIT(32'h00000000) // Initial Value of Shift Register
   ) shift_valid (
      .Q(valid_out),     // SRL data output
      //.Q31(Q31), // SRL cascade output pin
      .A(5'b10110),     // 5-bit shift depth select input - 24 best
      .CE(1'b1),   // Clock enable input
      .CLK(clock), // Clock input
      .D(valid_in)      // SRL data input
);

SRLC32E #(
      .INIT(32'h00000000) // Initial Value of Shift Register
   ) shift_ee (
      .Q(ee_out),     // SRL data output
      //.Q31(Q31), // SRL cascade output pin
      .A(5'b10110),     // 5-bit shift depth select input - 24 best
      .CE(1'b1),   // Clock enable input
      .CLK(clock), // Clock input
      .D(ee_in)      // SRL data input
);

SRLC32E #(
      .INIT(32'h00000000) // Initial Value of Shift Register
   ) shift_last_comb (
      .Q(last_comb_out),     // SRL data output
      //.Q31(Q31), // SRL cascade output pin
      .A(5'b10110),     // 5-bit shift depth select input - 24 best
      .CE(1'b1),   // Clock enable input
      .CLK(clock), // Clock input
      .D(last_comb_in)      // SRL data input
);

endmodule
