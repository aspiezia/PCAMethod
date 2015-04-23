`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:   
// Engineer:  Nicola Rafanelli
// 
// Create Date:    17:16:46 03/05/2008 
// Design Name: 
// Module Name:    comparation_top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: This module takes chis and parameters coming out from the fitter, makes a cut on the chi square and chooses
//                      the parameters that have the best g function between all of them that arrive before or with the EC bit
//
//////////////////////////////////////////////////////////////////////////////////
//`include "Chicomparator.v"
//`include "best_chidsq_fifo.v"

module comparation_top(CHI1, CHI2, CHI3, chi_overflow, CLOCK, LCMAP, HITMAP, EV, EC, CHISQ_OUT, RESET, NOCOMP, BEST_READY, BETTER, READ_CHISQ, EMPTY, NOCUT, CHICOMP_CE, chi2cut_value, fifo_chisq_full, chi_best_overflow, chi2cut_debug, gfunc_res_debug, gfunc_cut_debug, chi2cut_ce_debug, gfunc_ce_debug);
	 parameter chisqcutstart = 2;
	 parameter PARAMETERBITS = 15;   // whidth of the parameters data input
	 parameter CHISQBITS = 13;       // whidth of the chisq ---> if you change this remember to change the chisq core
	 parameter CHISQPASSBITS = 11;   // whidth of the chisq that pass the cut ---> if you change this remember to change the chisq shift core
	 parameter CHISQ_GCOMP = 7;
	 parameter GBITS = 7;            // bits of the g funtion 
//	 parameter CHISQ_CUT = 23'h000f40;   
	 parameter NOCUT_VALUE = {CHISQBITS{1'b1}};
	 input [PARAMETERBITS-1:0] CHI1;
    input [PARAMETERBITS-1:0] CHI2;
    input [PARAMETERBITS-1:0] CHI3;
    input CLOCK, RESET, NOCOMP;
    input [4:0] LCMAP;
    input [4:0] HITMAP;
    input EV;
    input EC;
	 input READ_CHISQ, NOCUT;
	 input chi_overflow;
	 output EMPTY;
    output [CHISQPASSBITS-1:0] CHISQ_OUT;
	 output BEST_READY, BETTER, CHICOMP_CE;
//	 output [(PARAMETERBITS*4)-1:0] PAROUT;
	 input [CHISQBITS-1:0] chi2cut_value;
	 output fifo_chisq_full;
	 output chi_best_overflow;
	 output [12:0] chi2cut_debug;
	 output [6:0] gfunc_res_debug;
	 output [6:0] gfunc_cut_debug;
	 output chi2cut_ce_debug;
	 output gfunc_ce_debug;
	 //inout [35:0] ila_control;

	 wire [PARAMETERBITS-1:0] chi, chi1_reg, chi2_reg, chi3_reg;
	 wire [CHISQBITS-1:0] chisq;
	 wire [1:0] selmux1;
	 wire compg_res, chicomp_en, chicomp_result;
	 wire [GBITS-1:0] g;
	 wire endcomp /*start_endcomp*/;
	 wire [CHISQPASSBITS-1:0] chisq_cutpassed, chisq_reg0, chisq_shifted, chisq_better;
	 wire chisq_presence, chisq_reset, ev_1;
	 wire [CHISQBITS-1:0] cut_value;
	 
	 assign cut_value = NOCUT ? NOCUT_VALUE : chi2cut_value;
	 assign CHICOMP_CE = chicomp_en;

wire [CHISQBITS-1:0] chisq_unit_1;
wire [CHISQBITS-1:0] chisq_unit_2;
wire [CHISQBITS-1:0] chisq_unit_3;

wire [1:0] chisq_out_sel;
wire [1:0] chisq_unit_sel;

wire chi_overflow_en;

chisq_units_mux_fsm u_chisq_units_mux_fsm(
    .ev(EV),
    .clock(CLOCK),
    .reset(RESET),
    .sel_unit_in(chisq_unit_sel),
    .sel_unit_out(chisq_out_sel)
);

chisq_unit #(PARAMETERBITS,CHISQBITS) u_chisq_unit_1 (
    .chi1(CHI1),
    .chi2(CHI2),
    .chi3(CHI3),
    .clock(CLOCK),
    .reset(RESET),
    .dv(EV & (chisq_unit_sel == 2'b00)),
    .chisq(chisq_unit_1)
//	 ,
//	 .ila_control(ila_control)
);

chisq_unit #(PARAMETERBITS,CHISQBITS) u_chisq_unit_2 (
    .chi1(CHI1),
    .chi2(CHI2),
    .chi3(CHI3),
    .clock(CLOCK),
    .reset(RESET),
    .dv(EV & (chisq_unit_sel == 2'b01)),
    .chisq(chisq_unit_2)
);

chisq_unit #(PARAMETERBITS,CHISQBITS) u_chisq_unit_3 (
    .chi1(CHI1),
    .chi2(CHI2),
    .chi3(CHI3),
    .clock(CLOCK),
    .reset(RESET),
    .dv(EV & (chisq_unit_sel == 2'b10)),
    .chisq(chisq_unit_3)
);

wire chi_in_overflow;

chisq_out_mux #(CHISQBITS) u_chisq_out_mux (
	.chisq_1(chisq_unit_1),
	.chisq_2(chisq_unit_2),
   .chisq_3(chisq_unit_3),
	.chi_in_overflow(chi_in_overflow),
   .sel(chisq_out_sel),
   .chisq_out(chisq)
);
//
//simpleregister EV_reg(.CLOCK(CLOCK), .DIN(EV), .DOUT(ev_1));
//	
//comparationcontrol control(   // controls the timing of the comparation
//		.CLOCK(CLOCK),
//		.EV(ev_1),
//		.MUX1_SEL(selmux1),
//	   .CHISQ_RES(chicomp_result & (NOCUT)),
//	//	.CUT_EN(chicomp_en),
//		.RESET(RESET),
//		.CHICOMP_EN(chicomp_en),
//		.CHISQREG_EN(chisq_reg_en)
//		);	 
	 
		
	   SRL16 #(  // shift register to end the comparison beetween traks
      .INIT(16'h0000) // Initial Value of Shift Register
      ) SRL_ENDCOMP (
      .Q(endcomp),       // SRL data output
      .A0(1'b1),     // Select[0] input
      .A1(1'b0),     // Select[1] input
      .A2(1'b0),     // Select[2] input
      .A3(1'b1),     // Select[3] input
		.CLK(CLOCK),   // Clock input
      .D(EV & (EC | NOCOMP))        // SRL data input
		);

   SRL16 #(  // shift register to enable the chisq cut with EV
      .INIT(16'h0000) // Initial Value of Shift Register
   ) SRL_CHICOMP (
      .Q(chicomp_en),       // SRL data output
      .A0(1'b0),     // Select[0] input
      .A1(1'b1),     // Select[1] input
      .A2(1'b1),     // Select[2] input
      .A3(1'b0),     // Select[3] input
		.CLK(CLOCK),   // Clock input
      .D(EV)        // SRL data input
		);

   SRL16 #(  // shift register to track chi overflows
      .INIT(16'h0000) // Initial Value of Shift Register
   ) SRL_CHIOVERFLOW (
      .Q(chi_in_overflow),       // SRL data output
      .A0(1'b0),     // Select[0] input
      .A1(1'b1),     // Select[1] input
      .A2(1'b1),     // Select[2] input
      .A3(1'b0),     // Select[3] input
		.CLK(CLOCK),   // Clock input
      .D(chi_overflow)        // SRL data input
		);
	
	reg chicomp_sample;
	always @(posedge CLOCK)
	begin
		chicomp_sample <= chicomp_en;
	end
	
	wire chicomp_result_part;
	 Chicomparator chicomparator ( // compares the chisq with a fixed cut value
    .a(chisq), // Bus [22 : 0] 
	 .b(cut_value), // Bus [22 : 0] 
    .clk(CLOCK),
    .ce(chicomp_en),  //  comparator enable
    .qa_le_b(chicomp_result_part)); // comparator result
	 
	 assign chi2cut_debug = chisq;
	 assign chi2cut_ce_debug = chicomp_en;
	 
	assign chicomp_result = chicomp_sample & chicomp_result_part;
	
	chisqreg chisqreg0(    // registers chisq
	 .CHISQIN(chisq[chisqcutstart+:CHISQPASSBITS]),
	 .CHISQOUT(chisq_reg0), 
	 .CLOCK(CLOCK), 
	 .CE(1'b1), 
	 .RESET(RESET));
	 
	 
	 chisqreg chisqreg(    // registers chisq that pass the cut
	 .CHISQIN(chisq_reg0),
	 .CHISQOUT(chisq_cutpassed), 
	 .CLOCK(CLOCK), 
//	 .CE(chisq_reg_en), 
	 .CE(chicomp_result), 
	 .RESET(RESET));
//	 
//	 cscope_ila_chi2debug u_cscope_ila_chi2debug (
//		.CLK(CLOCK),
//		.CONTROL(ila_control),
//		.TRIG0(chisq_reg_en),
//		.DATA({chisq_reg_en,chisq,chisq_cutpassed})
//	 );

	wire [2:0] quality_in;
	wire [2:0] quality_shifted;
	qualityROM u_qualityROM(
		.clka(CLOCK),
		.addra({LCMAP,HITMAP}),
		.douta(quality_in)
	);

	comp_quality_shift u_comp_quality_shift(
    .quality(quality_in),
    .clock(CLOCK),
    .quality_shifted(quality_shifted)
	);

	wire [6:0] g_result;
	gfunctionROM u_gfunctionROM(
		.clka(CLOCK),
		.addra({quality_shifted,chisq[2+:10]}),
		.douta(g_result)
	);

	wire g_reset;
	
	wire g_comp_res;
	wire [6:0] g_best_reg;
	wire [6:0] g_best;
	wire [6:0] g_result_tmp;
	assign g_best = g_comp_res ? g_result_tmp : g_best_reg;
	multibit_reg_init #(
		.BITS(7),
		.INIT(7'b1110000)) u_grestmp (
		.d(g_result),
		.q(g_result_tmp),
		.reset(RESET | g_reset),
		.ce(chicomp_result & ~g_reset),
		.clock(CLOCK)
		);

		
	SRL16 #(  // shift register to reset gfunction ref value
      .INIT(16'h0000) // Initial Value of Shift Register
   ) SRL_GREFVALUE (
      .Q(g_reset),       // SRL data output
      .A0(1'b1),     // Select[0] input
      .A1(1'b1),     // Select[1] input
      .A2(1'b1),     // Select[2] input
      .A3(1'b0),     // Select[3] input
		.CLK(CLOCK),   // Clock input
      .D(EV & (EC | NOCOMP))        // SRL data input
	);
	
	reg g_best_noupdate;
	always @(posedge CLOCK)
	begin
		g_best_noupdate <= g_reset;
	end
	
	multibit_reg_init #(
		.BITS(7),
		.INIT(7'b1110000)) u_gresreg (
		.d(g_result_tmp),
		.q(g_best_reg),
		.clock(CLOCK),
		.ce(g_comp_res & ~g_best_noupdate),
		.reset(g_reset)
	);
	
	reg g_comp_res_sample;
	always @(posedge CLOCK)
	begin
		g_comp_res_sample <= chicomp_result;
	end
	wire g_comp_res_part;
	
	comp_gfunc u_comp_gfunc(
		.ce(chicomp_result), 
		.clk(CLOCK),
		.qa_lt_b(g_comp_res_part), 
		.a(g_result),
		.b(g_best)
	);

	assign gfunc_res_debug = g_result;
	assign gfunc_cut_debug = g_best;
	assign gfunc_ce_debug = chicomp_result;

	assign g_comp_res = g_comp_res_part & g_comp_res_sample;
	assign BETTER = g_comp_res;


	reg good_track_present;
	always @(posedge CLOCK)
	begin
		if(g_comp_res)
			good_track_present <= 1'b1;
		else if(endcomp)
			good_track_present <= 1'b0;
		else good_track_present <= good_track_present;
	end

	chisqreg chisq_shifter(    // shifts chisq that pass the cut
	 .CHISQIN(chisq_cutpassed),
	 .CHISQOUT(chisq_better), 
	 .CLOCK(CLOCK), 
	 .CE(g_comp_res), 
	 .RESET(RESET));
	  
	assign BEST_READY = endcomp & good_track_present;
//
//	wire [CHISQPASSBITS-1:0] chisq_temp;
//	
//	chisqreg chisq_shifter(    // shifts chisq that pass the cut
//	 .CHISQIN(chisq_cutpassed),
//	 .CHISQOUT(chisq_temp), 
//	 .CLOCK(CLOCK), 
//	 .CE(1'b1), 
//	 .RESET(RESET));
//	 
//	chisqreg chisq_shifter2(    // shifts chisq that pass the cut
//	 .CHISQIN(chisq_temp),
//	 .CHISQOUT(chisq_shifted), 
//	 .CLOCK(CLOCK), 
//	 .CE(1'b1), 
//	 .RESET(RESET));
//	 
//	 simpleregister chisq_better_rst(
//	 .DIN(endcomp),
//	 .DOUT(chisq_reset),
//	 .CLOCK(CLOCK));
//	 
//	 chisqfull_reg chisq_better_reg(
//	 .CHISQIN(chisq_shifted), 
//	 .CHISQOUT(chisq_better), 
//	 .CLOCK(CLOCK), 
//	 .CE(compg_res), 
//	 .RESET(RESET),
//	 .CLEAN((chisq_reset & ~compg_res)), 
//	 .FULL(chisq_presence));
//	 
	 
/*	 chisqreg chisqbest(   // registers the chisq of the best fit 
	 .CHISQIN(chisq_reg_s),
	 .CHISQOUT(chisq_best), 
	 .CLOCK(CLOCK), 
	 .CE(compg_res), 
	 .RESET(RESET));*/
	 
	 assign chi_best_overflow = (chisq_better == {CHISQPASSBITS{1'b1}});
	 
	 best_chidsq_fifo best_fifo(
    .clk(CLOCK),
    .din(chisq_better), // Bus [10 : 0] 
    .rd_en(READ_CHISQ),
    .rst(RESET),
    .wr_en(BEST_READY),
    .dout(CHISQ_OUT), // Bus [10 : 0] 
    .empty(EMPTY),
    .full(fifo_chisq_full));   //unconnected
	 
//	 
//	 gfunctiontop gfunction(   // provides a goodness parameter based on LCMAP, HITMAP and chisq
//	 .CLOCK(CLOCK), 
//	 .HITMAP(HITMAP), 
//	 .LCMAP(LCMAP), 
//	 .G(g), 
//	 .CHISQ(chisq_cutpassed[0+:CHISQ_GCOMP]),//[CHISQ_GCOMP-1:0]
//	 .READY(g_ready), 
//	 .EN_P(chicomp_en),
//	 .EN_OUT(chisq_reg_en),
//	 .RESET(RESET)	 
//	 );
//	 
//	 comparatorg comparatorg(  // compare the g parameter
//	 .CLOCK(CLOCK), 
//	 .G(g),
//	 .RESULT(compg_res),
//	 .RESET(RESET),
//	 .INITIAL(endcomp),
//	 .EN(g_ready)
//	 );
	 
//	 cscope_ila_comp u_cscope_ila_comp (
//		.CLK(CLOCK),
//		.CONTROL(ila_control),
//		.TRIG0({chisq_reg_en,chicomp_en,g_ready,endcomp,compg_res,chisq_presence,EV}),
//		.DATA({
//			g_best,					// 7
//			quality_shifted,		// 3
//			g_result, 				// 7
//			CHI3,						// 15
//			CHI2,						// 15
//			CHI1,						// 15
//			EV,						// 1
//			chisq_out_sel,			// 2
//			chisq_unit_sel,		// 2
//			chisq,					// 13
//			chisq_cutpassed,		// 11
//			chisq_better,			// 11
//			chicomp_result,		// 1
//			chicomp_en,				// 1
//			EC,						// 1
//			endcomp,					// 1
//			g_comp_res,				// 1
//			good_track_present,	// 1
//			g_reset					// 1
//			})
//	 );
/*	 This is now outside this module
	 parameter_reg_top parameters_reg(  // registers the parameters and puts on output only the bests
	 .CLOCK(CLOCK), 
	 .DIN(par_regin), 
	 .DOUT(par_regout), 
	 .EV(EV),
	 .BEST(compg_res),
	 .RESET(RESET)
	 );
	 */
endmodule
