`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:02:47 07/12/2009 
// Design Name: 
// Module Name:    hitmap_lcmap_shift 
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
module hitmap_lcmap_shift(
	lcmap_in,
	hitmap_in,
	hitmap_out,
	lcmap_out,
	clock,
	ce,
	reset);
	
	input [4:0] lcmap_in;
	input [4:0] hitmap_in;
	output [4:0] hitmap_out;
	output [4:0] lcmap_out;
	input clock;
	input ce;
	input reset;

	wire [4:0] hitmap_copy1;
	wire [4:0] lcmap_copy1;

	 hit_reg_new #(5) hitmap_reg_copy1(
	  .DIN(hitmap_in), 
	  .DOUT(hitmap_copy1), 
	  .CLOCK(clock), 
	  .CE(ce),
	  .RESET(reset)
	 );
	 
	hit_reg_new #(5) lcmap_reg_copy1(
	  .DIN(lcmap_in), 
	  .DOUT(lcmap_copy1), 
	  .CLOCK(clock), 
	  .CE(ce),
	  .RESET(reset)
	 );

wire ce_copy1;
reg [3:0] shift_copy1;
assign ce_copy1 = shift_copy1[3];
always @(posedge clock)
begin
	if(reset) shift_copy1 <= 4'b0000;
	else shift_copy1 <= {shift_copy1[0+:3],ce};
end

	 hit_reg_new #(5) hitmap_reg_out(
	  .DIN(hitmap_copy1), 
	  .DOUT(hitmap_out), 
	  .CLOCK(clock), 
	  .CE(ce_copy1),
	  .RESET(reset)
	 );
	 
	hit_reg_new #(5) lcmap_reg_out(
	  .DIN(lcmap_copy1), 
	  .DOUT(lcmap_out), 
	  .CLOCK(clock), 
	  .CE(ce_copy1),
	  .RESET(reset)
	 );

endmodule
