`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:30:00 04/22/2008 
// Design Name: 
// Module Name:    roadid_pass 
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
//`include "fifo_roadid.v"
//`include "roadid_shiftregister.v"
module roadid_pass(ROADID_IN,CLOCK,CE,last_comb,best,roadid_we,roadid_re,reset,ROADID_OUT,road_errors_in,road_errors_out,fifo_roadid_afull);
	input[20:0] ROADID_IN;           
	input [1:0] road_errors_in;
	input CLOCK;
	input CE; 
	input last_comb;      //It is the roadid read enable
	input roadid_we;
	input reset;
	input best;
	input roadid_re;
	output [20:0] ROADID_OUT;
	output [1:0] road_errors_out;
	output fifo_roadid_afull;
	
reg [20:0] roadid_register;

always @(posedge CLOCK) begin
	if(CE) roadid_register <= ROADID_IN;
end

//wire [20:0] roadid_fifo;

wire [22:0] roadid_track;

//fifo_roadid (fifo fisrt-word fall-through) instantiation  Serve perch�il numero delle comb �variabile     
fifo_roadid u_fifo_roadid_in(
	.clk(CLOCK),
	.din({roadid_register,road_errors_in}),
	.rd_en(last_comb),
	.rst(reset),
	.wr_en(roadid_we),
	.dout(roadid_track),
	.almost_full(fifo_roadid_afull)
//	.empty()
);

fifo_roadid_nofwft u_fifo_roadid_best(
	.clk(CLOCK),
	.din(roadid_track),
	.rd_en(roadid_re),
	.rst(reset),
	.wr_en(best),
	.dout({ROADID_OUT,road_errors_out})
//	.empty()
);

//roadid_shiftregister u_roadid_shiftregister(    // calcolare il numero di clock necessari e farlo
//	 .clk(CLOCK), 
//	 .d(roadid_fifo),
//	 .q(ROADID_OUT)
//	 );
	
endmodule	




/*module roadid_pass(ROADID_IN, ROADID_OUT, CLOCK, EV, SCROLL, CUTPASS, BETTER , BEST, DV, RESET, RE);
    input [20:0] ROADID_IN; 
    input CLOCK, RESET, RE;
    input EV;
    input SCROLL;
    input CUTPASS;
    input BETTER ;
    input BEST;
	 
    output DV;
	 output [20:0] ROADID_OUT;
	 
	 wire [20:0] road1, road_cutpassed, road2, road_better;


tooutput_fifo fifo1(
    .clk(CLOCK),
    .din(ROADID_IN), // Bus [20 : 0] 
    .rd_en(SCROLL),
    .srst(RESET),
    .wr_en(EV),
    .dout(road1), // Bus [20 : 0] 
    .empty(),
    .full());	 
	 
	 info_reg cutpassed_reg(
	 .DIN(road1), 
	 .DOUT(road_cutpassed), 
	 .CE(CUTPASS), 
	 .CLOCK(CLOCK));

roadid_SR cutpassed_shift (
    .d(road_cutpassed), // Bus [20 : 0] 
    .clk(CLOCK),
    .sclr(RESET),
    .q(road2)); // Bus [20 : 0] 
	 
info_reg better_reg(
	 .DIN(road2), 
	 .DOUT(road_better), 
	 .CE(BETTER), 
	 .CLOCK(CLOCK));
	 
tooutput_fifo road_id_best (
    .clk(CLOCK),
    .din(road_better), // Bus [20 : 0] 
    .rd_en(RE),
    .srst(RESET),
    .wr_en(BEST),
    .dout(ROADID_OUT), // Bus [20 : 0] 
    .empty(DV),
    .full());	 



endmodule
*/