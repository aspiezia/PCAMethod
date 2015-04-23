`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:33:23 10/24/2008
// Design Name:   Fitter
// Module Name:   C:/Documents and Settings/Martina/Desktop/mezzanina/testfirmware/test_scalar3.v
// Project Name:  mezzanina_gigafitter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Fitter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_scalar3;

	// Inputs
	reg [13:0] CHI1IN;
	reg [13:0] CHI10IN;
	reg [13:0] CHI2IN;
	reg [13:0] CHI20IN;
	reg [13:0] CHI3IN;
	reg [13:0] CHI30IN;
	reg [13:0] PHIIN;
	reg [13:0] PHI0IN;
	reg [13:0] DIN;
	reg [13:0] D0IN;
	reg [13:0] CIN;
	reg [14:0] HIN;
	reg [13:0] C0IN;
	reg EV;
	reg CLOCK;
	reg RESET;
	reg DV;

	// Outputs
	wire [13:0] CHI1OUT;
	wire CHI1OF;
	wire [13:0] CHI2OUT;
	wire CHI2OF;
	wire [13:0] CHI3OUT;
	wire CHI3OF;
	wire [12:0] PHIOUT;
	wire PHIOF;
	wire [10:0] DOUT;
	wire DOF;
	wire COF;
	wire [7:0] COUT;
	wire READY;
	wire [1:0] state_out;

	// Instantiate the Unit Under Test (UUT)
	Fitter uut (
		.CHI1IN(CHI1IN), 
		.CHI10IN(CHI10IN), 
		.CHI1OUT(CHI1OUT), 
		.CHI1OF(CHI1OF), 
		.CHI2IN(CHI2IN), 
		.CHI20IN(CHI20IN), 
		.CHI2OUT(CHI2OUT), 
		.CHI2OF(CHI2OF), 
		.CHI3IN(CHI3IN), 
		.CHI30IN(CHI30IN), 
		.CHI3OUT(CHI3OUT), 
		.CHI3OF(CHI3OF), 
		.PHIIN(PHIIN), 
		.PHI0IN(PHI0IN), 
		.PHIOUT(PHIOUT), 
		.PHIOF(PHIOF), 
		.DIN(DIN), 
		.D0IN(D0IN), 
		.DOUT(DOUT), 
		.DOF(DOF), 
		.CIN(CIN), 
		.HIN(HIN), 
		.C0IN(C0IN), 
		.COF(COF), 
		.EV(EV), 
		.COUT(COUT), 
		.READY(READY), 
		.CLOCK(CLOCK), 
		.RESET(RESET), 
		.DV(DV), 
		.state_out(state_out)
	);

	initial begin
		// Initialize Inputs
		CHI1IN = 14'h0001;
		CHI10IN = 14'h0000;
		CHI2IN = 14'h0001;
		CHI20IN = 14'h0000;
		CHI3IN = 14'h0001;
		CHI30IN = 14'h0000;
		PHIIN = 14'h0001;
		PHI0IN = 14'h0000;
		DIN = 14'h0001;
		D0IN = 14'h0000;
		CIN = 14'h0001;
		HIN = 15'h0000;
		C0IN = 14'h0000;
		EV = 0;
		CLOCK = 0;
		RESET = 0;
		DV = 0;

		// Wait 100 ns for global reset to finish
		#100;
		RESET = 1;
		#12;
		#40 RESET = 0;
		#20;
      HIN = 15'h0001;
		DV = 1;
		#20 DV = 0;
		#20 DV = 0;
		#20 DV = 1;
	   #20 DV = 0;
		#20 DV = 0;
		#20 DV = 1;
	   #20 DV = 0;
		#20 DV = 1; EV = 1;
		#20 DV = 0; EV = 0;
		// Add stimulus here

	end
	
	always begin
		#10 CLOCK = ~CLOCK;
	end
      
endmodule

