`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:48:46 06/17/2009 
// Design Name: 
// Module Name:    parity_data 
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
module parity_data(
    input [22:0] data,
    input clock,
	 input ce,
    input reset,
    output parity
    );

reg parity_int;

always @(posedge clock)
begin
	if(reset) parity_int <= 1'b0;
	else if (ce) parity_int <= (parity_int ^ (^data[22:0]));
	else parity_int <= parity_int;
end

endmodule
