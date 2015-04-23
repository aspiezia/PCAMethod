`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:10:24 02/17/2009 
// Design Name: 
// Module Name:    wedge_fitter 
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
module wedge_fitter(
    input [22:0] data_in,
    input ds,
    input out_re,
    input clock,
	 input reset,
	 input locked,
	 input [1:0] control_reg,
	 input [12:0] chi2cut_value,
	 input [755:0] const_data,
	 input [11:0] phioffset,
	 input [7:0] gferrormask,
    output hold,
    output [22:0] data_out,
    output out_empty,
	 output out_valid,
	 output [12:0] const_addr,
	 output [23:0] ispy_data,
	 output ispy_dv,
	 output [31:0] wedge_status,
	 input clear_status,
	 input [3:0] sector,
	 input preGB
    );

parameter CHI1WIDTH = 15;
parameter CHI2WIDTH = 15;
parameter CHI3WIDTH = 15;
parameter PHIWIDTH = 14;
parameter DWIDTH = 11;
parameter CWIDTH = 10;

wire [22:0] data_buf;
wire myhold;
wire fin_empty;
wire fifo_in_re;
wire fin_valid;
wire full;
wire track_re;

wire [10:0] fifo_fulls;
assign wedge_status[0+:10] = fifo_fulls;

assign hold = myhold;
wire fifo_in_full;

fifo_top fifo_in(
	.data_in(data_in),
	.data_out(data_buf),
	.ds(ds),
	.hold(myhold),
	.empty(fin_empty),
	.read_enable(fifo_in_re),
	.reset(reset),    //era reset_composite,ora diventa reset
	.clock(clock),    //cambiare il clockFX del codice importato in clock
	.valid(fin_valid),
	.spy_data(ispy_data),
	.spy_dv(ispy_dv),
	.full(fifo_in_full)
	);

assign wedge_status[10] = fin_empty;

error_reg u_fifo_in_full_error(
	.clock(clock),
	.reset(clear_status),
	.error(fifo_in_full),
	.out(fifo_fulls[0])
);

wire parity_in;
parity_data u_parity_data_in(
    .data(data_buf[22:0]),
    .clock(clock),
	 .ce(fin_valid & ~data_buf[22]),
    .reset(data_buf[22]),
    .parity(parity_in)
);

wire fifo_ee_afull;
wire fifo_roadid_afull;
wire fifo_comb_afull;

wire done_1;
wire done_2;

wire input_enable_1;
wire output_enable_1;

wire input_enable_2;
wire output_enable_2;

comb_select_fsm u_comb_select_fsm(
    .clock(clock),
    .reset(reset),
    .done_read(data_buf[21] & fin_valid),
    .done_write(done_1 | done_2),
    .input_enable_1(input_enable_1),
    .output_enable_1(output_enable_1),
    .input_enable_2(input_enable_2),
    .output_enable_2(output_enable_2)
    );

// combiner 1

wire last_comb_1;
wire hreg_we_1;
wire hreg_next_1;
wire hreg_clear_1;
wire hreg_reset_1;
wire roadid_we_1;
wire roadid_ce_1;
wire fifo_comb_ee_1;
wire fifo_comb_we_1;

data_fsm u_data_fsm_1(
	.fifo_in_empty(fin_empty),
	.fifo_in_dv(fin_valid),
	.last_comb(last_comb_1),
	.ep(data_buf[21]),
	.ee(data_buf[22]),
	.dcm_locked(locked),
	.hitreg_we(hreg_we_1),
	.hitreg_next(hreg_next_1),
	.hitreg_clear(hreg_clear_1),
	.hitreg_reset(hreg_reset_1),
   .fifo_ee_afull(fifo_ee_afull),
	.fifo_roadid_afull(fifo_roadid_afull),
   .fifo_in_re(fifo_in_re_1),
	.fifo_comb_full(fifo_comb_afull),
	.roadid_ce(roadid_ce_1),
	.roadid_we(roadid_we_1),
	.fifo_comb_ee(fifo_comb_ee_1),
	.fifo_comb_we(fifo_comb_we_1),
	.input_enable(input_enable_1),
	.output_enable(output_enable_1),
	.done(done_1),
	.reset(reset),
	.clock(clock)
);

wire [5:0] hitreg_empty_1;
wire [5:0] hitreg_overflow_1;
wire [15:0] out_0_1;
wire [15:0] out_1_1;
wire [15:0] out_2_1;
wire [15:0] out_3_1;
wire [15:0] out_4_1;
wire [15:0] out_xft_c_1;
wire [15:0] out_xft_phi_1;
wire [5:0] out_zin_1;
wire [5:0] out_zout_1;

wire data_out_of_order_1;
wire comb_overflow_1;
assign comb_overflow_1 = |{hitreg_overflow_1};

wire xftlast_1;

hitreg u_hitreg_1(
	.clear(hreg_clear_1),
	.reset(hreg_reset_1),
	.gnext(hreg_next_1),
	.din(data_buf),
	.we(hreg_we_1),
	.clock(clock), 
 	.empty(hitreg_empty_1),
	.overflow(hitreg_overflow_1),
	.glast(last_comb_1),
	.xftlast(xftlast_1),
   .out_0(out_0_1),
   .out_1(out_1_1),
   .out_2(out_2_1),
   .out_3(out_3_1),
   .out_4(out_4_1),
   .out_xft_c(out_xft_c_1),
   .out_xft_phi(out_xft_phi_1),
	.zin(out_zin_1),
	.zout(out_zout_1),
	.phioffset(phioffset),
	.out_of_order(data_out_of_order_1)
);


// combiner 2

wire last_comb_2;
wire hreg_we_2;
wire hreg_next_2;
wire hreg_clear_2;
wire hreg_reset_2;
wire roadid_we_2;
wire roadid_ce_2;
wire fifo_comb_ee_2;
wire fifo_comb_we_2;

data_fsm u_data_fsm_2(
	.fifo_in_empty(fin_empty),
	.fifo_in_dv(fin_valid),
	.last_comb(last_comb_2),
	.ep(data_buf[21]),
	.ee(data_buf[22]),
	.dcm_locked(locked),
	.hitreg_we(hreg_we_2),
	.hitreg_next(hreg_next_2),
	.hitreg_clear(hreg_clear_2),
	.hitreg_reset(hreg_reset_2),
   .fifo_ee_afull(fifo_ee_afull),
	.fifo_roadid_afull(fifo_roadid_afull),
   .fifo_in_re(fifo_in_re_2),
	.fifo_comb_full(fifo_comb_afull),
	.roadid_ce(roadid_ce_2),
	.roadid_we(roadid_we_2),
	.fifo_comb_ee(fifo_comb_ee_2),
	.fifo_comb_we(fifo_comb_we_2),
	.input_enable(input_enable_2),
	.output_enable(output_enable_2),
	.done(done_2),
	.reset(reset),
	.clock(clock)
);

wire [5:0] hitreg_empty_2;
wire [5:0] hitreg_overflow_2;
wire [15:0] out_0_2;
wire [15:0] out_1_2;
wire [15:0] out_2_2;
wire [15:0] out_3_2;
wire [15:0] out_4_2;
wire [15:0] out_xft_c_2;
wire [15:0] out_xft_phi_2;
wire [5:0] out_zin_2;
wire [5:0] out_zout_2;

wire data_out_of_order_2;
wire comb_overflow_2;
assign comb_overflow_2 = |{hitreg_overflow_2};

wire xftlast_2;

hitreg u_hitreg_2(
	.clear(hreg_clear_2),
	.reset(hreg_reset_2),
	.gnext(hreg_next_2),
	.din(data_buf),
	.we(hreg_we_2),
	.clock(clock), 
 	.empty(hitreg_empty_2),
	.overflow(hitreg_overflow_2),
	.glast(last_comb_2),
	.xftlast(xftlast_2),
   .out_0(out_0_2),
   .out_1(out_1_2),
   .out_2(out_2_2),
   .out_3(out_3_2),
   .out_4(out_4_2),
   .out_xft_c(out_xft_c_2),
   .out_xft_phi(out_xft_phi_2),
	.zin(out_zin_2),
	.zout(out_zout_2),
	.phioffset(phioffset),
	.out_of_order(data_out_of_order_2)
);


assign wedge_status[12+:5] = hitreg_overflow_1 | hitreg_overflow_2;
assign wedge_status[17] = data_out_of_order_1 | data_out_of_order_2;

wire [5:0] hitreg_empty;
wire [15:0] out_0;
wire [15:0] out_1;
wire [15:0] out_2;
wire [15:0] out_3;
wire [15:0] out_4;
wire [15:0] out_xft_c;
wire [15:0] out_xft_phi;
wire [5:0] out_zin;
wire [5:0] out_zout;
wire fifo_comb_we;
wire fifo_comb_ee;
wire last_comb;

wire xftlast;

reg output_enable_1_a;
reg output_enable_1_b;
always @(posedge clock)
begin
	output_enable_1_a <= output_enable_1;
	output_enable_1_b <= output_enable_1_a;
end

assign hitreg_empty = output_enable_1_b ? hitreg_empty_1 : hitreg_empty_2;
assign out_0 = output_enable_1_b ? out_0_1 : out_0_2;
assign out_1 = output_enable_1_b ? out_1_1 : out_1_2;
assign out_2 = output_enable_1_b ? out_2_1 : out_2_2;
assign out_3 = output_enable_1_b ? out_3_1 : out_3_2;
assign out_4 = output_enable_1_b ? out_4_1 : out_4_2;
assign out_xft_c = output_enable_1_b ? out_xft_c_1 : out_xft_c_2;
assign out_xft_phi = output_enable_1_b ? out_xft_phi_1 : out_xft_phi_2;
assign out_zin = output_enable_1_b ? out_zin_1 : out_zin_2;
assign out_zout = output_enable_1_b ? out_zout_1 : out_zout_2;
assign fifo_comb_we = output_enable_1 ? fifo_comb_we_1 : fifo_comb_we_2;
assign fifo_comb_ee = output_enable_1 ? fifo_comb_ee_1 : fifo_comb_ee_2;
assign last_comb = output_enable_1_a ? last_comb_1 : last_comb_2;
assign xftlast = output_enable_1_a ? xftlast_1 : xftlast_2;

assign fifo_in_re = fifo_in_re_1 | fifo_in_re_2;

wire fifo_ee_re;
wire fifo_ee_empty;
wire [20:0] ee_word;
wire ee_parity_in;
wire fifo_ee_full;

fifo_ee_fw u_fifo_ee(
	.clk(clock),
	.din({parity_in,data_buf[20:0]}),
	.rd_en(fifo_ee_re),
	.rst(reset),
	.wr_en(data_buf[22] & fin_valid),
	.almost_full(fifo_ee_afull),
	.dout({ee_parity_in,ee_word}),
	.empty(fifo_ee_empty),
	.full(fifo_ee_full)
);

assign wedge_status[18] = data_buf[22] & (parity_in == data_buf[8]);

error_reg u_fifo_ee_full_error(
	.clock(clock),
	.reset(clear_status),
	.error(fifo_ee_full),
	.out(fifo_fulls[1])
);


reg fifo_comb_we_a;
reg fifo_comb_we_b;
reg reg_last_comb;
always @(posedge clock)
begin
//	fifo_comb_we0 <= hreg_next & ~last_comb;
	fifo_comb_we_a <= fifo_comb_we;
	fifo_comb_we_b <= fifo_comb_we_a;
	reg_last_comb <= last_comb;
end

wire [131:0] data_hitmux_55;
wire [109:0] data_hitmux_45;
wire fifo_comb_re;
wire fifo_comb_45_we;
wire fifo_comb_empty;
wire fifo_comb_full;

fifo_comb u_fifo_comb (
	.clk(clock),
	.din({out_zout,out_zin,fifo_comb_ee,(reg_last_comb&~fifo_comb_ee),xftlast,hitreg_empty[4:0],out_xft_c,out_xft_phi,out_4,out_3,out_2,out_1,out_0}),
	.rd_en(fifo_comb_re),
	.rst(reset),
	.wr_en(fifo_comb_we_b | fifo_comb_ee),
	.dout(data_hitmux_55),
	.empty(fifo_comb_empty),
	.prog_full(fifo_comb_afull),
	.valid(fifo_comb_valid),
	.full(fifo_comb_full)
	);


error_reg u_fifo_comb_full_error(
	.clock(clock),
	.reset(clear_status),
	.error(fifo_comb_full),
	.out(fifo_fulls[2])
);

wire [2:0] hitmux_55_to_45_sel;
wire fifo_comb_45_full;
wire fifo_comb_45_afull;
wire is_45;
wire invalid_data;

comb_55_to_45_fsm u_comb_55_to_45_fsm(
    .fifo_comb_empty(fifo_comb_empty),
    .fifo_comb_hitmap(~data_hitmux_55[112+:5]),
	 .fifo_comb_ee(data_hitmux_55[119]),
	 .fifo_comb_valid(fifo_comb_valid),
    .hitmux_sel(hitmux_55_to_45_sel),
    .fifo_comb45_we(fifo_comb_45_we),
	 .fifo_comb_re(fifo_comb_re),
    .fifo_comb45_hfull(fifo_comb_45_afull),
	 .is_45(is_45),
    .clock(clock),
    .reset(reset),
	 .invalid_data(invalid_data)
);

assign wedge_status[21] = invalid_data;

hitmux_55_to_45 u_hitmux_55_to_45(
    .comb_in(data_hitmux_55[110:0]),
	 .zeta_comb(data_hitmux_55[120+:12]),
	 .last_comb_55(data_hitmux_55[118]),
	 .ee_55(data_hitmux_55[119]),
	 .xftlast(data_hitmux_55[117]),
    .comb_out(data_hitmux_45),
    .sel(hitmux_55_to_45_sel),
	 .is_45(is_45)
);

wire fifo_comb_45_empty;
wire fifo_comb_45_valid;
wire ser_dv;
wire [109:0] data_out_fifo_45_comb;

wire fifo_comb_45_re;
	
fifo_comb_45 u_fifo_comb_45 (
	.clk(clock),
	.din(data_hitmux_45),
	.rd_en(fifo_comb_45_re),
	.rst(reset),
	.wr_en(fifo_comb_45_we),
	.dout(data_out_fifo_45_comb),
	.empty(fifo_comb_45_empty),
	.prog_full(fifo_comb_45_afull),
	.valid(fifo_comb_45_valid),
	.full(fifo_comb_45_full)
);


error_reg u_fifo_comb_45_full_error(
	.clock(clock),
	.reset(clear_status),
	.error(fifo_comb_45_full),
	.out(fifo_fulls[3])
);

// shift is_45 to gf_status
wire shifted_is_45;

SRLC32E #(
      .INIT(32'h00000000) // Initial Value of Shift Register
   ) shift_valid (
      .Q(shifted_is_45),     // SRL data output
      //.Q31(Q31), // SRL cascade output pin
		// 09113001 - shifted +1
      .A(5'b01100),     // 5-bit shift depth select input - 12 fit_ready+2
      .CE(1'b1),   // Clock enable input
      .CLK(clock), // Clock input
      .D(data_out_fifo_45_comb[103] & fifo_comb_45_valid)      // SRL data input
);

wire shifted_xftlast;

SRLC32E #(
      .INIT(32'h00000000) // Initial Value of Shift Register
   ) shift_xftlast (
      .Q(shifted_xftlast),     // SRL data output
      //.Q31(Q31), // SRL cascade output pin
      .A(5'b01100),     // 5-bit shift depth select input - 12 fit_ready+2
      .CE(1'b1),   // Clock enable input
      .CLK(clock), // Clock input
      .D(data_out_fifo_45_comb[95] & fifo_comb_45_valid)      // SRL data input
);

// data flux bits

wire shifted_ee;
wire shifted_valid;
wire shifted_last_comb;

shift_comb_valid_ee u_shift_comb_valid_ee(
    .clock(clock),
    .valid_in(fifo_comb_45_valid),
    .ee_in(data_out_fifo_45_comb[102]),
	 .last_comb_in(data_out_fifo_45_comb[101]),
    .valid_out(shifted_valid),
    .ee_out(shifted_ee),
	 .last_comb_out(shifted_last_comb)
);

// fitters control

wire fitter1_start;
wire fitter2_start;
wire fitter3_start;
wire fitter4_start;
wire fitter5_start;
wire fitter6_start;

wire [2:0] fit_chi_sel;

wire track_fifos_pfull;
wire data_fifo_hfull;

comb_to_fitters_fsm u_comb_to_fitters_fsm(
    .reset(reset),
    .clock(clock),
    .fifo_comb_empty(fifo_comb_45_empty),
	 .fifo_out_hfull(track_fifos_pfull | data_fifo_hfull),
    .start1(fitter1_start),
	 .start2(fitter2_start),
	 .start3(fitter3_start),
	 .start4(fitter4_start),
	 .start5(fitter5_start),
	 .start6(fitter6_start),
	 .fifo_comb_re(fifo_comb_45_re),
	 .fit_chi_sel(fit_chi_sel)
);

// shift zeta info
wire [5:0] zeta_shifted;
zeta_sr u_zeta_sr(
  .clk(clock), 
  .d(data_out_fifo_45_comb[109:104]), 
  .q(zeta_shifted)
);

// assign const addr from comb

reg [2:0] compact_hitmap;
wire [4:0] hitmap_int = data_out_fifo_45_comb[96+:5];
always @(hitmap_int)
begin
	case(hitmap_int)
	5'b11110:	compact_hitmap <= 3'b000;
	5'b11101:	compact_hitmap <= 3'b001;
	5'b11011:	compact_hitmap <= 3'b010;
	5'b10111:	compact_hitmap <= 3'b011;
	5'b01111:	compact_hitmap <= 3'b100;
	default:		compact_hitmap <= 3'b111;
	endcase
end

assign const_addr = {
	data_out_fifo_45_comb[109:104],
	compact_hitmap,
	data_out_fifo_45_comb[63],
	data_out_fifo_45_comb[47],
	data_out_fifo_45_comb[31],
	data_out_fifo_45_comb[15]};

wire better, best;	
wire ser_ee_1;
wire ser_ee_2;
wire ser_ee_3;
wire ser_ee_4;
wire ser_ee_5;
wire ser_ee_6;

wire fit_ready_1, fit_ready_2, fit_ready_3, fit_ready_4, fit_ready_5, fit_ready_6;
wire fit_ready;
assign fit_ready = fit_ready_1 | fit_ready_2 | fit_ready_3 | fit_ready_4 | fit_ready_5 | fit_ready_6;

parameter HITBITS_SVX = 8;
parameter HITBITS_XFT = 13;

wire [HITBITS_SVX-1:0] hits1_1;
wire [HITBITS_SVX-1:0] hits2_1;
wire [HITBITS_SVX-1:0] hits3_1;
wire [HITBITS_SVX-1:0] hits4_1;
wire [HITBITS_SVX-1:0] hits5_1;
wire [HITBITS_XFT-1:0] hits6_1;
wire [(PHIWIDTH+DWIDTH+CWIDTH-1):0] parameters_1;

wire [HITBITS_SVX-1:0] hits1_2;
wire [HITBITS_SVX-1:0] hits2_2;
wire [HITBITS_SVX-1:0] hits3_2;
wire [HITBITS_SVX-1:0] hits4_2;
wire [HITBITS_SVX-1:0] hits5_2;
wire [HITBITS_XFT-1:0] hits6_2;
wire [(PHIWIDTH+DWIDTH+CWIDTH-1):0] parameters_2;

wire [HITBITS_SVX-1:0] hits1_3;
wire [HITBITS_SVX-1:0] hits2_3;
wire [HITBITS_SVX-1:0] hits3_3;
wire [HITBITS_SVX-1:0] hits4_3;
wire [HITBITS_SVX-1:0] hits5_3;
wire [HITBITS_XFT-1:0] hits6_3;
wire [(PHIWIDTH+DWIDTH+CWIDTH-1):0] parameters_3;

wire [HITBITS_SVX-1:0] hits1_4;
wire [HITBITS_SVX-1:0] hits2_4;
wire [HITBITS_SVX-1:0] hits3_4;
wire [HITBITS_SVX-1:0] hits4_4;
wire [HITBITS_SVX-1:0] hits5_4;
wire [HITBITS_XFT-1:0] hits6_4;
wire [(PHIWIDTH+DWIDTH+CWIDTH-1):0] parameters_4;

wire [HITBITS_SVX-1:0] hits1_5;
wire [HITBITS_SVX-1:0] hits2_5;
wire [HITBITS_SVX-1:0] hits3_5;
wire [HITBITS_SVX-1:0] hits4_5;
wire [HITBITS_SVX-1:0] hits5_5;
wire [HITBITS_XFT-1:0] hits6_5;
wire [(PHIWIDTH+DWIDTH+CWIDTH-1):0] parameters_5;

wire [HITBITS_SVX-1:0] hits1_6;
wire [HITBITS_SVX-1:0] hits2_6;
wire [HITBITS_SVX-1:0] hits3_6;
wire [HITBITS_SVX-1:0] hits4_6;
wire [HITBITS_SVX-1:0] hits5_6;
wire [HITBITS_XFT-1:0] hits6_6;
wire [(PHIWIDTH+DWIDTH+CWIDTH-1):0] parameters_6;

wire [4:0] hitmap_1;
wire [4:0] hitmap_2;
wire [4:0] hitmap_3;
wire [4:0] hitmap_4;
wire [4:0] hitmap_5;
wire [4:0] hitmap_6;

wire [4:0] lcmap_1;
wire [4:0] lcmap_2;
wire [4:0] lcmap_3;
wire [4:0] lcmap_4;
wire [4:0] lcmap_5;
wire [4:0] lcmap_6;

wire [CHI1WIDTH-1:0] chi1_1;
wire [CHI2WIDTH-1:0] chi2_1;
wire [CHI3WIDTH-1:0] chi3_1;

wire [CHI1WIDTH-1:0] chi1_2;
wire [CHI2WIDTH-1:0] chi2_2;
wire [CHI3WIDTH-1:0] chi3_2;

wire [CHI1WIDTH-1:0] chi1_3;
wire [CHI2WIDTH-1:0] chi2_3;
wire [CHI3WIDTH-1:0] chi3_3;

wire [CHI1WIDTH-1:0] chi1_4;
wire [CHI2WIDTH-1:0] chi2_4;
wire [CHI3WIDTH-1:0] chi3_4;

wire [CHI1WIDTH-1:0] chi1_5;
wire [CHI2WIDTH-1:0] chi2_5;
wire [CHI3WIDTH-1:0] chi3_5;

wire [CHI1WIDTH-1:0] chi1_6;
wire [CHI2WIDTH-1:0] chi2_6;
wire [CHI3WIDTH-1:0] chi3_6;

wire fit_overflow_1;
wire fit_overflow_2;
wire fit_overflow_3;
wire fit_overflow_4;
wire fit_overflow_5;
wire fit_overflow_6;

wire chi_overflow_1;
wire chi_overflow_2;
wire chi_overflow_3;
wire chi_overflow_4;
wire chi_overflow_5;
wire chi_overflow_6;

fit_line u_fit_line1(
    .clock(clock),
    .reset(reset),
	 .data_out_fifo_45_comb(data_out_fifo_45_comb[0+:103]),
	 .start(fitter1_start),
	 .in_valid(fifo_comb_45_valid),
	 .const_data(const_data),
	 .ser_ee(ser_ee_1),
	 .hits1(hits1_1),
	 .hits2(hits2_1),
	 .hits3(hits3_1),
	 .hits4(hits4_1),
	 .hits5(hits5_1),
	 .hits6(hits6_1),
	 .parameters(parameters_1),
 	 .chi1_out(chi1_1),
	 .chi2_out(chi2_1),
	 .chi3_out(chi3_1),
	 .hitmap(hitmap_1),
	 .lcmap(lcmap_1),
	 .fit_ready(fit_ready_1),
	 .chi_overflow(chi_overflow_1),
	 .fit_overflow(fit_overflow_1)
//	 ,
//	 .ila_control(ila_control)
);


fit_line u_fit_line2(
    .clock(clock),
    .reset(reset),
	 .data_out_fifo_45_comb(data_out_fifo_45_comb[0+:103]),
	 .start(fitter2_start),
	 .in_valid(fifo_comb_45_valid),
	 .const_data(const_data),
	 .ser_ee(ser_ee_2),
	 .hits1(hits1_2),
	 .hits2(hits2_2),
	 .hits3(hits3_2),
	 .hits4(hits4_2),
	 .hits5(hits5_2),
	 .hits6(hits6_2),
	 .parameters(parameters_2),
 	 .chi1_out(chi1_2),
	 .chi2_out(chi2_2),
	 .chi3_out(chi3_2),
	 .hitmap(hitmap_2),
	 .lcmap(lcmap_2),
 	 .chi_overflow(chi_overflow_2),
	 .fit_overflow(fit_overflow_2),
	 .fit_ready(fit_ready_2)
);


fit_line u_fit_line3(
    .clock(clock),
    .reset(reset),
	 .data_out_fifo_45_comb(data_out_fifo_45_comb[0+:103]),
	 .start(fitter3_start),
	 .in_valid(fifo_comb_45_valid),
	 .const_data(const_data),
	 .ser_ee(ser_ee_3),
	 .hits1(hits1_3),
	 .hits2(hits2_3),
	 .hits3(hits3_3),
	 .hits4(hits4_3),
	 .hits5(hits5_3),
	 .hits6(hits6_3),
	 .parameters(parameters_3),
 	 .chi1_out(chi1_3),
	 .chi2_out(chi2_3),
	 .chi3_out(chi3_3),
	 .hitmap(hitmap_3),
	 .lcmap(lcmap_3),
	 .chi_overflow(chi_overflow_3),
	 .fit_overflow(fit_overflow_3),
	 .fit_ready(fit_ready_3)
);


fit_line u_fit_line4(
    .clock(clock),
    .reset(reset),
	 .data_out_fifo_45_comb(data_out_fifo_45_comb[0+:103]),
	 .start(fitter4_start),
	 .in_valid(fifo_comb_45_valid),
	 .const_data(const_data),
	 .ser_ee(ser_ee_4),
	 .hits1(hits1_4),
	 .hits2(hits2_4),
	 .hits3(hits3_4),
	 .hits4(hits4_4),
	 .hits5(hits5_4),
	 .hits6(hits6_4),
	 .parameters(parameters_4),
 	 .chi1_out(chi1_4),
	 .chi2_out(chi2_4),
	 .chi3_out(chi3_4),
	 .hitmap(hitmap_4),
	 .lcmap(lcmap_4),
	 .chi_overflow(chi_overflow_4),
	 .fit_overflow(fit_overflow_4),
	 .fit_ready(fit_ready_4)
);


fit_line u_fit_line5(
    .clock(clock),
    .reset(reset),
	 .data_out_fifo_45_comb(data_out_fifo_45_comb[0+:103]),
	 .start(fitter5_start),
	 .in_valid(fifo_comb_45_valid),
	 .const_data(const_data),
	 .ser_ee(ser_ee_5),
	 .hits1(hits1_5),
	 .hits2(hits2_5),
	 .hits3(hits3_5),
	 .hits4(hits4_5),
	 .hits5(hits5_5),
	 .hits6(hits6_5),
	 .parameters(parameters_5),
 	 .chi1_out(chi1_5),
	 .chi2_out(chi2_5),
	 .chi3_out(chi3_5),
	 .hitmap(hitmap_5),
	 .lcmap(lcmap_5),
	 .chi_overflow(chi_overflow_5),
	 .fit_overflow(fit_overflow_5),
	 .fit_ready(fit_ready_5)
);


fit_line u_fit_line6(
    .clock(clock),
    .reset(reset),
	 .data_out_fifo_45_comb(data_out_fifo_45_comb[0+:103]),
	 .start(fitter6_start),
	 .in_valid(fifo_comb_45_valid),
	 .const_data(const_data),
	 .ser_ee(ser_ee_6),
	 .hits1(hits1_6),
	 .hits2(hits2_6),
	 .hits3(hits3_6),
	 .hits4(hits4_6),
	 .hits5(hits5_6),
	 .hits6(hits6_6),
	 .parameters(parameters_6),
 	 .chi1_out(chi1_6),
	 .chi2_out(chi2_6),
	 .chi3_out(chi3_6),
	 .hitmap(hitmap_6),
	 .lcmap(lcmap_6),
	 .chi_overflow(chi_overflow_6),
	 .fit_overflow(fit_overflow_6),
	 .fit_ready(fit_ready_6)
);

//wire ser_ee_shift;
//
//ee_shiftregister u_ee_shiftregister(    // calcolare il numero di clock necessari e farlo
//	 .clk(clock), 
//	 .d(ser_ee_1 | ser_ee_2 | ser_ee_3 | ser_ee_4 | ser_ee_5 | ser_ee_6),
//	 .q(ser_ee_shift)
//	 );
//	 

wire [HITBITS_SVX-1:0] hits1_fit;
wire [HITBITS_SVX-1:0] hits2_fit;
wire [HITBITS_SVX-1:0] hits3_fit;
wire [HITBITS_SVX-1:0] hits4_fit;
wire [HITBITS_SVX-1:0] hits5_fit;
wire [HITBITS_XFT-1:0] hits6_fit;
wire [(PHIWIDTH+DWIDTH+CWIDTH-1):0] parameters_fit;

wire [CHI1WIDTH-1:0] chi1_fit;
wire [CHI2WIDTH-1:0] chi2_fit;
wire [CHI3WIDTH-1:0] chi3_fit;

wire [4:0] lcmap;
wire [4:0] hitmap;

wire [0:0] chimux_float;
wire [7:0] hitmux_float;
wire chi_overflow;
wire fit_overflow;

assign wedge_status[19] = chi_overflow;
assign wedge_status[20] = fit_overflow;

mux48_6in_dsp u_chimux(
    .in0({1'h0,fit_overflow_1,chi_overflow_1,chi3_1,chi2_1,chi1_1}),
    .in1({1'h0,fit_overflow_2,chi_overflow_2,chi3_2,chi2_2,chi1_2}),
    .in2({1'h0,fit_overflow_3,chi_overflow_3,chi3_3,chi2_3,chi1_3}),
    .in3({1'h0,fit_overflow_4,chi_overflow_4,chi3_4,chi2_4,chi1_4}),
    .in4({1'h0,fit_overflow_5,chi_overflow_5,chi3_5,chi2_5,chi1_5}),
    .in5({1'h0,fit_overflow_6,chi_overflow_6,chi3_6,chi2_6,chi1_6}),
    .sel(fit_chi_sel),
    .out({chimux_float,fit_overflow,chi_overflow,chi3_fit,chi2_fit,chi1_fit}),
    .clock(clock),
    .reset(reset)
);

mux48_6in_dsp u_bettersmux1(
    .in0({8'h00,hits5_1,hits4_1,hits3_1,hits2_1,hits1_1}),
    .in1({8'h00,hits5_2,hits4_2,hits3_2,hits2_2,hits1_2}),
    .in2({8'h00,hits5_3,hits4_3,hits3_3,hits2_3,hits1_3}),
    .in3({8'h00,hits5_4,hits4_4,hits3_4,hits2_4,hits1_4}),
    .in4({8'h00,hits5_5,hits4_5,hits3_5,hits2_5,hits1_5}),
    .in5({8'h00,hits5_6,hits4_6,hits3_6,hits2_6,hits1_6}),
    .sel(fit_chi_sel),
    .out({hitmux_float,hits5_fit,hits4_fit,hits3_fit,hits2_fit,hits1_fit}),
    .clock(clock),
    .reset(reset)
);

mux48_6in_dsp u_bettersmux2(
    .in0({parameters_1,hits6_1}),
    .in1({parameters_2,hits6_2}),
    .in2({parameters_3,hits6_3}),
    .in3({parameters_4,hits6_4}),
    .in4({parameters_5,hits6_5}),
    .in5({parameters_6,hits6_6}),
    .sel(fit_chi_sel),
    .out({parameters_fit,hits6_fit}),
    .clock(clock),
    .reset(reset)
);

hitlc_mux u_hitlc_mux (
	.clock(clock),
	.sel_chi(fit_chi_sel),
		
	.hitmap_1(hitmap_1),
	.hitmap_2(hitmap_2),
	.hitmap_3(hitmap_3),
	.hitmap_4(hitmap_4),
	.hitmap_5(hitmap_5),
	.hitmap_6(hitmap_6),
	
	.lcmap_1(lcmap_1),
	.lcmap_2(lcmap_2),
	.lcmap_3(lcmap_3),
	.lcmap_4(lcmap_4),
	.lcmap_5(lcmap_5),
	.lcmap_6(lcmap_6),
	
	.hitmap(hitmap),
	.lcmap(lcmap)
	
);

// gf status chain after fits
wire data_ooo_out, comb_overflow_out;
wire [11:0] gfstatus_to_better;
wire [3:0] gfstatus_quality;
wire gfstatus_hitovf = comb_overflow_out;
wire gfstatus_invalid = data_ooo_out;
wire gfstatus_fifo_err = |{fifo_fulls};

badmap u_badmap(
    .badmask(~hitmap | lcmap),
    .status(gfstatus_quality)
);

tfstatus_chipass_sr u_gfstatus_chipass_sr(
	.clk(clock),
	.d({1'b0, // unused
		 fit_overflow, // from fitters
		 gfstatus_fifo_err,
		 gfstatus_invalid, // invalid data from combiner
		 1'b0, // chi overflow, set later by best chi2 selected
		 1'b0, // unused
		 gfstatus_hitovf,  // hits overflow from combiner
		 1'b0, // unused (maybe for 4/5 ?)
//		 shifted_is_45, // unused: 4/5 bit
		 gfstatus_quality // quality bits from combiner
		 }),
	.q(gfstatus_to_better)
);

wire [11:0] gfstatus_better;

hit_reg_new #(12) u_gfstatus_better_reg(
	.DIN(gfstatus_to_better & {gferrormask,4'b1111}),
	.DOUT(gfstatus_better),
	.CLOCK(clock),
	.CE(better),
	.RESET(reset)
);

wire [11:0] gfstatus;
wire fifo_gfstatus_full;
wire chi_best_overflow;

gfstatus_fifo u_gfstatus_fifo(
	.clk(clock),
	.din({gfstatus_better[11:8],chi_best_overflow,gfstatus_better[6:0]}),
	.rd_en(track_re),
	.rst(reset),
	.wr_en(best),
//	almost_full,
	.dout(gfstatus),
//	.empty(hits_empty),
	.full(fifo_gfstatus_full)
	);


//cscope_ila_gfstatus u_cscope_ila_gfstatus (
//	.CLK(clock),
//	.CONTROL(ila_control),
//	.TRIG0({better,best,fit_ready}),
//	.DATA({lcmap,(~hitmap | lcmap),better,fit_ready,gfstatus_to_better})
//);



error_reg u_fifo_gfstatus_error(
	.clock(clock),
	.reset(clear_status),
	.error(fifo_gfstatus_full),
	.out(fifo_fulls[10])
);

// hits chain

wire [59:0] hits_to_better;

wire signed [12:0] realphi;
wire signed [12:0] signed_phi = hits6_fit;
assign realphi = signed_phi + phioffset;

hits_chipass_sr u_hits_chipass_sr(
	.clk(clock),
	.d({
		realphi[3+:10],
		{hitmap[4],lcmap[4],hits5_fit},
		{hitmap[3],lcmap[3],hits4_fit},
		{hitmap[2],lcmap[2],hits3_fit},
		{hitmap[1],lcmap[1],hits2_fit},
		{hitmap[0],lcmap[0],hits1_fit}}),
	.q(hits_to_better)
);


wire [9:0] hits1;
wire [9:0] hits2;
wire [9:0] hits3;
wire [9:0] hits4;
wire [9:0] hits5;
wire [9:0] hits6;

wire [59:0] hits_better;

hit_reg_new #(60) u_hits_better_reg(
	.DIN(hits_to_better),
	.DOUT(hits_better),
	.CLOCK(clock),
	.CE(better),
	.RESET(reset)
);

wire hits_re, hits_empty;
wire fifo_best_hits_full;

best_hits_fifo u_best_hits_fifo(
	.clk(clock),
	.din(hits_better),
	.rd_en(track_re),
	.rst(reset),
	.wr_en(best),
//	almost_full,
	.dout({hits6,hits5,hits4,hits3,hits2,hits1}),
	.empty(hits_empty),
	.full(fifo_best_hits_full)
	);

error_reg u_fifo_best_hits_full_error(
	.clock(clock),
	.reset(clear_status),
	.error(fifo_best_hits_full),
	.out(fifo_fulls[4])
);

// parameters chain

wire [PHIWIDTH+DWIDTH+CWIDTH-4:0] parameters_rounded;

parameters_rounder u_parameters_rounder(
	.parameters_in(parameters_fit),
	.parameters_out(parameters_rounded),
	.clock(clock),
	.reset(reset)
);

wire [PHIWIDTH+CWIDTH+DWIDTH-4:0] parameters_to_better;

parameters_chipass_sr u_parameters_to_chipass_sr(
  .clk(clock), 
  .d(parameters_rounded), 
  .q(parameters_to_better)
);

wire [PHIWIDTH+CWIDTH+DWIDTH-4:0] parameters_better;

hit_reg_new #(PHIWIDTH+CWIDTH+DWIDTH-3) u_parameters_better_reg(
	.DIN(parameters_to_better),
	.DOUT(parameters_better),
	.CLOCK(clock),
	.CE(better),
	.RESET(reset)
);

//cscope_ila_hitsbetter u_cscope_ila_hitsbetter (
//	.CLK(clock),
//	.CONTROL(ila_control),
//	.TRIG0(better),
//	.DATA({better,hits_to_better})
//);

wire [PHIWIDTH+CWIDTH+DWIDTH-4:0] parameters_out;

parameters_fifo best_parameters_fifo (   // fifo with the parameters that corisponds to the best g function
    .clk(clock),
    .din(parameters_better), // Bus [31 : 0] 
    .rd_en(track_re),
    .rst(reset),
    .wr_en(best),
    .dout(parameters_out), // Bus [31 : 0] 
    .empty(par_empty),
    .full(par_fifo_full),
	 .prog_full(track_fifos_pfull)); // here for all track related fifos

error_reg u_fifo_parameters_full_error(
	.clock(clock),
	.reset(clear_status),
	.error(par_fifo_full),
	.out(fifo_fulls[5])
);


wire fit_ready_shifted;

SRLC32E #(
      .INIT(32'h00000000) // Initial Value of Shift Register
   ) u_shift_fit_ready (
      .Q(fit_ready_shifted),     // SRL data output
      //.Q31(Q31), // SRL cascade output pin
      .A(5'b00001),     // 5-bit shift depth select input - 2 dsp mux regs
      .CE(1'b1),   // Clock enable input
      .CLK(clock), // Clock input
      .D(fit_ready)      // SRL data input
);

wire end_comp;
assign end_comp = (shifted_is_45 | (hitmap == 5'b01111)) & (shifted_xftlast | ~preGB);

wire [10:0] chisq;
wire NOCOMP, NOCUT;
wire chisq_empty;

assign NOCOMP = control_reg[1];
assign NOCUT = control_reg[0];

wire fifo_chisq_full;

comparation_top Comparator(
	.CHI1(chi1_fit), 
	.CHI2(chi2_fit), 
	.CHI3(chi3_fit), 
	.chi_overflow(chi_overflow), // cut fail if chi overflowed
	.CLOCK(clock), 
	.LCMAP(lcmap),                 // dall'hits spy sar�lcmap, 5bit
	.HITMAP(hitmap),                // dall'hits spy, idem
	.EV(fit_ready_shifted),        
	.EC(end_comp),         // �EV
	.CHISQ_OUT(chisq), 
	.RESET(reset), 
	.NOCOMP(NOCOMP),
	.BEST_READY(best),       
	.BETTER(better),
	.READ_CHISQ(track_re),   
	.EMPTY(chisq_empty),
	.NOCUT(NOCUT),
	.chi2cut_value(chi2cut_value),
	.fifo_chisq_full(fifo_chisq_full),
	.chi_best_overflow(chi_best_overflow)
//	,
//	.ila_control(ila_control)
);

error_reg u_fifo_chisq_full_error(
	.clock(clock),
	.reset(clear_status),
	.error(fifo_chisq_full),
	.out(fifo_fulls[6])
);

wire [20:0] roadid_out; 

wire data_out_of_order = data_out_of_order_1 | data_out_of_order_2;
wire comb_overflow = comb_overflow_1 | comb_overflow_2;

roadid_pass roadid_select(       ///////////////////////////////////////////////////////////
	.ROADID_IN(data_buf[20:0]),                 
	.ROADID_OUT(roadid_out), 
	.road_errors_in({comb_overflow,data_out_of_order}),
	.CE(roadid_ce_1 | roadid_ce_2),
	.roadid_we(roadid_we_1 | roadid_we_2),
	.last_comb(shifted_last_comb & shifted_valid),
	.best(best),
	.roadid_re(track_re),
	.CLOCK(clock),
	.fifo_roadid_afull(fifo_roadid_afull),
	.road_errors_out({comb_overflow_out, data_ooo_out}),
	.reset(reset)	
);	

//cscope_ila_roadid u_cscope_ila_roadid (
//	.CLK(clock),
//	.CONTROL(ila_control),
//	.TRIG0({roadid_we,best,track_re}),
//	.DATA({fifo_comb_45_re, fifo_comb_45_valid, shifted_last_comb & shifted_valid, roadid_we,data_buf[20:0],roadid_out,comb_overflow_out,data_ooo_out,best,track_re})
//);

wire fifo_out_ovf;

wire [2:0] sel0;
wire [5:0] z;
wire [2:0] sel;
wire [22:0] output_word;
wire ee_out, ep_out;
wire out_fifo_we;

// data flux fifo
wire data_type;
wire data_fifo_empty;
wire data_fifo_re;
wire data_fifo_full;

fifo_data_flux_bits u_data_flux_fifo(
	.clk(clock),
	.din((shifted_ee ? 1'b1 : 1'b0)),
	.rd_en(data_fifo_re),
	.rst(reset),
	.wr_en((shifted_ee & shifted_valid) | (best)),
	.dout(data_type),
	.empty(data_fifo_empty),
	.full(data_fifo_full),
	.prog_full(data_fifo_hfull));

error_reg u_fifo_data_full_error(
	.clock(clock),
	.reset(clear_status),
	.error(data_fifo_full),
	.out(fifo_fulls[7])
);

//cscope_ila_dataflux u_cscope_ila_dataflux (
//	.CLK(clock),
//	.CONTROL(ila_control),
//	.TRIG0({fit_ready,better,best,track_re}),
//	.DATA({
//		zeta_shifted,				// 6
//		hits_to_better,			// 60
//		parameters_to_better, 	// 32
//		better,
//		shifted_ee,
//		shifted_valid,
//		best,
//		data_fifo_re,
//		data_type,
//		track_re})
//);

// zeta fifo
wire fifo_zeta_full;
wire [5:0] zeta_better;

hit_reg_new #(6) u_zeta_better_reg(
	.DIN(zeta_shifted),
	.DOUT(zeta_better),
	.CLOCK(clock),
	.CE(better),
	.RESET(reset)
);
zeta_fifo u_zeta_fifo(
	.clk(clock),
	.din(zeta_better),
	.rd_en(track_re),
	.rst(reset),
	.wr_en(best), // ~shifted_ee is really mandatory?
	.dout(z),
	.empty(),
	.full(fifo_zeta_full)
);

error_reg u_fifo_zeta_full_error(
	.clock(clock),
	.reset(clear_status),
	.error(fifo_zeta_full),
	.out(fifo_fulls[8])
);

wire parity_out;
wire [20:0] ee_word_errors = {ee_word[20:17],
	ee_word[16], // parity error to L2
	ee_word[15], // g-link lost
	ee_word[14], // truncated output
	ee_word[13], // internal overflow
	ee_word[12], // invalid data
	ee_word[11], // | (|{fifo_fulls}), // fifo overflow
	ee_word[10], // lost sync
	ee_word[9], // | (ee_parity_in ^ ee_word[8]), // lost parity
	parity_out, 
	ee_word[7:0] // event tag
	};

formatter formatter_inst(        /////////////////////////////////////////////////////////////////////
	.CLOCK(clock), 
	.IN1({1'b1, 1'b0, z, parameters_out[19+:13]}),                  // 1,0,z,phi
	.IN2({roadid_out[18], roadid_out[17], parameters_out[0+:19]}),  // roadid 18(LC)-17(HP) d, c con segno
	.IN3({sector, roadid_out[0+:17]}),                              // Sector(4bit), road_id 0-16
	.IN4({roadid_out[19], hits2[0+:10], hits1[0+:10]}), // x0 and x1 (8 LSBs of the hit + LC and hit presence bit) 
	.IN5({roadid_out[20], hits4[0+:10], hits3[0+:10]}) , // x2 and x3 (8 LSBs of the hit + LC and hit presence bit)
	.IN6({chisq, hits5[0+:10]}),                                          // x4(8 LSBs of the hit + LC and hit presence bit),
	.IN7({gfstatus, hits6[0+:9]}),                                                //Track Number (9 MSBs of phi from XFT), Track Fitter Status
	.IN8(ee_word_errors),                                                                       // (eeword_out)
	.TRACK_FIFO_RE(track_re), 
	.FIFO_EE_RE(fifo_ee_re),
	.OUT_FIFO_WE(out_fifo_we), 
	.OUT_FIFO_FULL(full), 
	.OUT(output_word),
	.RESET(reset),  
	.DATA_FIFO_EMPTY(data_fifo_empty),
	.DATA_FIFO_RE(data_fifo_re),
	.DATA_TYPE(data_type)
	);

parity_data u_parity_data_out(
    .data(output_word[22:0]),
    .clock(clock),
	 .ce(out_fifo_we),
    .reset(output_word[22]),
    .parity(parity_out)
);

wire fifo_out_full;

fifo_out_wedge u_fifo_out(
	.din(output_word),                //per avere d alla FIFO
	//.rd_clk(clock),
 	.rd_en(out_re),
	.rst(reset),
	//.wr_clk(clock),
	.clk(clock),
	.wr_en(out_fifo_we),
	.dout(data_out),
	.empty(out_empty),
	.prog_full(full),
	.overflow(fifo_out_ovf),
	.valid(out_valid),
	.full(fifo_out_full));

assign wedge_status[11] = out_empty;

error_reg u_fifo_out_full_error(
	.clock(clock),
	.reset(clear_status),
	.error(fifo_out_full),
	.out(fifo_fulls[9])
);


//cscope_ila_fitsync u_cscope_ila_fitsync(
//  .CLK(clock), 
//  .CONTROL(ila_control),
//  .TRIG0({best}),
//  .DATA({
//		hitmap,
//		lcmap,

//		fit_ready_shifted,
//		best,
//		fitter1_start,
//		fitter2_start,
//		fitter3_start,
//		fitter4_start,
//		fitter5_start,
//		fitter6_start,
//		fifo_comb_45_re,
//		fifo_comb_45_empty,
//		fifo_comb_45_valid,
//		fifo_comb_45_afull,
//		data_out_fifo_45_comb			// 110
//  })
//);


endmodule
