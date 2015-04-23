`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:32:08 04/24/2009 
// Design Name: 
// Module Name:    chi_in_mux 
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
module chisq_out_mux(chisq_1, chisq_2, chisq_3, chi_in_overflow, sel, chisq_out);

parameter CHISQBITS = 32;

    input [CHISQBITS-1:0] chisq_1;
    input [CHISQBITS-1:0] chisq_2;
    input [CHISQBITS-1:0] chisq_3;
	 input chi_in_overflow;
    input [1:0] sel;
    output [CHISQBITS-1:0] chisq_out;
    

reg [CHISQBITS-1:0] chisq;
always @(sel or chisq_1 or chisq_2 or chisq_3)
begin
	case(sel)
		2'b00: chisq <= chisq_1;
		2'b01: chisq <= chisq_2;
		2'b10: chisq <= chisq_3;
		default: chisq <= chisq_1;
	endcase
end

assign chisq_out = chi_in_overflow ? {CHISQBITS{1'b1}} : chisq;

endmodule
