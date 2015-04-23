`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:24:44 05/09/2009 
// Design Name: 
// Module Name:    mux48_6in_dsp 
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
module mux48_6in_dsp(
    input [47:0] in0,
    input [47:0] in1,
    input [47:0] in2,
    input [47:0] in3,
    input [47:0] in4,
    input [47:0] in5,
    input [2:0] sel,
    output [47:0] out,
    input clock,
    input reset
    );

   wire [17:0] GND_BUS_18;
   wire [29:0] GND_BUS_30;
   assign GND_BUS_18 = 18'b000000000000000000;
   assign GND_BUS_30 = 30'b000000000000000000000000000000;

wire [6:0] opmode_01;
wire [6:0] opmode_23;
wire [6:0] opmode_45;

// sel 0
assign opmode_01[0] = (sel == 3'b000);
assign opmode_01[1] = (sel == 3'b000);

// sel 1
assign opmode_01[2] = (sel == 3'b001);
assign opmode_01[3] = (sel == 3'b001);

// next sels
assign opmode_01[4] = (sel == 3'b010) | (sel == 3'b011) | (sel == 3'b100) | (sel == 3'b101);

// zeros
assign opmode_01[6:5] = 2'b00;

// sel 2
assign opmode_23[0] = (sel == 3'b010);
assign opmode_23[1] = (sel == 3'b010);

// sel 3
assign opmode_23[2] = (sel == 3'b011);
assign opmode_23[3] = (sel == 3'b011);

// next sels
assign opmode_23[4] = (sel == 3'b100) | (sel == 3'b101);

// zeros
assign opmode_23[6:5] = 2'b00;

// sel 4
assign opmode_45[0] = (sel == 3'b100);
assign opmode_45[1] = (sel == 3'b100);

// sel 5
assign opmode_45[2] = (sel == 3'b101);
assign opmode_45[3] = (sel == 3'b101);

// zeros
assign opmode_45[6:4] = 3'b000;

wire [47:0] pcout_23;
wire [47:0] pcout_45;

DSP48E DSP_01 (
	.A(in0[18+:30]), 
   .ACIN(GND_BUS_30[29:0]), 
   .ALUMODE(4'b0000), 
   .B(in0[0+:18]), 
	.BCIN(GND_BUS_18[17:0]),
   .C(in1), 
   .CARRYCASCIN(1'b0), 
   .CARRYIN(1'b0), 
   .CARRYINSEL(3'b000), 
   .CEALUMODE(1'b1), 
   .CEA1(1'b0), 
   .CEA2(1'b1), 
   .CEB1(1'b0), 
   .CEB2(1'b1), 
   .CEC(1'b1), 
   .CECARRYIN(1'b0), 
   .CECTRL(1'b1), 
   .CEM(1'b0), 
   .CEMULTCARRYIN(1'b0), 
   .CEP(1'b1), 
   .CLK(clock), 
   .MULTSIGNIN(1'b0), 
   .OPMODE(opmode_01), 
   .PCIN(pcout_23), 
   .RSTA(reset), 
   .RSTALLCARRYIN(reset), 
   .RSTALUMODE(reset), 
   .RSTB(reset), 
   .RSTC(reset), 
   .RSTCTRL(reset), 
   .RSTM(reset), 
   .RSTP(reset), 
   .ACOUT(), 
   .BCOUT(), 
   .CARRYCASCOUT(), 
   .CARRYOUT(), 
   .MULTSIGNOUT(), 
   .OVERFLOW(), 
   .P(out), 
   .PATTERNBDETECT(), 
   .PATTERNDETECT(), 
   .PCOUT(), 
   .UNDERFLOW());

	defparam DSP_01.ACASCREG = 1;
   defparam DSP_01.ALUMODEREG = 0;
   defparam DSP_01.AREG = 1;
   defparam DSP_01.AUTORESET_PATTERN_DETECT = "FALSE";
   defparam DSP_01.AUTORESET_PATTERN_DETECT_OPTINV = "MATCH";
   defparam DSP_01.A_INPUT = "DIRECT";
   defparam DSP_01.BCASCREG = 1;
   defparam DSP_01.BREG = 1;
   defparam DSP_01.B_INPUT = "DIRECT";
   defparam DSP_01.CARRYINREG = 0;
   defparam DSP_01.CARRYINSELREG = 0;
   defparam DSP_01.CREG = 1;
   defparam DSP_01.MASK = 48'h3FFFFFFFFFFF;
   defparam DSP_01.MREG = 0;
   defparam DSP_01.MULTCARRYINREG = 0;
   defparam DSP_01.OPMODEREG = 1;
   defparam DSP_01.PATTERN = 48'h000000000000;
   defparam DSP_01.PREG = 1;
   defparam DSP_01.SEL_MASK = "MASK";
   defparam DSP_01.SEL_PATTERN = "PATTERN";
   defparam DSP_01.SEL_ROUNDING_MASK = "SEL_MASK";
   defparam DSP_01.USE_MULT = "NONE";
   defparam DSP_01.USE_PATTERN_DETECT = "NO_PATDET";
   defparam DSP_01.USE_SIMD = "ONE48";

DSP48E DSP_23 (
	.A(in2[18+:30]), 
   .ACIN(GND_BUS_30[29:0]), 
   .ALUMODE(4'b0000), 
   .B(in2[0+:18]), 
	.BCIN(GND_BUS_18[17:0]),
   .C(in3), 
   .CARRYCASCIN(1'b0), 
   .CARRYIN(1'b0), 
   .CARRYINSEL(3'b000), 
   .CEALUMODE(1'b1), 
   .CEA1(1'b0), 
   .CEA2(1'b1), 
   .CEB1(1'b0), 
   .CEB2(1'b1), 
   .CEC(1'b1), 
   .CECARRYIN(1'b0), 
   .CECTRL(1'b1), 
   .CEM(1'b0), 
   .CEMULTCARRYIN(1'b0), 
   .CEP(1'b0), 
   .CLK(clock), 
   .MULTSIGNIN(1'b0), 
   .OPMODE(opmode_23), 
   .PCIN(pcout_45), 
   .RSTA(reset), 
   .RSTALLCARRYIN(reset), 
   .RSTALUMODE(reset), 
   .RSTB(reset), 
   .RSTC(reset), 
   .RSTCTRL(reset), 
   .RSTM(reset), 
   .RSTP(reset), 
   .ACOUT(), 
   .BCOUT(), 
   .CARRYCASCOUT(), 
   .CARRYOUT(), 
   .MULTSIGNOUT(), 
   .OVERFLOW(), 
   .P(), 
   .PATTERNBDETECT(), 
   .PATTERNDETECT(), 
   .PCOUT(pcout_23), 
   .UNDERFLOW());

	defparam DSP_23.ACASCREG = 1;
   defparam DSP_23.ALUMODEREG = 0;
   defparam DSP_23.AREG = 1;
   defparam DSP_23.AUTORESET_PATTERN_DETECT = "FALSE";
   defparam DSP_23.AUTORESET_PATTERN_DETECT_OPTINV = "MATCH";
   defparam DSP_23.A_INPUT = "DIRECT";
   defparam DSP_23.BCASCREG = 1;
   defparam DSP_23.BREG = 1;
   defparam DSP_23.B_INPUT = "DIRECT";
   defparam DSP_23.CARRYINREG = 0;
   defparam DSP_23.CARRYINSELREG = 0;
   defparam DSP_23.CREG = 1;
   defparam DSP_23.MASK = 48'h3FFFFFFFFFFF;
   defparam DSP_23.MREG = 0;
   defparam DSP_23.MULTCARRYINREG = 0;
   defparam DSP_23.OPMODEREG = 1;
   defparam DSP_23.PATTERN = 48'h000000000000;
   defparam DSP_23.PREG = 0;
   defparam DSP_23.SEL_MASK = "MASK";
   defparam DSP_23.SEL_PATTERN = "PATTERN";
   defparam DSP_23.SEL_ROUNDING_MASK = "SEL_MASK";
   defparam DSP_23.USE_MULT = "NONE";
   defparam DSP_23.USE_PATTERN_DETECT = "NO_PATDET";
   defparam DSP_23.USE_SIMD = "ONE48";

DSP48E DSP_45 (
	.A(in4[18+:30]), 
   .ACIN(GND_BUS_30[29:0]), 
   .ALUMODE(4'b0000), 
   .B(in4[0+:18]), 
	.BCIN(GND_BUS_18[17:0]),
   .C(in5), 
   .CARRYCASCIN(1'b0), 
   .CARRYIN(1'b0), 
   .CARRYINSEL(3'b000), 
   .CEALUMODE(1'b1), 
   .CEA1(1'b0), 
   .CEA2(1'b1), 
   .CEB1(1'b0), 
   .CEB2(1'b1), 
   .CEC(1'b1), 
   .CECARRYIN(1'b0), 
   .CECTRL(1'b1), 
   .CEM(1'b0), 
   .CEMULTCARRYIN(1'b0), 
   .CEP(1'b0), 
   .CLK(clock), 
   .MULTSIGNIN(1'b0), 
   .OPMODE(opmode_45), 
   .PCIN(), 
   .RSTA(reset), 
   .RSTALLCARRYIN(reset), 
   .RSTALUMODE(reset), 
   .RSTB(reset), 
   .RSTC(reset), 
   .RSTCTRL(reset), 
   .RSTM(reset), 
   .RSTP(reset), 
   .ACOUT(), 
   .BCOUT(), 
   .CARRYCASCOUT(), 
   .CARRYOUT(), 
   .MULTSIGNOUT(), 
   .OVERFLOW(), 
   .P(), 
   .PATTERNBDETECT(), 
   .PATTERNDETECT(), 
   .PCOUT(pcout_45), 
   .UNDERFLOW());

	defparam DSP_45.ACASCREG = 1;
   defparam DSP_45.ALUMODEREG = 0;
   defparam DSP_45.AREG = 1;
   defparam DSP_45.AUTORESET_PATTERN_DETECT = "FALSE";
   defparam DSP_45.AUTORESET_PATTERN_DETECT_OPTINV = "MATCH";
   defparam DSP_45.A_INPUT = "DIRECT";
   defparam DSP_45.BCASCREG = 1;
   defparam DSP_45.BREG = 1;
   defparam DSP_45.B_INPUT = "DIRECT";
   defparam DSP_45.CARRYINREG = 0;
   defparam DSP_45.CARRYINSELREG = 0;
   defparam DSP_45.CREG = 1;
   defparam DSP_45.MASK = 48'h3FFFFFFFFFFF;
   defparam DSP_45.MREG = 0;
   defparam DSP_45.MULTCARRYINREG = 0;
   defparam DSP_45.OPMODEREG = 1;
   defparam DSP_45.PATTERN = 48'h000000000000;
   defparam DSP_45.PREG = 0;
   defparam DSP_45.SEL_MASK = "MASK";
   defparam DSP_45.SEL_PATTERN = "PATTERN";
   defparam DSP_45.SEL_ROUNDING_MASK = "SEL_MASK";
   defparam DSP_45.USE_MULT = "NONE";
   defparam DSP_45.USE_PATTERN_DETECT = "NO_PATDET";
   defparam DSP_45.USE_SIMD = "ONE48";

endmodule
