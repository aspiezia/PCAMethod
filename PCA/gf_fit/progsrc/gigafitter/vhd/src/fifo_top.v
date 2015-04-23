`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:40 02/11/2008 
// Design Name: 
// Module Name:    fifo_top 
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
//`include "fifo_core.v"

module ff_d23(d, clk, q);
	input [22:0] d;
	input clk;
	output [22:0] q;
	
	reg [22:0] q;
	
	always @(posedge clk)
	begin
		q <= d;
	end

endmodule


module fifo_top(data_in, data_out, ds, hold, empty, read_enable, reset, clock, valid, spy_data, spy_dv, full);
    input [22:0] data_in;
    output [22:0] data_out;
    input ds;
    output hold;
	 output valid;
    output empty;
	 input read_enable;
    input reset;
	 input clock;
	 output [23:0] spy_data;
	 output spy_dv;
	 output full;

	wire ihold;
	wire we;
	wire [22:0] dataBuf;
	wire q_ff0;
	assign hold = ~ihold;
	// FDCE: Single Data Rate D Flip-Flop with Asynchronous Clear and
   //       Clock Enable (posedge clk).
   //       All families.
   // Xilinx HDL Language Template, version 9.2.4i
   
   FDCE #(
      .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
   ) u_ff0 (
      .Q(q_ff0),      // Data output
      .C(ds),      // Clock input
      .CE(1'b1),    // Clock enable input
      .CLR(we),  // Asynchronous clear input
      .D(1'b1)       // Data input
   );

   FDCE #(
      .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
   ) u_ff1 (
      .Q(we),      // Data output
      .C(~clock),      // Clock input
      .CE(1'b1),    // Clock enable input
      //.CLR(we),  // Asynchronous clear input
      .D(q_ff0)       // Data input
   );

   // End of FDCE_inst instantiation
	
	ff_d23 u_ff2 ( data_in, clock, dataBuf );
		
//	pll mypll (
//    .CLKIN1_IN(clock), 
//    .RST_IN(reset), 
//    .CLKOUT0_OUT(clock100), 
//    .LOCKED_OUT(locked)
//    );
	
	//assign hold = ~ihold & locked;
	
	// only ee when in hold
	wire veto;
	
	fifo_in_hold_fsm u_fifo_in_hold_fsm(
    .reset(reset),
    .clock(clock),
    .ee(dataBuf[22]),
    .ep(dataBuf[21]),
    .hold(ihold & 1'b0), // disabled
    .veto(veto)
	);
	
	// Fifo Core instantiation
	fifo_core fifo23 (
		.clk(clock),
		.din(dataBuf),
		.rd_en(read_enable),
		.rst(reset),
		.wr_en(we & ~veto),
		.dout(data_out),
		.empty(empty),
		.full(full),
		.prog_full(ihold),
		.valid(valid));

	// spy
	assign spy_data = {~hold, dataBuf};
	assign spy_dv = we & ~veto;
endmodule
