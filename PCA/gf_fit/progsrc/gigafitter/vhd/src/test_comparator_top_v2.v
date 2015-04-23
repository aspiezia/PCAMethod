`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:03:54 04/22/2009
// Design Name:   comparator_top_v2
// Module Name:   /home/dasnake/lavori/gigafitter/firmware/mezzanina_4c_mfit/test_comparator_top_v2.v
// Project Name:  mezzanina_gigafitter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: comparator_top_v2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_comparator_top_v2;

	// Inputs
	reg [13:0] CHI1;
	reg [13:0] CHI2;
	reg [13:0] CHI3;
	reg CLOCK;
	reg [4:0] LCMAP;
	reg [4:0] HITMAP;
	reg EV;
	reg EC;
	reg RESET;
	reg NOCOMP;
	reg READ_CHISQ;
	reg NOCUT;
	reg [22:0] chi2cut_value;

	// Outputs
	wire [10:0] CHISQ_OUT;
	wire BEST_READY;
	wire BETTER;
	wire EMPTY;
	wire SCROLL;
	wire CHICOMP_CE;
	wire CHICOMP_RES;
	wire chicomp_result_out;
	wire [15:0] chi2_out;

	// Instantiate the Unit Under Test (UUT)
	comparator_top_v2 uut (
		.CHI1(CHI1), 
		.CHI2(CHI2), 
		.CHI3(CHI3), 
		.CLOCK(CLOCK), 
		.LCMAP(LCMAP), 
		.HITMAP(HITMAP), 
		.EV(EV), 
		.EC(EC), 
		.CHISQ_OUT(CHISQ_OUT), 
		.RESET(RESET), 
		.NOCOMP(NOCOMP), 
		.BEST_READY(BEST_READY), 
		.BETTER(BETTER), 
		.READ_CHISQ(READ_CHISQ), 
		.EMPTY(EMPTY), 
		.SCROLL(SCROLL), 
		.NOCUT(NOCUT), 
		.CHICOMP_CE(CHICOMP_CE), 
		.CHICOMP_RES(CHICOMP_RES), 
		.chi2cut_value(chi2cut_value), 
		.chicomp_result_out(chicomp_result_out), 
		.chi2_out(chi2_out)
	);

	initial begin
		// Initialize Inputs
		CHI1 = 1;
		CHI2 = 1;
		CHI3 = 1;
		CLOCK = 0;
		LCMAP = 0;
		HITMAP = 0;
		EV = 0;
		EC = 0;
		RESET = 0;
		NOCOMP = 0;
		READ_CHISQ = 0;
		NOCUT = 0;
		chi2cut_value = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
    
always begin
	#10 CLOCK = ~CLOCK;
end
endmodule

