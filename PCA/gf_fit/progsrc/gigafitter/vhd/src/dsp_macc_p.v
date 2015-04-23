`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Francesco Crescioli
// 
// Create Date:    11:00:06 05/10/2009 
// Design Name: 
// Module Name:    dsp_macc_p 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: implement the svtsim_tf_p scalar product, except the final
// rounding. Shifts are due to 0.5 added to hit (<<1), const and intercept
// have different shifts (<<30 and <<16). One bit is left for rounding later.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module dsp_macc_p(A_IN, 
               B_IN, 
               CE_IN, 
               CLK_IN, 
               C_IN, 
               OPMODE_IN, 
               RST_IN, 
               P_OUT,
					OVERFLOW);

	parameter outwidth = 15;

    input [17:0] A_IN;
    input [15:0] B_IN;
    input CE_IN;
    input CLK_IN;
    input [17:0] C_IN;
    input [6:0] OPMODE_IN;
    input RST_IN;
   output [outwidth-1:0] P_OUT;
	output OVERFLOW;
   
	wire [47:0] P_OUT_INT;
   wire GND_ALUMODE;
   wire [17:0] GND_BUS_18;
   wire [29:0] GND_BUS_30;
	wire [47:0] GND_BUS_48;
	
	assign P_OUT = P_OUT_INT[17+:outwidth];
   assign GND_ALUMODE = 0;
   assign GND_BUS_18 = 18'b000000000000000000;
   assign GND_BUS_30 = 30'b000000000000000000000000000000;
	assign GND_BUS_48 = 48'h000000000000;
	wire OVERFLOW_RESULT;
	
	assign OVERFLOW_RESULT = (
		(P_OUT_INT[47:(17+outwidth)] == {(31-outwidth){1'b0}}) | 
		(P_OUT_INT[47:(17+outwidth)] == {(31-outwidth){1'b1}})
		) ? 1'b0 : 1'b1;


	assign OVERFLOW = OVERFLOW_RESULT;
	
	
	
   DSP48E DSP48E_INST (.A({A_IN[17:17], A_IN[17:17], A_IN[17:17], A_IN[17:17], 
         A_IN[17:17], A_IN[17:17], A_IN[17:17], A_IN[17:17], A_IN[17:17], 
         A_IN[17:17], A_IN[17:17], A_IN[17:17], A_IN[17:0]}), 
                       .ACIN(GND_BUS_30[29:0]), 
                       .ALUMODE({GND_ALUMODE, GND_ALUMODE, GND_ALUMODE, 
         GND_ALUMODE}), 
                       .B({B_IN[15:15], B_IN[15:15], B_IN[15:0]}), 
                       .BCIN(GND_BUS_18[17:0]), 
							  
							  // shift intercept by 18-bit
                       .C({
				           C_IN[17:17], C_IN[17:17], C_IN[17:17], C_IN[17:17], C_IN[17:17], 
         C_IN[17:17], C_IN[17:17], C_IN[17:17], C_IN[17:17], C_IN[17:17], 
         C_IN[17:17], C_IN[17:17], 
         C_IN[17:0], 18'h00000}), 
                       .CARRYCASCIN(GND_ALUMODE), 
                       .CARRYIN(GND_ALUMODE), 
                       .CARRYINSEL(3'b000), 
                       .CEALUMODE(CE_IN), 
                       .CEA1(GND_ALUMODE), 
                       .CEA2(CE_IN), 
                       .CEB1(GND_ALUMODE), 
                       .CEB2(CE_IN), 
                       .CEC(CE_IN), 
                       .CECARRYIN(CE_IN), 
                       .CECTRL(CE_IN), 
                       .CEM(CE_IN), 
                       .CEMULTCARRYIN(CE_IN), 
                       .CEP(CE_IN), 
                       .CLK(CLK_IN), 
                       .MULTSIGNIN(GND_ALUMODE), 
                       .OPMODE(OPMODE_IN[6:0]), 
                       .PCIN(GND_BUS_48), 
                       .RSTA(RST_IN), 
                       .RSTALLCARRYIN(RST_IN), 
                       .RSTALUMODE(RST_IN), 
                       .RSTB(RST_IN), 
                       .RSTC(RST_IN), 
                       .RSTCTRL(RST_IN), 
                       .RSTM(RST_IN), 
                       .RSTP(RST_IN), 
                       .ACOUT(), 
                       .BCOUT(), 
                       .CARRYCASCOUT(), 
                       .CARRYOUT(), 
                       .MULTSIGNOUT(), 
                       .OVERFLOW(), 
                       .P(P_OUT_INT[47:0]), 
                       .PATTERNBDETECT(), 
                       .PATTERNDETECT(), 
                       .PCOUT(), 
                       .UNDERFLOW());
							 
   defparam DSP48E_INST.ACASCREG = 1;
   defparam DSP48E_INST.ALUMODEREG = 0;
   defparam DSP48E_INST.AREG = 1;
   defparam DSP48E_INST.AUTORESET_PATTERN_DETECT = "FALSE";
   defparam DSP48E_INST.AUTORESET_PATTERN_DETECT_OPTINV = "MATCH";
   defparam DSP48E_INST.A_INPUT = "DIRECT";
   defparam DSP48E_INST.BCASCREG = 1;
   defparam DSP48E_INST.BREG = 1;
   defparam DSP48E_INST.B_INPUT = "DIRECT";
   defparam DSP48E_INST.CARRYINREG = 0;
   defparam DSP48E_INST.CARRYINSELREG = 0;
   defparam DSP48E_INST.CREG = 1;
   defparam DSP48E_INST.MASK = 48'h3FFFFFFFFFFF;
   defparam DSP48E_INST.MREG = 1;
   defparam DSP48E_INST.MULTCARRYINREG = 1;
   defparam DSP48E_INST.OPMODEREG = 1;
   defparam DSP48E_INST.PATTERN = 48'h000000000000;
   defparam DSP48E_INST.PREG = 1;
   defparam DSP48E_INST.SEL_MASK = "MASK";
   defparam DSP48E_INST.SEL_PATTERN = "PATTERN";
   defparam DSP48E_INST.SEL_ROUNDING_MASK = "SEL_MASK";
   defparam DSP48E_INST.USE_MULT = "MULT_S";
   defparam DSP48E_INST.USE_PATTERN_DETECT = "NO_PATDET";
   defparam DSP48E_INST.USE_SIMD = "ONE48";

endmodule
