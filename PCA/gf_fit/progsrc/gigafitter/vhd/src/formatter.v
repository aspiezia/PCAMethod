//`include "simpleregister.v" 
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:35:23 04/02/2008 
// Design Name: 
// Module Name:    formatter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: This module fills the output fifo with 
//
//////////////////////////////////////////////////////////////////////////////////
module formatter(CLOCK, IN1, IN2, IN3, IN4 , IN5 , IN6, IN7, IN8, TRACK_FIFO_RE, OUT_FIFO_WE, OUT_FIFO_FULL, OUT, RESET, FIFO_EE_RE, DATA_TYPE, DATA_FIFO_EMPTY, DATA_FIFO_RE);

input CLOCK, OUT_FIFO_FULL, RESET;
input DATA_TYPE, DATA_FIFO_EMPTY;
input [20:0] IN1, IN2, IN3, IN4 , IN5 , IN6, IN7, IN8;

output OUT_FIFO_WE, TRACK_FIFO_RE, FIFO_EE_RE;
output DATA_FIFO_RE;
output [22:0] OUT;

wire [2:0] sel0, sel1;
wire output_we, output_we1, ep_out0, ep_out1, ee_out0, ee_out1, ee_out, ep_out;
wire hits_re;
wire [20:0] data_out;

assign OUT = {ee_out, ep_out, data_out};

formatter_mux output_mux(
	.CLOCK(CLOCK),
 	.IN1(IN1),  // 1,0,z,phi
	.IN2(IN2),  // d, c, roadid 17-18, c, d
  	.IN3(IN3),  // Sector(4bit), road_id 
	.IN4(IN4),  // x0 and x1 (8 LSBs of the hit + LC and hit presence bit)
	.IN5(IN5),  // {roadid_out[20], hitsout[32+:2], hitsout[17+:8], hitsout[15+:2], hitsout[0+:8]}, x2 and x3 (8 LSBs of the hit + LC and hit presence bit)
	.IN6(IN6),  // {chisq, hitsout[15+:2] , hitsout[0+:8]}, x4(8 LSBs of the hit + LC and hit presence bit),
	.IN7(IN7),  // {1'b0, tf_status, hitsout[20+:9]}, Track Number (9 MSBs of phi from XFT), Track Fitter Status
	.IN8(IN8),  // (eeword_out)
	.OUT(data_out),  // (output_word), OUT sono gli output del formatter_mux, da IN8,IN1..IN7
	.SEL(sel1)
	);
	
	// Negedge
	sel_reg select_register(
	.IN(sel0),
	.OUT(sel1), 
	.CLOCK(CLOCK));
		
formatter_control fcontrol(
	.TRACK_FIFO_RE(TRACK_FIFO_RE),  //track_re
	.DATA_FIFO_EMPTY(DATA_FIFO_EMPTY),
	.DATA_FIFO_RE(DATA_FIFO_RE),
	.DATA_TYPE(DATA_TYPE),
	.FIFO_EE_RE(FIFO_EE_RE),
	.EE_OUT(ee_out0),
	.EP_OUT(ep_out0),
	.OUT_FIFO_WE(output_we), 
	.OUT_FIFO_FULL(OUT_FIFO_FULL),
	.SEL(sel0), 
	.RESET(RESET),
	.CLOCK(CLOCK)
	);
	// delay EP_OUT
	simpleregister ep_reg0(
		.CLOCK(CLOCK),
		.DIN(ep_out0), 
		.DOUT(ep_out1)
		);	

   simpleregister ep_reg1(
		.CLOCK(CLOCK),
		.DIN(ep_out1), 
		.DOUT(ep_out)
		);	
	// delay EE_OUT	
	simpleregister ee_reg0(
		.CLOCK(CLOCK),
		.DIN(ee_out0), 
		.DOUT(ee_out1)
		);	

	simpleregister ee_reg1(
		.CLOCK(CLOCK),
		.DIN(ee_out1), 
		.DOUT(ee_out)
		);	


	
simpleregister output_we_reg(
		.CLOCK(CLOCK),
		.DIN(output_we), 
		.DOUT(output_we1)
		);	
		
simpleregister output_we_reg1(
		.CLOCK(CLOCK),
		.DIN(output_we1), 
		.DOUT(OUT_FIFO_WE)
		);	
endmodule
