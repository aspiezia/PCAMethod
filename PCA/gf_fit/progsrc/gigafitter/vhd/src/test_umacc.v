`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:30:21 10/24/2008
// Design Name:   umacc
// Module Name:   /home/dasnake/lavori/gigafitter/firmware/martina/test_umacc.v
// Project Name:  mezzanina_gigafitter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: umacc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_umacc;

	// Inputs
	reg [14:0] hin;
	reg clock;
	reg reset;

	// Outputs
	wire [14:0] hout;

	// Instantiate the Unit Under Test (UUT)
	umacc uut (
		.hin(hin), 
		.hout(hout), 
		.clock(clock), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		hin = 0;
		clock = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        reset = 1;
		  #20 reset =0 ;
		  
		  #20 hin = 1;
		// Add stimulus here

	end
      
		always begin
		#10 clock = ~clock;
		end
endmodule

