`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:19:01 04/24/2009 
// Design Name: 
// Module Name:    chisq_unit_fsm 
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
module chisq_unit_fsm(
    input start,
    input reset,
    input clock,
    output [1:0] mux
    );
	 
parameter SEL1 = 2'b00;
parameter SEL2 = 2'b01;
parameter SEL3 = 2'b10;
parameter WAIT = 2'b11;

reg [1:0] state;

always @(posedge clock)
begin
	if (reset)
		state <= WAIT;
	else
	case(state)
		WAIT: if(start) state <= SEL1;
			else state <= WAIT;
		SEL1: state <= SEL2;
		SEL2: state <= SEL3;
		SEL3: if(start) state <= SEL1;
			else state <= WAIT;
		default: state <= WAIT;
	endcase
end

assign mux = state;

	 

endmodule
