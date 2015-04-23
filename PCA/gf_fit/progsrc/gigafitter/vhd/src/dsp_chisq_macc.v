`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:11:06 05/17/2009 
// Design Name: 
// Module Name:    dsp_chisq_macc 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module dsp_chisq_macc(
					  CHI_IN, 
                 CLK_IN, 
                 LOAD_IN, 
					  RESET,
                 P_OUT,
					  OVERFLOW);
	parameter PARAMETERWIDTH=15;
	parameter CHISQBITS=32;

    input [PARAMETERWIDTH-1:0] CHI_IN;
    input CLK_IN;
    input LOAD_IN;
	 input RESET;
   output [CHISQBITS-1:0] P_OUT;
   output OVERFLOW;
	
   wire GND_ALUMODE;
   wire [2:0] GND_BUS_3;
   wire [17:0] GND_BUS_18;
   wire [29:0] GND_BUS_30;
   wire [47:0] GND_BUS_48;
   wire GND_OPMODE;
   wire [47:0] P_OUT_INT;
   wire VCC_OPMODE;
   
	assign P_OUT = P_OUT_INT[15+:CHISQBITS]; // LSB CHISQBITS
	
	assign OVERFLOW = ~(P_OUT_INT[47:(15+CHISQBITS)] == {(33-CHISQBITS){1'b0}});
	
   assign GND_ALUMODE = 0;
   assign GND_BUS_3 = 3'b000;
   assign GND_BUS_18 = 18'b000000000000000000;
   assign GND_BUS_30 = 30'b000000000000000000000000000000;
   assign GND_BUS_48 = 48'b000000000000000000000000000000000000000000000000;
   assign GND_OPMODE = 0;
   assign VCC_OPMODE = 1;
	
   DSP48E DSP48E_INST (.A({{5{1'b0}},CHI_IN, {(25-PARAMETERWIDTH){1'b0}}}), 
                       .ACIN(GND_BUS_30[29:0]), 
                       .ALUMODE({GND_ALUMODE, GND_ALUMODE, GND_ALUMODE, 
         GND_ALUMODE}), 
                       .B({CHI_IN, {(18-PARAMETERWIDTH){1'b0}}}), 
                       .BCIN(GND_BUS_18[17:0]), 
                       .C(GND_BUS_48[47:0]), 
                       .CARRYCASCIN(GND_ALUMODE), 
                       .CARRYIN(GND_ALUMODE), 
                       .CARRYINSEL(GND_BUS_3[2:0]), 
                       .CEALUMODE(VCC_OPMODE), 
                       .CEA1(GND_ALUMODE), 
                       .CEA2(VCC_OPMODE), 
                       .CEB1(GND_ALUMODE), 
                       .CEB2(VCC_OPMODE), 
                       .CEC(GND_ALUMODE), 
                       .CECARRYIN(GND_ALUMODE), 
                       .CECTRL(VCC_OPMODE), 
                       .CEM(VCC_OPMODE), 
                       .CEMULTCARRYIN(GND_ALUMODE), 
                       .CEP(VCC_OPMODE), 
                       .CLK(CLK_IN), 
                       .MULTSIGNIN(GND_ALUMODE), 
                       .OPMODE({GND_OPMODE, LOAD_IN, GND_OPMODE, GND_OPMODE, 
         VCC_OPMODE, GND_OPMODE, VCC_OPMODE}), 
                       .PCIN(GND_BUS_48[47:0]), 
                       .RSTA(RESET), 
                       .RSTALLCARRYIN(GND_ALUMODE), 
                       .RSTALUMODE(GND_ALUMODE), 
                       .RSTB(RESET), 
                       .RSTC(GND_ALUMODE), 
                       .RSTCTRL(GND_ALUMODE), 
                       .RSTM(RESET), 
                       .RSTP(RESET), 
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
   defparam DSP48E_INST.CREG = 0;
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
