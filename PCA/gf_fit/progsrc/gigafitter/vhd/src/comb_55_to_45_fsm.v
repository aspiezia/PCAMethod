`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:05:29 02/24/2009 
// Design Name: 
// Module Name:    comb_55_to_45_fsm 
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
module comb_55_to_45_fsm(
    input fifo_comb_empty,
    input [4:0] fifo_comb_hitmap,
	 input fifo_comb_ee,
	 input fifo_comb_valid,
    output [2:0] hitmux_sel,
    output fifo_comb45_we,
	 output fifo_comb_re,
	 output is_45,
    input fifo_comb45_hfull,
    input clock,
    input reset,
	 output invalid_data
    );

parameter WAIT = 3'b000;
parameter WRITE_1 = 3'b001;
parameter WRITE_2 = 3'b010;
parameter WRITE_3 = 3'b011;
parameter WRITE_4 = 3'b100;
parameter WRITE_5 = 3'b101;

reg [2:0] state = 3'b000;

assign invalid_data = fifo_comb_valid & ~fifo_comb_ee &
					~((fifo_comb_hitmap == 5'b11111) |
					  (fifo_comb_hitmap == 5'b11110) |
					  (fifo_comb_hitmap == 5'b11101) |
					  (fifo_comb_hitmap == 5'b11011) |
					  (fifo_comb_hitmap == 5'b10111) |
					  (fifo_comb_hitmap == 5'b01111) );
 
assign fifo_comb_re = (~fifo_comb_empty & ~fifo_comb45_hfull) & 
	((state == WAIT) |
	 (state == WRITE_5) |
	 ((state == WRITE_1) & (~(fifo_comb_hitmap == 5'b11111) | fifo_comb_ee)));

assign fifo_comb45_we = (~invalid_data) & 
	((state == WRITE_1) |
	 (state == WRITE_2) |
	 (state == WRITE_3) |
	 (state == WRITE_4) |
	 (state == WRITE_5));

/*reg is_45_reg;
always @(posedge clock)
begin
	if (reset) is_45_reg = 1'b0;
	else is_45_reg = ~(fifo_comb_hitmap[0] & fifo_comb_hitmap[1] & fifo_comb_hitmap[2] & fifo_comb_hitmap[3] & fifo_comb_hitmap[4]);
end*/
assign is_45 = ~(fifo_comb_hitmap[0] & fifo_comb_hitmap[1] & fifo_comb_hitmap[2] & fifo_comb_hitmap[3] & fifo_comb_hitmap[4]);

reg [2:0] hitmux_sel_reg;
assign hitmux_sel = hitmux_sel_reg;
always @(state or fifo_comb_hitmap)
begin
	case(state)
		WRITE_1: if(fifo_comb_hitmap == 5'b11101) hitmux_sel_reg = 3'b010;
			else  if(fifo_comb_hitmap == 5'b11011) hitmux_sel_reg = 3'b011;
			else  if(fifo_comb_hitmap == 5'b10111) hitmux_sel_reg = 3'b100;
			else  if(fifo_comb_hitmap == 5'b01111) hitmux_sel_reg = 3'b101;
			else  hitmux_sel_reg = 3'b001;
		WRITE_2: hitmux_sel_reg = 3'b010;
		WRITE_3: hitmux_sel_reg = 3'b011;
		WRITE_4: hitmux_sel_reg = 3'b100;
		WRITE_5: hitmux_sel_reg = 3'b101;		
		default: hitmux_sel_reg = 3'b000;
	endcase
end

always @(posedge clock)
begin
	if(reset) state <= WAIT;
	else case(state)
		WAIT: if (~fifo_comb_empty & ~fifo_comb45_hfull) state <= WRITE_1;
				else state <= WAIT;
				
		WRITE_1: if ((fifo_comb_hitmap == 5'b11111) & ~fifo_comb_ee) state <= WRITE_2;
					else if(~fifo_comb_empty & ~fifo_comb45_hfull) state <= WRITE_1;
					else state <= WAIT;
					
		WRITE_2: state <= WRITE_3;
		WRITE_3: state <= WRITE_4;
		WRITE_4: state <= WRITE_5;
		WRITE_5: if(~fifo_comb_empty & ~fifo_comb45_hfull) state <= WRITE_1;
					else state <= WAIT;
		default: state <= WAIT;		
	endcase
end

endmodule
