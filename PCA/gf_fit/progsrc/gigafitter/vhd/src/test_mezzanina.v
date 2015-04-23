`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:06:36 05/27/2008
// Design Name:   mezzanina_gigafitter
// Module Name:   C:/Xilinx91i/_PROGETTI/mezzanina_gigafitter/test_mezzanina.v
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

module test_mezzanina_v;

	// Inputs
	reg [23:0] W1_DATA;
	reg J3WRITECLK;

	// Outputs
	wire W_HOLD_2;
	wire FLOATIN_3;
	wire FLOATIN_4;
	wire [15:1] OUT;

	// Bidirs
	wire [22:0] LData;
	wire LData_dv;
	reg LData_re;
	reg RESET;

	// Instantiate the Unit Under Test (UUT)
	mezzanina_gigafitter uut (
		.W1_DATA(W1_DATA), 
		.W_HOLD_2(W_HOLD_2), 
		.J3WRITECLK(J3WRITECLK), 
		.FLOATIN_3(FLOATIN_3), 
		.FLOATIN_4(FLOATIN_4), 
		.OUT(OUT), 
		.J1DATA_out({LData_dv,LData}),
		.J1DATA_25(LData_re),
		.J1DATA(),
		.J3DATA(),
		.J3DATA_in(),
		.J3DATA_out_24()
//		.RESET(RESET),
//		.LData(LData),
//		.LData_dv(LData_dv),
//		.LData_re(LData_re)
	);

	initial begin
		// Initialize Inputs
		W1_DATA = 0;
		W1_DATA[23] = 1;
		J3WRITECLK = 0;
		LData_re = 0;
	
		RESET = 0;
	
		// Wait 100 ns for global reset to finish
		#400;
      
		#20 W1_DATA[23] = 0;
		#20 W1_DATA[23] = 1;
		#20 W1_DATA[23] = 0;
		#20 W1_DATA[23] = 1;
		#20 W1_DATA[23] = 0;
		#20 W1_DATA[23] = 1;
		#20 W1_DATA[23] = 0;
		#20 W1_DATA[23] = 1;
		#100 LData_re = 1;
		// Add stimulus here

	end
      
	always begin
		#12.5 J3WRITECLK = 1;
		#12.5 J3WRITECLK = 0;
	end
endmodule

