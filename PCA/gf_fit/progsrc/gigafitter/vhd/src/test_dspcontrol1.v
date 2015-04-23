`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:18:13 10/24/2008
// Design Name:   dspcontrol
// Module Name:   C:/Documents and Settings/Martina/Desktop/mezzanina/testfirmware/test_dspcontrol1.v
// Project Name:  mezzanina_gigafitter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dspcontrol
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_dspcontrol1;

	// Inputs
	reg RESET;
	reg CLOCK;
	reg DV;
	reg EV;

	// Outputs
	wire MODECP;
	wire MODE0;
	wire DVout;
	wire [1:0] state_out;

	// Instantiate the Unit Under Test (UUT)
	dspcontrol uut (
		.RESET(RESET), 
		.CLOCK(CLOCK), 
		.DV(DV), 
		.EV(EV), 
		.MODECP(MODECP), 
		.MODE0(MODE0), 
		.DVout(DVout), 
		.state_out(state_out)
	);

	initial begin
		// Initialize Inputs
		RESET = 0;
		CLOCK = 0;
		DV = 0;
		EV = 0;

		// Wait 100 ns for global reset to finish
		#100;
      RESET = 1;
		#40 RESET = 0;
		#20 DV = 1;
		#20 DV = 0;
		#20 DV = 1;
		#40 EV = 1;
		#20 DV = 0; EV = 0;
		// Add stimulus here

	end
      
	always begin
		#10 CLOCK = ~CLOCK;
	end
	
endmodule

