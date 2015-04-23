`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:44 06/13/2008 
// Design Name: 
// Module Name:    hitmem_memcounter 
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
module hitmem_memcounter(
    input clock,
    input reset,
    input next,
    output [4:0] count,
    output overflow,
    output empty
    );

	reg [5:0] mem;

	assign empty = (mem == 6'b100000);
	assign overflow = (mem == 6'b000000);
	assign count = mem[5:0];

	always @(posedge clock) begin
	if(reset) begin
		mem <= 6'b100000;
	end else if(next & ~overflow) begin
		mem <= mem + 1;
	end
	end
endmodule
