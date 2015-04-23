`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:31:39 08/10/2009 
// Design Name: 
// Module Name:    comb_select_fsm 
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
module comb_select_fsm(
    input clock,
    input reset,
    input done_read,
    input done_write,
    output input_enable_1,
    output output_enable_1,
    output input_enable_2,
    output output_enable_2
    );

parameter A = 1'b1;
parameter B = 1'b0;

reg state_input;

assign input_enable_1 = (state_input == A);
assign input_enable_2 = (state_input == B);

always @(posedge clock)
begin
	if (reset)
		state_input <= A;
	else
	(* PARALLEL_CASE *)case(state_input)
		A: if (done_read) state_input <= B;
			else state_input <= A;

		B: if (done_read) state_input <= A;
			else state_input <= B;
	endcase
end

reg state_output;

assign output_enable_1 = (state_output == A);
assign output_enable_2 = (state_output == B);

always @(posedge clock)
begin
	if (reset)
		state_output <= A;
	else
	(* PARALLEL_CASE *)case(state_output)
		A: if (done_write) state_output <= B;
			else state_output <= A;

		B: if (done_write) state_output <= A;
			else state_output <= B;
	endcase
end

endmodule
