`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:01:18 23/10/2008 
// Design Name: 
// Module Name:    dspcontrol 
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
module dspcontrol(RESET, CLOCK, DV, EV, MODECP, FREEZE, DVout);

parameter STANDBY  =  2'b00; //
parameter SUMC    =  2'b01; //
parameter SUMP =  2'b10;	
parameter WAIT = 2'b11;
input CLOCK, RESET, DV, EV;
output DVout, MODECP, FREEZE;
reg [1:0] next_state;
reg [1:0] state = STANDBY;
reg modemem;
wire DVout, FREEZE,MODECP;

assign DVout = EV && DV;
assign MODECP = (state == SUMC) || ((state == WAIT) && (modemem == 1'b1));
assign FREEZE = ~DV && !(state == STANDBY);
assign state_out = state;

always @(posedge CLOCK)
begin
	modemem <= MODECP;
end



always @(posedge CLOCK)
		begin
		if (RESET)
		begin
		state = STANDBY;
		end
		else
		state = next_state;
		end

always @(state or DV or EV)
		begin
		
		case (state)
       
		STANDBY: begin
				if (DV) next_state = SUMC;
				else next_state = STANDBY;
				end	
		SUMC: begin
				  if (DV)next_state = SUMP;
				  else next_state = WAIT;					
				end	
		SUMP: begin if (DV && !EV) next_state	= SUMP;
				 else if (DV && EV) next_state = STANDBY;
				 else next_state = WAIT;
				 end
				 
		WAIT: begin
				if (DV && !EV) next_state = SUMP;
				else if (DV && EV) next_state = STANDBY;
				else next_state = WAIT;
				end
		default: next_state = STANDBY;
		endcase
		end
endmodule