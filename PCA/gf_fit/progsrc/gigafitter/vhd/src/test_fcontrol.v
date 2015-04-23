`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:55:50 12/10/2008
// Design Name:   formatter_control
// Module Name:   /home/dasnake/lavori/gigafitter/firmware/mezzanina_fnal_06_12/test_fcontrol.v
// Project Name:  mezzanina_gigafitter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: formatter_control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_fcontrol;

	// Inputs
	reg TRACK_FIFO_EMPTY;
	reg EE;
	reg OUT_FIFO_FULL;
	reg RESET;
	reg CLOCK;

	// Outputs
	wire TRACK_FIFO_RE;
	wire FIFO_EE_RE;
	wire HITS_FIFO_RE;
	wire OUT_FIFO_WE;
	wire OUT_FIFO_ERROR;
	wire [2:0] SEL;
	wire EE_OUT;
	wire EP_OUT;

	// Instantiate the Unit Under Test (UUT)
	formatter_control uut (
		.TRACK_FIFO_RE(TRACK_FIFO_RE), 
		.TRACK_FIFO_EMPTY(TRACK_FIFO_EMPTY), 
		.EE(EE), 
		.FIFO_EE_RE(FIFO_EE_RE), 
		.HITS_FIFO_RE(HITS_FIFO_RE), 
		.OUT_FIFO_WE(OUT_FIFO_WE), 
		.OUT_FIFO_FULL(OUT_FIFO_FULL), 
		.OUT_FIFO_ERROR(OUT_FIFO_ERROR), 
		.SEL(SEL), 
		.RESET(RESET), 
		.CLOCK(CLOCK), 
		.EE_OUT(EE_OUT), 
		.EP_OUT(EP_OUT)
	);

	initial begin
		// Initialize Inputs
		TRACK_FIFO_EMPTY = 1;
		EE = 0;
		OUT_FIFO_FULL = 0;
		RESET = 0;
		CLOCK = 0;

		// Wait 100 ns for global reset to finish
		#100;
		RESET = 1;
		#10 RESET = 0;
		#10;
      TRACK_FIFO_EMPTY = 0;
		#140;
		EE = 1;
		#10;
		EE = 0;
		#140;
		TRACK_FIFO_EMPTY = 1;
		// Add stimulus here

	end

	always begin
		#5 CLOCK = ~CLOCK;
	end
endmodule

