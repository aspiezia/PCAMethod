`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:32:11 06/16/2009 
// Design Name: 
// Module Name:    error_reg 
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
module error_reg(
    error,
    out,
    clock,
    reset
    );

input error;
output out;
input clock;
input reset;

reg out_reg;
assign out = out_reg;

always @(posedge clock)
begin
	if(reset) out_reg <= 1'b0;
	else if(error) out_reg <= 1'b1;
		else out_reg <= out_reg;
end

endmodule
