`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:45:26 04/24/2009 
// Design Name: 
// Module Name:    chisq_units_mux_fsm 
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
module chisq_units_mux_fsm(
    input ev,
    input clock,
    input reset,
    output [1:0] sel_unit_in,
    output [1:0] sel_unit_out
    );

parameter SEL1 = 2'b00;
parameter SEL2 = 2'b01;
parameter SEL3 = 2'b10;

reg [1:0] state;

always @(posedge clock)
begin
	if(reset)
		state <= SEL1;
	else
	(* PARALLEL_CASE *)case(state)
		SEL1: if(ev) state <= SEL2;
			else state <= SEL1;
		SEL2: if(ev) state <= SEL3;
			else state <= SEL2;
		SEL3: if(ev) state <= SEL1;
			else state <= SEL3;
		default: state <= SEL1;
	endcase
end

assign sel_unit_in = state;

SRL16 #(  // shift register to enable the chisq cut with EV
      .INIT(16'h0000) // Initial Value of Shift Register
   ) SRL_in_out_0 (
      .Q(sel_unit_out[0]),       // SRL data output
      .A0(1'b0),     // Select[0] input
      .A1(1'b1),     // Select[1] input
      .A2(1'b1),     // Select[2] input
      .A3(1'b0),     // Select[3] input
		.CLK(clock),   // Clock input
      .D(sel_unit_in[0])        // SRL data input
);
SRL16 #(  // shift register to enable the chisq cut with EV
      .INIT(16'h0000) // Initial Value of Shift Register
   ) SRL_in_out_1 (
      .Q(sel_unit_out[1]),       // SRL data output
      .A0(1'b0),     // Select[0] input
      .A1(1'b1),     // Select[1] input
      .A2(1'b1),     // Select[2] input
      .A3(1'b0),     // Select[3] input
		.CLK(clock),   // Clock input
      .D(sel_unit_in[1])        // SRL data input
);

endmodule
