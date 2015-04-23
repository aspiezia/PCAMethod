`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Martina Bucciantonio & Francesco Crescioli
// 
// Create Date:    11/11/2008 
// Design Name: 
// Module Name:    top 
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
//`include "fifo_comb.v"
//`include "fifo_ee.v"
//`include "ee_shiftregister.v"

module top(
    input [22:0] data_in_0,
    input [22:0] data_in_1,
    input [22:0] data_in_2,
    input [22:0] data_in_3,
	 input reset_pulsar, 
	 input re,
    input clk, 
	 input ds_0,
	 input ds_1,
	 input ds_2,
	 input ds_3,
	 input [15:0] VMEaddr,
	 inout [31:0] VMEdata,
	 input VMEwrite,
	 input VMEread,
	 input freeze,
	 input mezzanine,
	 input mezzanine_sel,
	 output valid,
	 output locked,
	 output locked_slowclock,
	 output [22:0] data_out,
	 output hold_0,
	 output hold_1,
	 output hold_2,
	 output hold_3,
	 output cdf_error,
	 output svt_error,
	 output lost_sync_err,
// Output for Debug
//	 output makeadd_en_out;
//	 output [13:0] Coeff_VME_bus_out, reg48_out;
//	 output coeff_en_out, coeff_ram_we_out;
	output [19:0] debug
);

	wire clockFX;
	wire clockPulsar;
	wire j3clock;
	
	// holds
	wire [3:0] wedge_enable;
	wire myhold_0;
	wire myhold_1;
	wire myhold_2;
	wire myhold_3;
	assign hold_0 = myhold_0 & wedge_enable[0] & locked;
	assign hold_1 = myhold_1 & wedge_enable[1] & locked;
	assign hold_2 = myhold_2 & wedge_enable[2] & locked;
	assign hold_3 = myhold_3 & wedge_enable[3] & locked;
	
	
	assign debug = 20'h00000;
//////////////////////////////////////////////////////////////////




wire [6:0] daddr;
wire [15:0] dcm_do;
wire [15:0] dcm_di;
wire drst;
wire den;
wire dwe;
wire drdy;
wire pll_slowclock;
wire reset_vme;

mydcm u_mydcm (
	.CLKIN_IN(clk), 
	.RST_IN(reset_vme | drst), 
   .CLKIN_IBUFG_OUT(j3clock), 
   .CLK0_OUT(clockPulsar), 
   .CLKFX_OUT(clockFX), 
   .LOCKED_OUT(locked),
	.DADDR_IN(daddr),
	.DCLK_IN(pll_slowclock),
	.DEN_IN(den),
	.DWE_IN(dwe),
	.DI_IN(dcm_di),
	.DRDY_OUT(drdy),
	.DO_OUT(dcm_do)
	);

// Slow clock
slowclock u_slowclock (
    .CLKIN1_IN(j3clock), 
//    .RST_IN(reset_vme), 
    .CLKOUT0_OUT(pll_slowclock), 
    .LOCKED_OUT(locked_slowclock)
    );

// DCM dynamic freq changer fsm (controlled by VME write)

wire dcm_enable_change;
wire [31:0] dcm_reg;
wire dcm_reg_write;
wire [4:0] dcm_state;
wire [15:0] last_50h;
wire [15:0] last_51h;
wire [15:0] last_41h;

dcm_changefreq_fsm u_dcm_changefreq_fsm(
    .dcm_reg_write(dcm_reg_write),
    .clock(pll_slowclock),
	 .reset(reset_vme),
	 .enable_change(dcm_enable_change),
    .dcm_reg(dcm_reg),
	 .dcm_do(dcm_do),
	 .drdy(drdy),
    .den(den), // should be den
    .dwe(dwe),
    .drst(drst),
    .di(dcm_di),
    .daddr(daddr),
	 .state_out(dcm_state),
	 .last_50h(last_50h),
	 .last_51h(last_51h),
	 .last_41h(last_41h)
);

// Generate a reset on dcm locked
wire reset_dcm;
reg [2:0] reset_shift;
assign reset_dcm = |{reset_shift};
always @(posedge clockFX)
begin
	if(~locked)
		reset_shift <= 3'b111;
	else
		reset_shift <= {reset_shift[1:0],1'b0};
end
// register freeze

wire freeze_reg;

async_input_sync u_freeze_sync(
   .clk(clockFX),
   .async_in(freeze),
   .sync_out(freeze_reg)
);

// register reset_pulsar

wire reset_pulsar_sync;

async_input_sync u_reset_sync(
   .clk(clockFX),
   .async_in(reset_pulsar),
   .sync_out(reset_pulsar_sync)
);

//*****************************************************************************
// new vme and memory block	12.01.09
wire [31:0] local_add_reg;
wire ram_writePulse;
wire ram_readPulse;
wire [755:0] ram_data_bus;

// control register
wire [31:0] control_reg1;
wire ignore_pulsar_freeze;
assign ignore_pulsar_freeze = control_reg1[8];
assign NOCOMP = control_reg1[9];
assign NOCUT = control_reg1[10];
assign dcm_enable_change = control_reg1[11];
wire freeze_w0;
assign wedge_enable = control_reg1[4+:4];
wire runmode;
assign runmode = control_reg1[12];
wire preGB;
//assign preGB = control_reg1[13];
assign preGB = 1'b0;
wire [7:0] gferrormask;
assign gferrormask = control_reg1[14+:8];

// ispy/ospy w0 stuff
wire [8:0] ispy_pos_w0;
wire ispy_overflow_w0;
wire [23:0] ispy_word_w0;
wire [8:0] ispy_addr_w0;
wire ispy_readPulse_w0;
wire ispy_reset_w0;
wire [23:0] ispy_data_w0;

wire [8:0] ospy_pos_w0;
wire ospy_overflow_w0;
wire [23:0] ospy_word_w0;
wire [8:0] ospy_addr_w0;
wire ospy_readPulse_w0;
wire ospy_reset_w0;
wire [23:0] ospy_data_w0;

assign freeze_w0 = control_reg1[0] | (freeze_reg & ~ignore_pulsar_freeze);
// ispy w1 stuff
wire [8:0] ispy_pos_w1;
wire ispy_overflow_w1;
wire [23:0] ispy_word_w1;
wire [8:0] ispy_addr_w1;
wire ispy_readPulse_w1;
wire ispy_reset_w1;
wire [23:0] ispy_data_w1;

wire [8:0] ospy_pos_w1;
wire ospy_overflow_w1;
wire [23:0] ospy_word_w1;
wire [8:0] ospy_addr_w1;
wire ospy_readPulse_w1;
wire ospy_reset_w1;
wire [23:0] ospy_data_w1;

assign freeze_w1 = control_reg1[1] | (freeze_reg & ~ignore_pulsar_freeze);
// ispy w2 stuff
wire [8:0] ispy_pos_w2;
wire ispy_overflow_w2;
wire [23:0] ispy_word_w2;
wire [8:0] ispy_addr_w2;
wire ispy_readPulse_w2;
wire ispy_reset_w2;
wire [23:0] ispy_data_w2;

wire [8:0] ospy_pos_w2;
wire ospy_overflow_w2;
wire [23:0] ospy_word_w2;
wire [8:0] ospy_addr_w2;
wire ospy_readPulse_w2;
wire ospy_reset_w2;
wire [23:0] ospy_data_w2;

assign freeze_w2 = control_reg1[2] | (freeze_reg & ~ignore_pulsar_freeze);
// ispy w3 stuff
wire [8:0] ispy_pos_w3;
wire ispy_overflow_w3;
wire [23:0] ispy_word_w3;
wire [8:0] ispy_addr_w3;
wire ispy_readPulse_w3;
wire ispy_reset_w3;
wire [23:0] ispy_data_w3;

wire [8:0] ospy_pos_w3;
wire ospy_overflow_w3;
wire [23:0] ospy_word_w3;
wire [8:0] ospy_addr_w3;
wire ospy_readPulse_w3;
wire ospy_reset_w3;
wire [23:0] ospy_data_w3;

assign freeze_w3 = control_reg1[3] | (freeze_reg & ~ignore_pulsar_freeze);

// ospy mezzanine stuff
wire [10:0] ospy_pos_mezzanine;
wire ospy_overflow_mezzanine;
wire [23:0] ospy_word_mezzanine;
wire [10:0] ospy_addr_mezzanine;
wire ospy_readPulse_mezzanine;
wire ospy_reset_mezzanine;
wire [23:0] ospy_data_mezzanine;
wire ospy_dv_mezzanine;

assign freeze_ospy_mezzanine = control_reg1[31]  | (freeze_reg & ~ignore_pulsar_freeze);

wire [31:0] gf_status;
assign gf_status[0] = locked;
assign gf_status[1] = freeze;
assign gf_status[31] = NOCOMP;
assign gf_status[30] = NOCUT;

assign gf_status[2] = hold_0;
assign gf_status[3] = hold_1;
assign gf_status[4] = hold_2;
assign gf_status[5] = hold_3;

// w0 status
wire [31:0] w0_status;
wire clear_w0_status;

// w1 status
wire [31:0] w1_status;
wire clear_w1_status;

// w2 status
wire [31:0] w2_status;
wire clear_w2_status;

// w3 status
wire [31:0] w3_status;
wire clear_w3_status;

wire [31:0] sectors;

// chi2
wire [31:0] chi2cut_value;

// phi offsets
wire [31:0] phioffset_w0w1;
wire [31:0] phioffset_w2w3;

// errors
wire [31:0] vme_error_reg;
wire clear_error_reg;
wire [31:0] cdf_error_mask;
wire [31:0] svt_error_mask;

// cdf and svt errors to pulsar

//assign cdf_error = |{(vme_error_reg & cdf_error_mask)};
assign svt_error = |{(vme_error_reg & svt_error_mask)};

gf_vme_interface u_gf_vme_interface (	
	.clk(clockFX),
	.slowclk(pll_slowclock),
	.init(reset_dcm),
	.VMEaddr(VMEaddr),
	.VMEdata(VMEdata),
	.VMEwrite_p(VMEwrite),
	.VMEread_p(VMEread),
	.local_add_reg(local_add_reg),
	.control_reg1(control_reg1), // output
	.ram_writePulse(ram_writePulse),	// output
	.ram_readPulse(ram_readPulse),	// output
	.ram_data_bus(ram_data_bus),
	
	.mezzanine(mezzanine),
	.mezzanine_sel(mezzanine_sel),
	
	.ispy_counter_w0({21'h000000, ~freeze_w0,ispy_overflow_w0,ispy_pos_w0}),
	.ispy_readPulse_w0(ispy_readPulse_w0),
	.ispy_addr_w0(ispy_addr_w0),
	.ispy_word_w0({8'h00,ispy_word_w0}),
	.ispy_reset_w0(ispy_reset_w0),

	.ispy_counter_w1({21'h000000, ~freeze_w1,ispy_overflow_w1,ispy_pos_w1}),
	.ispy_readPulse_w1(ispy_readPulse_w1),
	.ispy_addr_w1(ispy_addr_w1),
	.ispy_word_w1({8'h00,ispy_word_w1}),
	.ispy_reset_w1(ispy_reset_w1),

	.ispy_counter_w2({21'h000000, ~freeze_w2,ispy_overflow_w2,ispy_pos_w2}),
	.ispy_readPulse_w2(ispy_readPulse_w2),
	.ispy_addr_w2(ispy_addr_w2),
	.ispy_word_w2({8'h00,ispy_word_w2}),
	.ispy_reset_w2(ispy_reset_w2),

	.ispy_counter_w3({21'h000000, ~freeze_w3,ispy_overflow_w3,ispy_pos_w3}),
	.ispy_readPulse_w3(ispy_readPulse_w3),
	.ispy_addr_w3(ispy_addr_w3),
	.ispy_word_w3({8'h00,ispy_word_w3}),
	.ispy_reset_w3(ispy_reset_w3),

	.ospy_counter_w0({21'h000000, ~freeze_w0,ospy_overflow_w0,ospy_pos_w0}),
	.ospy_readPulse_w0(ospy_readPulse_w0),
	.ospy_addr_w0(ospy_addr_w0),
	.ospy_word_w0({8'h00,ospy_word_w0}),
	.ospy_reset_w0(ospy_reset_w0),

	.ospy_counter_w1({21'h000000, ~freeze_w1,ospy_overflow_w1,ospy_pos_w1}),
	.ospy_readPulse_w1(ospy_readPulse_w1),
	.ospy_addr_w1(ospy_addr_w1),
	.ospy_word_w1({8'h00,ospy_word_w1}),
	.ospy_reset_w1(ospy_reset_w1),

	.ospy_counter_w2({21'h000000, ~freeze_w2,ospy_overflow_w2,ospy_pos_w2}),
	.ospy_readPulse_w2(ospy_readPulse_w2),
	.ospy_addr_w2(ospy_addr_w2),
	.ospy_word_w2({8'h00,ospy_word_w2}),
	.ospy_reset_w2(ospy_reset_w2),

	.ospy_counter_w3({21'h000000, ~freeze_w3,ospy_overflow_w3,ospy_pos_w3}),
	.ospy_readPulse_w3(ospy_readPulse_w3),
	.ospy_addr_w3(ospy_addr_w3),
	.ospy_word_w3({8'h00,ospy_word_w3}),
	.ospy_reset_w3(ospy_reset_w3),
	
	.ospy_counter_mezzanine({19'h00000, ~freeze_ospy_mezzanine,ospy_overflow_mezzanine,ospy_pos_mezzanine}),
	.ospy_readPulse_mezzanine(ospy_readPulse_mezzanine),
	.ospy_addr_mezzanine(ospy_addr_mezzanine),
	.ospy_word_mezzanine({8'h00,ospy_word_mezzanine}),
	.ospy_reset_mezzanine(ospy_reset_mezzanine),
	
	.gf_status(gf_status),
	
	.dcm_reg(dcm_reg),
	.dcm_reg_write(dcm_reg_write),
	.last_50h({13'h0000,last_51h[3:2],last_41h[2],last_50h}),
	.chi2cut(chi2cut_value),
	.phioffset_w0w1(phioffset_w0w1),
	.phioffset_w2w3(phioffset_w2w3),
	
	.w0_status(w0_status),
	.clear_w0_status(clear_w0_status),
	.w1_status(w1_status),
	.clear_w1_status(clear_w1_status),
	.w2_status(w2_status),
	.clear_w2_status(clear_w2_status),
	.w3_status(w3_status),
	.clear_w3_status(clear_w3_status),
	
	.sectors(sectors),
	
	.cdf_error_mask(cdf_error_mask),
	.svt_error_mask(svt_error_mask),
	.error_reg(vme_error_reg),
	.clear_error_reg(clear_error_reg),
	
	.reset_vme(reset_vme)
);

// RAM W0

wire [755:0] const_data_w0;
wire [12:0] const_addr_w0;
wire [7:0] make_addr_w0;
mem756block #(.mem_selected(8'h01)) u_const_ram_w0 (	
	.clk(clockFX),
	.init(reset_dcm),
	.local_add_reg(local_add_reg),	//input
	.writePulse(ram_writePulse),
	.readPulse(ram_readPulse),
	.const_addr(make_addr_w0), // const addr from make addr
	.const_data(const_data_w0), // const data
	.ram_data_bus(ram_data_bus),
	.tmode(~runmode)
);

mem8block #(.mem_selected(8'h02)) u_makeaddr_ram_w0 (
	.clk(clockFX),
	.init(reset_dcm),
	.local_add_reg(local_add_reg),	//input
	.writePulse(ram_writePulse),
	.readPulse(ram_readPulse),
	.const_addr(make_addr_w0), // const addr to const ram
	.const_full_addr(const_addr_w0), // const addr from serializer
	.ram_data_bus(ram_data_bus),
	.tmode(~runmode)
);


// RAM W1

wire [755:0] const_data_w1;
wire [12:0] const_addr_w1;
wire [7:0] make_addr_w1;
mem756block #(.mem_selected(8'h03)) u_const_ram_w1 (	
	.clk(clockFX),
	.init(reset_dcm),
	.local_add_reg(local_add_reg),	//input
	.writePulse(ram_writePulse),
	.readPulse(ram_readPulse),
	.const_addr(make_addr_w1), // const addr from make addr
	.const_data(const_data_w1), // const data
	.ram_data_bus(ram_data_bus),
	.tmode(~runmode)
);

mem8block #(.mem_selected(8'h04)) u_makeaddr_ram_w1 (
	.clk(clockFX),
	.init(reset_dcm),
	.local_add_reg(local_add_reg),	//input
	.writePulse(ram_writePulse),
	.readPulse(ram_readPulse),
	.const_addr(make_addr_w1), // const addr to const ram
	.const_full_addr(const_addr_w1), // const addr from serializer
	.ram_data_bus(ram_data_bus),
	.tmode(~runmode)
);


// RAM W2

wire [755:0] const_data_w2;
wire [12:0] const_addr_w2;
wire [7:0] make_addr_w2;
mem756block #(.mem_selected(8'h05)) u_const_ram_w2 (	
	.clk(clockFX),
	.init(reset_dcm),
	.local_add_reg(local_add_reg),	//input
	.writePulse(ram_writePulse),
	.readPulse(ram_readPulse),
	.const_addr(make_addr_w2), // const addr from make addr
	.const_data(const_data_w2), // const data
	.ram_data_bus(ram_data_bus),
	.tmode(~runmode)
);

mem8block #(.mem_selected(8'h06)) u_makeaddr_ram_w2 (
	.clk(clockFX),
	.init(reset_dcm),
	.local_add_reg(local_add_reg),	//input
	.writePulse(ram_writePulse),
	.readPulse(ram_readPulse),
	.const_addr(make_addr_w2), // const addr to const ram
	.const_full_addr(const_addr_w2), // const addr from serializer
	.ram_data_bus(ram_data_bus),
	.tmode(~runmode)
);


// RAM W3

wire [755:0] const_data_w3;
wire [12:0] const_addr_w3;
wire [7:0] make_addr_w3;
mem756block #(.mem_selected(8'h07)) u_const_ram_w3 (	
	.clk(clockFX),
	.init(reset_dcm),
	.local_add_reg(local_add_reg),	//input
	.writePulse(ram_writePulse),
	.readPulse(ram_readPulse),
	.const_addr(make_addr_w3), // const addr from make addr
	.const_data(const_data_w3), // const data
	.ram_data_bus(ram_data_bus),
	.tmode(~runmode)
);

mem8block #(.mem_selected(8'h08)) u_makeaddr_ram_w3 (
	.clk(clockFX),
	.init(reset_dcm),
	.local_add_reg(local_add_reg),	//input
	.writePulse(ram_writePulse),
	.readPulse(ram_readPulse),
	.const_addr(make_addr_w3), // const addr to const ram
	.const_full_addr(const_addr_w3), // const addr from serializer
	.ram_data_bus(ram_data_bus),
	.tmode(~runmode)
);


// Input spybuffer

spy_buffer ispy_w0 (
    .data_in(ispy_data_w0),
    .clk(clockFX),
	 .dv(ispy_dv_w0),
    .freeze(freeze_w0),
    .addr(ispy_addr_w0),
    .last_pos(ispy_pos_w0),
    .overflow(ispy_overflow_w0),
    .data_out(ispy_word_w0),
	 .read_enable(ispy_readPulse_w0),
	 .reset(reset_pulsar_sync | ispy_reset_w0)
);


spy_buffer ispy_w1 (
    .data_in(ispy_data_w1),
    .clk(clockFX),
	 .dv(ispy_dv_w1),
    .freeze(freeze_w1),
    .addr(ispy_addr_w1),
    .last_pos(ispy_pos_w1),
    .overflow(ispy_overflow_w1),
    .data_out(ispy_word_w1),
	 .read_enable(ispy_readPulse_w1),
	 .reset(reset_pulsar_sync | ispy_reset_w1)
);


spy_buffer ispy_w2 (
    .data_in(ispy_data_w2),
    .clk(clockFX),
	 .dv(ispy_dv_w2),
    .freeze(freeze_w2),
    .addr(ispy_addr_w2),
    .last_pos(ispy_pos_w2),
    .overflow(ispy_overflow_w2),
    .data_out(ispy_word_w2),
	 .read_enable(ispy_readPulse_w2),
	 .reset(reset_pulsar_sync | ispy_reset_w2)
);


spy_buffer ispy_w3 (
    .data_in(ispy_data_w3),
    .clk(clockFX),
	 .dv(ispy_dv_w3),
    .freeze(freeze_w3),
    .addr(ispy_addr_w3),
    .last_pos(ispy_pos_w3),
    .overflow(ispy_overflow_w3),
    .data_out(ispy_word_w3),
	 .read_enable(ispy_readPulse_w3),
	 .reset(reset_pulsar_sync | ispy_reset_w3)
);


// Output spybuffer

spy_buffer ospy_w0 (
    .data_in(ospy_data_w0),
    .clk(clockFX),
	 .dv(ospy_dv_w0),
    .freeze(freeze_w0),
    .addr(ospy_addr_w0),
    .last_pos(ospy_pos_w0),
    .overflow(ospy_overflow_w0),
    .data_out(ospy_word_w0),
	 .read_enable(ospy_readPulse_w0),
	 .reset(reset_pulsar_sync | ospy_reset_w0)
);

spy_buffer ospy_w1 (
    .data_in(ospy_data_w1),
    .clk(clockFX),
	 .dv(ospy_dv_w1),
    .freeze(freeze_w1),
    .addr(ospy_addr_w1),
    .last_pos(ospy_pos_w1),
    .overflow(ospy_overflow_w1),
    .data_out(ospy_word_w1),
	 .read_enable(ospy_readPulse_w1),
	 .reset(reset_pulsar_sync | ospy_reset_w1)
);

spy_buffer ospy_w2 (
    .data_in(ospy_data_w2),
    .clk(clockFX),
	 .dv(ospy_dv_w2),
    .freeze(freeze_w2),
    .addr(ospy_addr_w2),
    .last_pos(ospy_pos_w2),
    .overflow(ospy_overflow_w2),
    .data_out(ospy_word_w2),
	 .read_enable(ospy_readPulse_w2),
	 .reset(reset_pulsar_sync | ospy_reset_w2)
);


spy_buffer ospy_w3 (
    .data_in(ospy_data_w3),
    .clk(clockFX),
	 .dv(ospy_dv_w3),
    .freeze(freeze_w3),
    .addr(ospy_addr_w3),
    .last_pos(ospy_pos_w3),
    .overflow(ospy_overflow_w3),
    .data_out(ospy_word_w3),
	 .read_enable(ospy_readPulse_w3),
	 .reset(reset_pulsar_sync | ospy_reset_w3)
);


wire fitter_w0_re;
wire fitter_w0_empty;
wire fitter_w0_valid;
wire [22:0] fitter_w0_out;

wire [35:0] ila_control_w0;

wedge_fitter u_fitter_w0(
    .data_in(data_in_0),
    .ds(ds_0),
    .out_re(fitter_w0_re),
    .clock(clockFX),
	 .locked(locked),
	 .control_reg({NOCOMP,NOCUT}),
	 .chi2cut_value(chi2cut_value[0+:13]),
	 .phioffset(phioffset_w0w1[0+:12]),
	 .reset(reset_pulsar_sync),
    .hold(myhold_0),
    .data_out(fitter_w0_out),
    .out_empty(fitter_w0_empty),
	 .out_valid(fitter_w0_valid),
	 .ispy_data(ispy_data_w0),
	 .ispy_dv(ispy_dv_w0),
	 .const_addr(const_addr_w0),
	 .const_data(const_data_w0),
	 .sector(sectors[0+:4]),
	 .preGB(preGB),
	 .gferrormask(gferrormask),
	 .wedge_status(w0_status),
	 .clear_status(clear_w0_status)
//	 ,
//	 .ila_control(ila_control_w0)
    );
	 
wire fitter_w1_re;
wire fitter_w1_empty;
wire fitter_w1_valid;
wire [22:0] fitter_w1_out;

wedge_fitter u_fitter_w1(
    .data_in(data_in_1),
    .ds(ds_1),
    .out_re(fitter_w1_re),
    .clock(clockFX),
	 .locked(locked),
	 .control_reg({NOCOMP,NOCUT}),
	 .chi2cut_value(chi2cut_value[0+:13]),
	 .phioffset(phioffset_w0w1[12+:12]),
	 .reset(reset_pulsar_sync),
    .hold(myhold_1),
    .data_out(fitter_w1_out),
    .out_empty(fitter_w1_empty),
	 .out_valid(fitter_w1_valid),
	 .ispy_data(ispy_data_w1),
	 .ispy_dv(ispy_dv_w1),
	 .const_addr(const_addr_w1),
	 .const_data(const_data_w1),
	 .sector(sectors[4+:4]),
	 .preGB(preGB),
	 .gferrormask(gferrormask),
	 .wedge_status(w1_status),
	 .clear_status(clear_w1_status)
    );
	 
wire fitter_w2_re;
wire fitter_w2_empty;
wire fitter_w2_valid;
wire [22:0] fitter_w2_out;

wedge_fitter u_fitter_w2(
    .data_in(data_in_2),
    .ds(ds_2),
    .out_re(fitter_w2_re),
    .clock(clockFX),
	 .locked(locked),
	 .control_reg({NOCOMP,NOCUT}),
	 .chi2cut_value(chi2cut_value[0+:13]),
	 .phioffset(phioffset_w2w3[0+:12]),
	 .reset(reset_pulsar_sync),
    .hold(myhold_2),
    .data_out(fitter_w2_out),
    .out_empty(fitter_w2_empty),
	 .out_valid(fitter_w2_valid),
	 .ispy_data(ispy_data_w2),
	 .ispy_dv(ispy_dv_w2),
	 .const_addr(const_addr_w2),
	 .const_data(const_data_w2),
	 .sector(sectors[8+:4]),
	 .preGB(preGB),
	 .gferrormask(gferrormask),
 	 .wedge_status(w2_status),
	 .clear_status(clear_w2_status)
    );
	 
wire fitter_w3_re;
wire fitter_w3_empty;
wire fitter_w3_valid;
wire [22:0] fitter_w3_out;

wedge_fitter_debug u_fitter_w3(
    .data_in(data_in_3),
    .ds(ds_3),
    .out_re(fitter_w3_re),
    .clock(clockFX),
	 .locked(locked),
	 .control_reg({NOCOMP,NOCUT}),
	 .phioffset(phioffset_w2w3[12+:12]),
	 .chi2cut_value(chi2cut_value[0+:13]),
	 .reset(reset_pulsar_sync),
    .hold(myhold_3),
    .data_out(fitter_w3_out),
    .out_empty(fitter_w3_empty),
	 .out_valid(fitter_w3_valid),
	 .ispy_data(ispy_data_w3),
	 .ispy_dv(ispy_dv_w3),
	 .const_addr(const_addr_w3),
	 .const_data(const_data_w3),
	 .sector(sectors[12+:4]),
	 .preGB(preGB),
	 .gferrormask(gferrormask),
	 .wedge_status(w3_status),
	 .clear_status(clear_w3_status)
	 ,
	 .ila_control(ila_control_w0)
    );
	 
// Assign error reg from errors in wedge status

// any fifo full, it's sticky inside wedge
//assign vme_error_reg[0] = |{w0_status[0+:10]};
//assign vme_error_reg[1] = |{w1_status[0+:10]};
assign vme_error_reg[2] = |{w2_status[0+:10]};
assign vme_error_reg[3] = |{w3_status[0+:10]};

// combiner overflow, sticky
error_reg u_comb_overflow_w0_err(
    .error(|{w0_status[12+:5]}),
    .out(vme_error_reg[4]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);
error_reg u_comb_overflow_w1_err(
    .error(|{w1_status[12+:5]}),
    .out(vme_error_reg[5]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);
error_reg u_comb_overflow_w2_err(
    .error(|{w2_status[12+:5]}),
    .out(vme_error_reg[6]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);
error_reg u_comb_overflow_w3_err(
    .error(|{w3_status[12+:5]}),
    .out(vme_error_reg[7]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);	 

// data out of order, sticky
error_reg u_data_ooo_w0_err(
    .error(w0_status[17]),
    .out(vme_error_reg[8]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);
error_reg u_data_ooo_w1_err(
    .error(w1_status[17]),
    .out(vme_error_reg[9]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);
error_reg u_data_ooo_w2_err(
    .error(w2_status[17]),
    .out(vme_error_reg[10]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);
error_reg u_data_ooo_w3_err(
    .error(w3_status[17]),
    .out(vme_error_reg[11]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);

// chi overflow, sticky
error_reg u_chi_ovf_w0_err(
    .error(w0_status[19]),
    .out(vme_error_reg[12]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);
error_reg u_chi_ovf_w1_err(
    .error(w1_status[19]),
    .out(vme_error_reg[13]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);
error_reg u_chi_ovf_w2_err(
    .error(w2_status[19]),
    .out(vme_error_reg[14]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);
error_reg u_chi_ovf_w3_err(
    .error(w3_status[19]),
    .out(vme_error_reg[15]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);

// fit overflow, sticky
error_reg u_fit_ovf_w0_err(
    .error(w0_status[20]),
    .out(vme_error_reg[16]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);
error_reg u_fit_ovf_w1_err(
    .error(w1_status[20]),
    .out(vme_error_reg[17]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);
error_reg u_fit_ovf_w2_err(
    .error(w2_status[20]),
    .out(vme_error_reg[18]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);
error_reg u_fit_ovf_w3_err(
    .error(w3_status[20]),
    .out(vme_error_reg[19]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);

// invalid data sticky
error_reg u_invalid_data_w0_err(
    .error(w0_status[21]),
    .out(vme_error_reg[20]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);
error_reg u_invalid_data_w1_err(
    .error(w1_status[21]),
    .out(vme_error_reg[21]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);
error_reg u_invalid_data_w2_err(
    .error(w2_status[21]),
    .out(vme_error_reg[22]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);
error_reg u_invalid_data_w3_err(
    .error(w3_status[21]),
    .out(vme_error_reg[23]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);


// input parity error sticky
error_reg u_in_parity_w0_err(
    .error(w0_status[18]),
    .out(vme_error_reg[24]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);
error_reg u_in_parity_w1_err(
    .error(w1_status[18]),
    .out(vme_error_reg[25]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);
error_reg u_in_parity_w2_err(
    .error(w2_status[18]),
    .out(vme_error_reg[26]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);
error_reg u_in_parity_w3_err(
    .error(w3_status[18]),
    .out(vme_error_reg[27]),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);

// hold sticky errors
error_reg u_hold_w0_err(
	.error(~myhold_0),
	.out(vme_error_reg[28]),
	.clock(clockFX),
	.reset(reset_pulsar_sync | clear_error_reg)
);
error_reg u_hold_w1_err(
	.error(~myhold_1),
	.out(vme_error_reg[29]),
	.clock(clockFX),
	.reset(reset_pulsar_sync | clear_error_reg)
);
error_reg u_hold_w2_err(
	.error(~myhold_2),
	.out(vme_error_reg[30]),
	.clock(clockFX),
	.reset(reset_pulsar_sync | clear_error_reg)
);
error_reg u_hold_w3_err(
	.error(~myhold_3),
	.out(vme_error_reg[31]),
	.clock(clockFX),
	.reset(reset_pulsar_sync | clear_error_reg)
);

// Attach ospy to wedge_fitter outputs

assign ospy_data_w0 = fitter_w0_out;
assign ospy_dv_w0 = fitter_w0_valid;
assign ospy_data_w1 = fitter_w1_out;
assign ospy_dv_w1 = fitter_w1_valid;
assign ospy_data_w2 = fitter_w2_out;
assign ospy_dv_w2 = fitter_w2_valid;
assign ospy_data_w3 = fitter_w3_out;
assign ospy_dv_w3 = fitter_w3_valid;

wire out_we;
wire [1:0] out_mux_sel;
wire buf_we;
reg [22:0] data_out_buf;
reg [22:0] data_out_buf2;
reg [20:0] data_out_ee_comp;

always @(out_mux_sel or fitter_w0_out or fitter_w1_out or fitter_w2_out or fitter_w3_out)
begin
	case(out_mux_sel)
		2'b00: data_out_buf = fitter_w0_out;
		2'b01: data_out_buf = fitter_w1_out;
		2'b10: data_out_buf = fitter_w2_out;
		2'b11: data_out_buf = fitter_w3_out;
	endcase
end
always @(posedge clockFX)
begin
	if(reset_pulsar_sync) data_out_buf2 <= 23'h000000;
	else if(buf_we) data_out_buf2 <= data_out_buf;
	else data_out_buf2 <= data_out_buf2;
end

wire ee_comp_reg_ce;
wire ee_comp_ce;

always @(posedge clockFX)
begin
	if(reset_pulsar_sync) data_out_ee_comp <= 21'h000000;
	else if(ee_comp_reg_ce) 
//		data_out_ee_comp <= data_out_buf2[20:0];
		data_out_ee_comp <= ee_comp_ce ? 
			{{data_out_buf2[20:9] | data_out_ee_comp[20:9]},
				data_out_buf2[8:0]} : data_out_buf2[20:0];
	else data_out_ee_comp <= data_out_ee_comp;
end

wire lost_sync;

ee_comparator u_ee_comparator(
	.sset(reset_pulsar_sync), 
	.ce(ee_comp_ce), 
	.qa_eq_b(lost_sync), 
	.clk(clockFX), 
	.a(data_out_buf2[7:0]), 
	.b(data_out_ee_comp[7:0])
);

reg [1:0] ls_count;
always @(posedge clockFX)
begin
	if (reset_pulsar_sync | lost_sync) ls_count <= 2'b00;
	else if (ee_comp_ce & ~lost_sync) ls_count <= ls_count + 1;
	else ls_count <= ls_count;
end

wire lost_sync3_err;
error_reg u_lost_sync3_err(
    .error(&ls_count),
    .out(lost_sync3_err),
    .clock(clockFX),
    .reset(reset_pulsar_sync)
);

error_reg u_lost_sync_err(
    .error(~lost_sync),
    .out(lost_sync_err),
    .clock(clockFX),
    .reset(reset_pulsar_sync)
);


assign vme_error_reg[0] = lost_sync_err;
assign vme_error_reg[1] = lost_sync3_err;


reg [7:0] ee_tag0;
reg [7:0] ee_tag1;

always @(posedge clockFX)
	if (ee_comp_ce & lost_sync & ~lost_sync_err) ee_tag0 <= data_out_ee_comp[7:0];
	
always @(posedge clockFX)
	if (ee_comp_ce & lost_sync & ~lost_sync_err) ee_tag1 <= data_out_buf2[7:0];
	
assign gf_status[6+:17] = {lost_sync_err,ee_tag1,ee_tag0};

wire fifo_out_hfull;
wire error_out;
wire [3:0] omerger_state;

output_merger_fsm_sync u_out_merger_control (
    .clock(clockFX),
    .reset(reset_pulsar_sync),
    .w0_empty(fitter_w0_empty),
    .w1_empty(fitter_w1_empty),
    .w2_empty(fitter_w2_empty),
    .w3_empty(fitter_w3_empty),
    .w0_valid(fitter_w0_valid),
    .w1_valid(fitter_w1_valid),
    .w2_valid(fitter_w2_valid),
    .w3_valid(fitter_w3_valid),
	 .ee(data_out_buf[22]),
    //.data_word(data_out_buf),
	 .wedge_enable(wedge_enable),
    .w0_re(fitter_w0_re),
    .w1_re(fitter_w1_re),
    .w2_re(fitter_w2_re),
    .w3_re(fitter_w3_re),
    .mux_sel(out_mux_sel),
    .out_we(out_we),
	 .buf_we(buf_we),
	 .error_out(error_out),
	 .ee_comp_reg_ce(ee_comp_reg_ce),
	 .ee_comp_ce(ee_comp_ce),
//	 .lost_sync_reg(~lost_sync),
	 .lost_sync_reg(1'b0), // never stop
	 .fifo_out_hfull(fifo_out_hfull),
	 .state_out(omerger_state)
);
wire [22:0] data_out_buf3;

assign data_out_buf3 = ee_comp_ce ? 
		{data_out_buf2[22:21],{data_out_buf2[20:9] | data_out_ee_comp[20:9]},
			data_out_buf2[8:0]} : data_out_buf2;

//assign data_out_buf3 = data_out_buf2;
////assign data_out_buf3 = (error_out == 1'b1) ? {data_out_ee_comp[22:13],1'b0,1'b0,~lost_sync,1'b0,data_out_ee_comp[8:0]} : data_out_buf2;
//
//wire [22:0] data_out_buf4;
//
//assign data_out_buf4 = (data_out_buf3[22]) ? {data_out_buf3[22:12],4'b0000,data_out_buf3[7:0]} : data_out_buf3;
wire fifo_out_ovf;

wire empty_clkpulsar;
async_input_sync u_sync_out_empty(
   .clk(clockFX),
   .async_in(empty_clkpulsar),
   .sync_out(empty)
);

fifo_out u_fifo_out(
	.din(data_out_buf3),
	.rd_clk(clockPulsar),
 	.rd_en(re),
	.rst(reset_pulsar_sync),
	.wr_clk(clockFX),
//	.wr_en(out_fifo_we),
	.wr_en(out_we | error_out),
	.dout(data_out),
	.empty(empty_clkpulsar),
	.prog_full(fifo_out_hfull),
	.overflow(fifo_out_ovf),
	.valid(valid));

assign gf_status[23] = empty;
assign gf_status[24] = fifo_out_hfull;

wire fifo_out_ovf_err;
error_reg u_fifo_out_ovf_err(
    .error(fifo_out_ovf),
    .out(fifo_out_ovf_err),
    .clock(clockFX),
    .reset(reset_pulsar_sync | clear_error_reg)
);

assign gf_status[25] = fifo_out_ovf_err;

// Mezzanine output spybuffer

assign ospy_data_mezzanine = data_out;
assign ospy_dv_mezzanine = valid;

spy_buffer_11bit ospy_mezzanine (
    .data_in(ospy_data_mezzanine),
    .clk(clockPulsar),
	 .dv(ospy_dv_mezzanine),
    .freeze(freeze_ospy_mezzanine), //
    .addr(ospy_addr_mezzanine), //
    .last_pos(ospy_pos_mezzanine), //
    .overflow(ospy_overflow_mezzanine), //
    .data_out(ospy_word_mezzanine), //
	 .read_enable(ospy_readPulse_mezzanine), //
	 .reset(reset_pulsar_sync | ospy_reset_mezzanine) //
);


///////////////////////////////////////////////////////////////////////	

// Debug
//wire [35:0] control0;

//cscope_icon u_cscope_icon(
// .CONTROL0(ila_control_w0)
//);

//wire [35:0] ila_control_1;
//
//cscope_icon2 u_cscope_icon(
// .CONTROL0(ila_control_w0),
// .CONTROL1(ila_control_1)
//);
//
//wire anyhold = ~myhold_0 | ~myhold_1 | ~myhold_2 | ~myhold_3;
//cscope_ila1 u_cscope_ila1(
//  .CLK(clockFX), 
//  .CONTROL(ila_control_w0), 
//  .TRIG0({anyhold,fifo_out_hfull,fifo_out_ovf,out_we,fitter_w3_re,fitter_w2_re,fitter_w1_re,fitter_w0_re}), 
//  .DATA({
//		fifo_out_ovf,
//		omerger_state,
//		fitter_w3_empty,
//		fitter_w2_empty,
//		fitter_w1_empty,
//		fitter_w0_empty,
//		ee_comp_ce,
//		lost_sync,
//		out_we,
//		data_out_buf2,
//		fitter_w3_valid,
//		fitter_w2_valid,
//		fitter_w1_valid,
//		fitter_w0_valid,
//		fitter_w3_re,
//		fitter_w2_re,
//		fitter_w1_re,
//		fitter_w0_re
//	})
//);
//
//cscope_ila_out u_cscope_ila_out(
//	.CLK(clockPulsar),
//	.CONTROL(ila_control_1),
//	.TRIG0({valid,data_out})
//);

//
//
//cscope_ila_ram756 u_cscope_ram756(
//	.CLK(clockFX),
//	.CONTROL(control0),
//	.TRIG0({ram_readPulse,ram_writePulse}),
//	.DATA({local_add_reg,ram_data_bus,ram_writePulse,ram_readPulse})
//);

//cscope_ila_ramout u_cscope_ram756(
//	.CLK(clockFX),
//	.CONTROL(control0),
//	.TRIG0(const_addr_w0),
//	.DATA({const_addr_w0,make_addr_w0,const_data_w0})
//);


endmodule
