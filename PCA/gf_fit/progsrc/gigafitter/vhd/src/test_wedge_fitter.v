`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:52:49 03/23/2009
// Design Name:   wedge_fitter
// Module Name:   /home/martina/mezzanina_work/mezzanina_4connettori_5_3_09/test_wedge_fitter.v
// Project Name:  mezzanina_gigafitter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: wedge_fitter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_wedge_fitter;

	// Inputs
	reg [22:0] data_in;
	reg ds;
	reg out_re;
	reg clock;
	reg reset;

	// Outputs
	wire hold;
	wire [22:0] data_out;
	wire out_empty;
	wire out_valid;
	wire [23:0] ispy_data;
	wire ispy_dv;

	// Instantiate the Unit Under Test (UUT)
	wedge_fitter uut (
		.data_in(data_in), 
		.ds(ds), 
		.out_re(out_re), 
		.clock(clock),
			.locked(1'b1),
		.reset(reset), 
		.hold(hold), 
		.data_out(data_out), 
		.out_empty(out_empty), 
		.out_valid(out_valid), 
		.ispy_data(ispy_data), 
		.ispy_dv(ispy_dv)
	);

	initial begin
		// Initialize Inputs
		data_in = 0;
		ds = 1;
		out_re = 0;
		clock = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 1;
		#50;
		reset = 0;
		
		#500;
		data_in = 23'h600000;
		ds = 0;
		#20;
		ds = 1;
        
		// Add stimulus here

	end
      
		
	always begin
		#10 clock = ~clock;
	end
endmodule

