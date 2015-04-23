`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:30:22 02/24/2009 
// Design Name: 
// Module Name:    hitmux_55_to_45 
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
module hitmux_55_to_45(
    input [110:0] comb_in,
	 input last_comb_55,
	 input ee_55,
	 input [11:0] zeta_comb,
	 input xftlast,
    output [109:0] comb_out,
    input [2:0] sel,
	 input is_45
    );
	 
reg [103:0] comb_out_reg;

// {fifo_comb_ee,reg_last_comb,hitreg_empty,out_xft_c,out_xft_phi,out_4,out_3,out_2,out_1,out_0

wire last_comb_45 = (is_45) ? last_comb_55 : 1'b0;

always @(sel or comb_in or last_comb_45 or ee_55 or last_comb_55 or is_45 or xftlast)
begin
	case(sel)
	// comb_in sarebbe fino a 111, ma gli ultimi bit non sono usati dopo
	// ci piazzo xftlast
	3'b001: comb_out_reg = {is_45, ee_55, last_comb_45, 5'b11110, xftlast, comb_in[110:16]};
	3'b010: comb_out_reg = {is_45, ee_55, last_comb_45, 5'b11101, xftlast, comb_in[110:32],comb_in[15:0]};
	3'b011: comb_out_reg = {is_45, ee_55, last_comb_45, 5'b11011, xftlast, comb_in[110:48],comb_in[31:0]};
	3'b100: comb_out_reg = {is_45, ee_55, last_comb_45, 5'b10111, xftlast, comb_in[110:64],comb_in[47:0]};
	3'b101: comb_out_reg = {is_45, ee_55, last_comb_55, 5'b01111, xftlast, comb_in[110:80],comb_in[63:0]};
	default: comb_out_reg = {is_45, ee_55, last_comb_55, 101'h00000000000000000000000000};
	endcase
end

reg [5:0] zeta_addr_reg;
always @(sel or zeta_comb)
begin
	case(sel)
		3'b001: zeta_addr_reg = {zeta_comb[11:9],zeta_comb[5:3]};
		3'b010: zeta_addr_reg = {zeta_comb[11:9],zeta_comb[2:0]};
		3'b011: zeta_addr_reg = {zeta_comb[11:9],zeta_comb[2:0]};
		3'b100: zeta_addr_reg = {zeta_comb[11:9],zeta_comb[2:0]};
		3'b101: zeta_addr_reg = {zeta_comb[8:6],zeta_comb[2:0]};
		default: zeta_addr_reg = {zeta_comb[11:9],zeta_comb[2:0]};
	endcase
end

assign comb_out = {zeta_addr_reg,comb_out_reg};

endmodule
