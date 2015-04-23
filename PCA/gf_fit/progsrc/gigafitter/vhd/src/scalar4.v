`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Francesco Crescioli
// based on scalar3 by Nicola Rafanelli
// 
// Create Date:    11:47:00 05/10/2009 
// Design Name: 
// Module Name:    scalar4 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: implement svtsim_tf_p scalar products less the final rounding
// one extra bit is added to the output to round later
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module scalar4(
    CHI1IN, CHI10IN, CHI1OUT, CHI1OF, 
	 CHI2IN, CHI20IN, CHI2OUT, CHI2OF, 
	 CHI3IN, CHI30IN, CHI3OUT, CHI3OF, 
	 PHIIN, PHI0IN, PHIOUT, PHIOF, 
	 DIN, D0IN, DOUT, DOF, 
	 CIN, C0IN, COUT, COF, 
	 HIN, EV, READY, CLOCK, RESET, DV);
    
	 parameter BUS_WIDTH_IN = 16; // Length of hits and costants words
	 parameter BUS_WIDTH_IN_CONST = 18;	 
	 
	 parameter CHI1WIDTH = 15;
	 parameter CHI2WIDTH = 15;
	 parameter CHI3WIDTH = 15;
	 parameter PHIWIDTH = 14;
	 parameter DWIDTH = 11;
	 parameter CWIDTH = 10;
	 
	 input [BUS_WIDTH_IN_CONST-1:0] CIN;   // Costanti che vanno moltiplicate per gli hits
	 input [BUS_WIDTH_IN_CONST-1:0] C0IN;   // Costante generale
    input [BUS_WIDTH_IN_CONST-1:0] DIN;  // Impact parameter coefficients
	 input [BUS_WIDTH_IN_CONST-1:0] D0IN; // 
	 input [BUS_WIDTH_IN_CONST-1:0] PHIIN; // 
	 input [BUS_WIDTH_IN_CONST-1:0] PHI0IN; // 
	 input [BUS_WIDTH_IN_CONST-1:0] CHI3IN; // 
	 input [BUS_WIDTH_IN_CONST-1:0] CHI30IN; // 
	 input [BUS_WIDTH_IN_CONST-1:0] CHI2IN; // 
	 input [BUS_WIDTH_IN_CONST-1:0] CHI20IN; // 
	 input [BUS_WIDTH_IN_CONST-1:0] CHI1IN; // 
	 input [BUS_WIDTH_IN_CONST-1:0] CHI10IN; // 
	 input [BUS_WIDTH_IN-1:0] HIN;   //Hits
    input EV, DV;
	 input CLOCK;
	 input RESET;
	 
	 output [CWIDTH-1:0] COUT;  
	 output [DWIDTH-1:0] DOUT;
	 output [PHIWIDTH-1:0] PHIOUT;
	 output [CHI1WIDTH-1:0] CHI1OUT;
	 output [CHI2WIDTH-1:0] CHI2OUT;
	 output [CHI3WIDTH-1:0] CHI3OUT;
    output READY;  	 // Uscita dell'accumulatore pronta
	 output COF, DOF, PHIOF, CHI1OF, CHI2OF, CHI3OF;

	 wire [6:0] OPMODE;
	 wire DVout;
	 wire READY, READY_INT, OPMODECP, FREEZE;

	// OPMODE: Control input to select the arithmetic operation of the DSP48E in conjunction with ALUMODE, number of bit= 7
	assign OPMODE[0] = 1'b1;   //It set X =0
	assign OPMODE[1] = 1'b0;
	assign OPMODE[2] = 1'b1;   // Y=0
	assign OPMODE[3] = 1'b0;
	assign OPMODE[4] = OPMODECP; // Bits from 6 to 4 are related to Z
	assign OPMODE[5] = 1'b1;  //It selects  P or C   010 is P, 011 is C
	assign OPMODE[6] = 1'b0;	
	
   assign READY = READY_INT & ~FREEZE;
		
// Instantiate the module  
dsp_macc_p #(.outwidth(CWIDTH)) C ( 
    .A_IN(CIN),    // signed 18 bit input	
    .B_IN(HIN),    // signed 14 bit input
    .CE_IN(~FREEZE), // idem
    .CLK_IN(CLOCK), 
    .C_IN(C0IN), 
    .OPMODE_IN(OPMODE), 
    .RST_IN(RESET), 
    .P_OUT(COUT),
	 .OVERFLOW(COF)
    );

dsp_macc_p #(.outwidth(DWIDTH)) D (
    .A_IN(DIN),    // signed 18 bit input	
    .B_IN(HIN),    // signed 14 bit input
    .CE_IN(~FREEZE), // idem
    .CLK_IN(CLOCK), 
    .C_IN(D0IN), 
    .OPMODE_IN(OPMODE), 
    .RST_IN(RESET), 
    .P_OUT(DOUT),
	 .OVERFLOW(DOF)
    );

dsp_macc_p #(.outwidth(PHIWIDTH)) PHI (
    .A_IN(PHIIN),    // signed 18 bit input	
    .B_IN(HIN),    // signed 14 bit input
    .CE_IN(~FREEZE), // idem
    .CLK_IN(CLOCK), 
    .C_IN(PHI0IN), 
    .OPMODE_IN(OPMODE), 
    .RST_IN(RESET), 
    .P_OUT(PHIOUT),
	 .OVERFLOW(PHIOF)
    );

dsp_macc_p #(.outwidth(CHI1WIDTH)) CHI1 (
    .A_IN(CHI1IN),    // signed 18 bit input	
    .B_IN(HIN),    // signed 14 bit input
    .CE_IN(~FREEZE), // idem
    .CLK_IN(CLOCK), 
    .C_IN(CHI10IN), 
    .OPMODE_IN(OPMODE), 
    .RST_IN(RESET), 
    .P_OUT(CHI1OUT),
	 .OVERFLOW(CHI1OF)
    );

dsp_macc_p #(.outwidth(CHI2WIDTH)) CHI2 (
    .A_IN(CHI2IN),    // signed 18 bit input	
    .B_IN(HIN),    // signed 14 bit input
    .CE_IN(~FREEZE), // idem
    .CLK_IN(CLOCK), 
    .C_IN(CHI20IN), 
    .OPMODE_IN(OPMODE), 
    .RST_IN(RESET), 
    .P_OUT(CHI2OUT),
	 .OVERFLOW(CHI2OF)
    );

dsp_macc_p #(.outwidth(CHI2WIDTH)) CHI3 (
    .A_IN(CHI3IN),    // signed 18 bit input	
    .B_IN(HIN),    // signed 14 bit input
    .CE_IN(~FREEZE), // idem
    .CLK_IN(CLOCK), 
    .C_IN(CHI30IN), 
    .OPMODE_IN(OPMODE), 
    .RST_IN(RESET), 
    .P_OUT(CHI3OUT),
	 .OVERFLOW(CHI3OF)
    );


	//control block,control state machine
   dspcontrol dspcontrol1(
		.RESET(RESET),
		.CLOCK(CLOCK),
		.EV(EV),
		.DV(DV),
		.FREEZE(FREEZE),
		.MODECP(OPMODECP),
		.DVout(DVout)
		);

   // End of FDCE_inst instantiation
			
	// SRL16E: 16-bit shift register LUT with clock enable operating on posedge of clock
   //        All FPGAs
   // Xilinx HDL Language Template, version 10.1
   
   SRL16E #(
      .INIT(16'h0000) // Initial Value of Shift Register
   ) SRL16E_inst (
      .Q(READY_INT),       // SRL data output
      .A0(1'b0),     // Select[0] input
      .A1(1'b1),     // Select[1] input
      .A2(1'b0),     // Select[2] input
      .A3(1'b0),     // Select[3] input
      .CE(~FREEZE),     // Clock enable input
      .CLK(CLOCK),   // Clock input
      .D(DVout)        // SRL data input
   );

endmodule
