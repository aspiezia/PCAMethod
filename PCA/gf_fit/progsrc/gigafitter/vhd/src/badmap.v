`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:58:31 06/17/2009 
// Design Name: 
// Module Name:    badmap 
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
module badmap(
    input [4:0] badmask,
    output [3:0] status
    );

reg [3:0] status_reg;
assign status = status_reg;

always @(badmask)
begin
	case(badmask)
		5'b00000: status_reg = 4'h0;
		5'b00001: status_reg = 4'h5;
		5'b00010: status_reg = 4'h4;
		5'b00011: status_reg = 4'he;
		5'b00100: status_reg = 4'h3;
		5'b00101: status_reg = 4'he;
		5'b00110: status_reg = 4'hb;
		5'b01000: status_reg = 4'h2;
		5'b01001: status_reg = 4'hd;
		5'b01010: status_reg = 4'ha;
		5'b01100: status_reg = 4'h8;
		5'b10000: status_reg = 4'h1;
		5'b10001: status_reg = 4'hc;
		5'b10010: status_reg = 4'h8; // or 9?
		5'b10100: status_reg = 4'h7;
		5'b11000: status_reg = 4'h6;
		default: status_reg = 4'hf;
	endcase
end
endmodule
