`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:29:13 01/13/2009 
// Design Name: 
// Module Name:    spy_buffer 
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
module spy_buffer(
    input [23:0] data_in,
    input clk,
	 input dv,
    input freeze,
    input [8:0] addr,
	 input reset,
	 input read_enable,
    output [8:0] last_pos,
    output overflow,
    output [23:0] data_out
    );

// counter
   reg [8:0] pos;
	reg overflow_reg;
   
   always @(posedge clk)
      if (reset)
         pos <= 0;
      else if (~freeze & dv)
         pos <= pos + 1;
	
	assign last_pos = pos;
	
	// overflow
	
	always @(posedge clk)
      if (reset) begin
         overflow_reg <= 1'b0;
      end else begin
         overflow_reg <= (pos == 9'h1ff) & dv;
      end
		
	assign overflow = overflow_reg;
	
spy_ram u_spy_ram(
	.clka(clk),
	.dina(data_in),
	.addra(pos),
	.wea(~freeze & dv),
	.clkb(clk),
	.addrb(addr),
	.doutb(data_out),
	.enb(read_enable));

endmodule
