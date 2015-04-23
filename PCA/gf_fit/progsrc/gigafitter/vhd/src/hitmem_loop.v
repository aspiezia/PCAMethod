`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:12:44 06/13/2008 
// Design Name: 
// Module Name:    hitmem_loop 
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
module hitmem_loop(
    input clock,
    input [4:0] mem,
    input reset,
    input next,
    output [4:0] pos,
    output last
    );

	reg [4:0] count;
	
	assign last = (count == mem-1);
	assign pos = count;
	
	always @(posedge clock) begin
		if(reset) begin
			count <= 5'b00000;
		end else
		if(next) begin
			if(count == (mem-1)) count <= 5'b00000;
			else count <= count + 1;
		end
	end

endmodule
