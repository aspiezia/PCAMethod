`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:18:17 06/19/2008 
// Design Name: 
// Module Name:    data_fsm 
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
module data_fsm(
    input fifo_in_empty,
    input fifo_in_dv,
    input last_comb,
    input ep,
    input ee,
	 input dcm_locked,
    output hitreg_we,
    output hitreg_next,
    output hitreg_clear,
    output hitreg_reset,
    output fifo_in_re,
	 output roadid_ce,
	 output roadid_we,
	 output fifo_comb_ee,
	 output fifo_comb_we,
	 output done,
	 input fifo_comb_full,
	 input fifo_ee_afull,
	 input fifo_roadid_afull,
	 input input_enable,
	 input output_enable,
    input reset,
    input clock
    );

reg [2:0] state = 3'b000;

parameter RESET 		= 3'b000;
parameter CLEAR		= 3'b001;
parameter READ_EVENT = 3'b010;
parameter START_COMB = 3'b011;
parameter COMB			= 3'b100;
parameter END_EVENT	= 3'b110;
parameter WAIT       = 3'b111;
parameter WAIT_EE		= 3'b101;

assign hitreg_reset = |{(state == RESET), 
								(state == CLEAR),
								(state == START_COMB)};
assign hitreg_clear = |{(state == RESET),
								(state == CLEAR)};
assign hitreg_we = (state == READ_EVENT) & fifo_in_dv & ~ep;
assign hitreg_next = (state == COMB);
assign fifo_in_re = (state == READ_EVENT) & ~fifo_in_empty & ~(ep & fifo_in_dv);
assign roadid_ce = (state == READ_EVENT);
assign roadid_we = (state == START_COMB);
assign fifo_comb_ee = (state == END_EVENT);

//assign fifo_comb_we = ((state == COMB) & ~last_comb) | ((state == WAIT) & last_comb);
assign fifo_comb_we = ((state == COMB) & ~last_comb);

assign done = (state == END_EVENT) | (state == CLEAR);

always @(posedge clock)
begin
	if (reset)
		state <= RESET;
	else
	case(state)
		RESET: 
			if(dcm_locked)
			begin 
				if(input_enable)
				begin
					if(fifo_ee_afull | fifo_roadid_afull | fifo_comb_full) state <= RESET; // was WAIT_EE .. ?
					else state <= READ_EVENT;
				end else state <= RESET;
			end else state <= RESET;

		CLEAR: state <= RESET;

		READ_EVENT: 
			if(fifo_in_dv)
			begin
				if(ep)
				begin
					if(ee)
					begin
						if(output_enable) state <= END_EVENT;
						else state <= WAIT_EE;
					end else begin
						if(~fifo_comb_full) 
						begin
							if(output_enable) state <= START_COMB;
							else state <= WAIT;
						end else state <= WAIT;
					end
				end else state <= READ_EVENT;
			end else state <= READ_EVENT;

		START_COMB: state <= COMB;

		COMB: if(last_comb) state <= CLEAR;
				else state <= COMB;

		END_EVENT: state <= RESET;

		WAIT: 
			if(output_enable)
			begin
				if(~fifo_comb_full) state <= START_COMB;
				else state <= WAIT;
			end else state <= WAIT;

		WAIT_EE: 
			if(output_enable) state <= END_EVENT;
			else state <= WAIT_EE;
			
		default: state <= RESET;
	endcase
end


endmodule
