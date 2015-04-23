`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:48:58 06/12/2008 
// Design Name: 
// Module Name:    hitmem 
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
//`include "hitmem_ram.v"
module hitmem(
    input clock,
    input [18:0] din,
    input wren,
    input next,
	 input reset,
	 input clear,
    output empty,
	 output overflow,
    output last,
    output [18:0] dout,
	 // DEBUG
	 output [4:0] mem_out,
	 output [4:0] loop_out,
	 output [4:0] addr_out
    );

reg [18:0] din_buf;
reg [4:0] addr;
reg write;
wire [4:0] mem;
wire [4:0] loop;
wire loop_last;

assign mem_out = mem;
assign loop_out = loop;
assign addr_out = addr;

assign last = loop_last | empty;

hitmem_ram ram(
	.a(addr),
	.d(din_buf),
	.clk(clock),
	.we(write),
	.qspo(dout));

hitmem_memcounter counter(
    .clock(clock),
    .reset(clear),
    .next(wren),
    .count(mem),
    .overflow(overflow),
    .empty(empty)
    );
	 
hitmem_loop looper(
    .clock(clock),
    .mem(mem),
    .reset(reset),
    .next(next),
    .pos(loop),
    .last(loop_last)
    );
	 
always @(posedge clock) begin
	din_buf <= din;
	write <= wren;
	if(wren) addr <= mem;
	else addr <= loop;
end
endmodule
