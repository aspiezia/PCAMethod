`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:30:45 10/15/2009 
// Design Name: 
// Module Name:    fifo_in_hold_fsm 
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
module fifo_in_hold_fsm(
    input reset,
    input clock,
    input ee,
    input ep,
    input hold,
    output veto
    );

parameter NORMAL=2'b00;
parameter HOLDING=2'b01;
parameter ONLY_EE=2'b10;

reg [1:0] state;

assign veto = (state == ONLY_EE) & (~ee);

always @(posedge clock)
begin
	if(reset)
	begin
		state <= NORMAL;
	end else begin
		case(state)
			NORMAL:  if(hold) state <= HOLDING;
						else state <= NORMAL;
				
			HOLDING: if(hold)
							if(ep) state <= ONLY_EE;
							else state <= HOLDING;
						else
							state <= NORMAL;
							
			ONLY_EE: if(hold) state <= ONLY_EE;
						else if (ee)
							state <= NORMAL;
						else state <= ONLY_EE;
		endcase
	end
end

endmodule
