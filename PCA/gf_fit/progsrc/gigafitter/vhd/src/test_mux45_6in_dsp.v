`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:14:35 05/09/2009
// Design Name:   mux48_6in_dsp
// Module Name:   /home/dasnake/lavori/gigafitter/firmware/mezzanina_4c_mfit_dspmux/test_mux45_6in_dsp.v
// Project Name:  mezzanina_gigafitter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux48_6in_dsp
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_mux45_6in_dsp;

	// Inputs
	reg [47:0] in0;
	reg [47:0] in1;
	reg [47:0] in2;
	reg [47:0] in3;
	reg [47:0] in4;
	reg [47:0] in5;
	reg [2:0] sel;
	reg clock;
	reg reset;

	// Outputs
	wire [47:0] out;

	// Instantiate the Unit Under Test (UUT)
	mux48_6in_dsp uut (
		.in0(in0), 
		.in1(in1), 
		.in2(in2), 
		.in3(in3), 
		.in4(in4), 
		.in5(in5), 
		.sel(sel), 
		.out(out), 
		.clock(clock), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		in0 = 1;
		in1 = 2;
		in2 = 3;
		in3 = 4;
		in4 = 5;
		in5 = 6;
		sel = 0;
		clock = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#210;
      sel = 3'b001;
		#100;
		sel = 3'b010;
		#100;
		sel = 3'b011;
		#100;
		sel = 3'b100;
		#100;
		sel = 3'b101;
		// Add stimulus here

	end
      
always begin
	#10 clock = ~clock;
end
endmodule

