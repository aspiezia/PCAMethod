`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:47:56 12/07/2008
// Design Name:   mezzanina_gigafitter
// Module Name:   /home/dasnake/lavori/gigafitter/firmware/mezzanina_fnal_06_12/test_top_ee.v
// Project Name:  mezzanina_gigafitter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mezzanina_gigafitter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_top_ee;

	// Inputs
	reg [23:0] W1_DATA;
	reg J3WRITECLK;
	reg J1DATA_25;
	reg [23:15] J3DATA_in;

	// Outputs
	wire W_HOLD_2;
	wire FLOATIN_3;
	wire FLOATIN_4;
	wire [20:1] OUT;
	wire [24:1] J1DATA_out;
	wire J3DATA_out_24;

	// Bidirs
	wire [45:26] J1DATA;
	wire [14:1] J3DATA;


	// Instantiate the Unit Under Test (UUT)
	mezzanina_gigafitter uut (
		.W1_DATA(W1_DATA), 
		.W_HOLD_2(W_HOLD_2), 
		.J3WRITECLK(J3WRITECLK), 
		.FLOATIN_3(FLOATIN_3), 
		.FLOATIN_4(FLOATIN_4), 
		.OUT(OUT), 
		.J1DATA_out(J1DATA_out), 
		.J1DATA_25(J1DATA_25), 
		.J1DATA(J1DATA), 
		.J3DATA(J3DATA), 
		.J3DATA_in(J3DATA_in), 
		.J3DATA_out_24(J3DATA_out_24)
	);

	initial begin
		// Initialize Inputs
		W1_DATA = 0;
		J3WRITECLK = 0;
		J1DATA_25 = 0;
		J3DATA_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        		#900;
     data_in = 23'h00cc0c;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h00cc0c;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h0539da;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h0539da;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h081a25;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h0cc6c6;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h1132d6;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h15feed;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h04b68c;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h287e23;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h600001;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h600002;
		ds = 0;
		#20 ds = 1;
		#20;
////////////////////////////////////
	#700;
      data_in = 23'h00cc0c;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h0539da;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h081a25;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h0cc6c6;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h1132d6;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h15feed;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h04b68c;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h290f34;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h600003;
		ds = 0;
		#20 ds = 1;
		#20;
		// Add stimulus here

	end
      
always begin
#25 J3WRITECLK = ~J3WRITECLK;
end

endmodule

