`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:24:32 04/14/2009 
// Design Name: 
// Module Name:    comb_to_fitters_fsm 
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
module comb_to_fitters_fsm(
    input reset,
    input clock,
    input fifo_comb_empty,
	 input fifo_out_hfull,
    output start1,
    output start2,
    output start3,
    output start4,
    output start5,
    output start6,
	 output [2:0] fit_chi_sel,
	 output fifo_comb_re
    );

parameter WAIT = 3'b000;
parameter F1 	= 3'b001;
parameter F2 	= 3'b010;
parameter F3 	= 3'b011;
parameter F4	= 3'b100;
parameter F5	= 3'b101;
parameter F6	= 3'b110;
parameter INIT = 3'b111;

reg [2:0] state = INIT;

reg [2:0] last_fitter;

always @(posedge clock)
begin
	if(reset) begin
		state <= INIT;
		last_fitter <= F6;
	end else begin
	(*PARALLEL_CASE*)case(state)
		INIT: begin
			last_fitter <= F6;
			state <= WAIT;
		end

		WAIT: begin
			if(~fifo_comb_empty & ~fifo_out_hfull) begin
			case(last_fitter)
				F1: state <= F2;
				F2: state <= F3;
				F3: state <= F4;
				F4: state <= F5;
				F5: state <= F6;
				F6: state <= F1;
				default: state <= F1;
			endcase
			end else state <= WAIT;
			last_fitter <= last_fitter;
		end
		F1: begin
			if(~fifo_comb_empty & ~fifo_out_hfull) state <= F2;
			else state <= WAIT;
			last_fitter <= F1;
		end
		
		F2: begin
			if(~fifo_comb_empty & ~fifo_out_hfull) state <= F3;
			else state <= WAIT;
			last_fitter <= F2;
		end
		
		F3: begin
			if(~fifo_comb_empty & ~fifo_out_hfull) state <= F4;
			else state <= WAIT;
			last_fitter <= F3;
		end
		
		F4: begin
			if(~fifo_comb_empty & ~fifo_out_hfull) state <= F5;
			else state <= WAIT;
			last_fitter <= F4;
		end
		
		F5: begin
			if(~fifo_comb_empty & ~fifo_out_hfull) state <= F6;
			else state <= WAIT;
			last_fitter <= F5;
		end
		
		F6: begin
			if(~fifo_comb_empty & ~fifo_out_hfull) state <= F1;
			else state <= WAIT;
			last_fitter <= F6;
		end
		
		default: begin 
			state <= INIT;
			last_fitter <= F6;
		end
	endcase
	end
end

assign fifo_comb_re = (state == F1) | (state == F2) | 
	(state == F3) | (state == F4) | (state == F5) | (state == F6);
	
assign start1 = (state == F1);
assign start2 = (state == F2);
assign start3 = (state == F3);
assign start4 = (state == F4);
assign start5 = (state == F5);
assign start6 = (state == F6);

reg [2:0] fit_line_sel_reg;
always @(state)
begin
	case(state)
		F1: fit_line_sel_reg = 3'b000;
		F2: fit_line_sel_reg = 3'b001;
		F3: fit_line_sel_reg = 3'b010;
		F4: fit_line_sel_reg = 3'b011;
		F5: fit_line_sel_reg = 3'b100;
		F6: fit_line_sel_reg = 3'b101;
		default: fit_line_sel_reg = 3'b000;
	endcase
end

// chi sel (and out sel)

SRLC32E #(
      .INIT(32'h00000000) // Initial Value of Shift Register
   ) fit_chi_sel_0 (
      .Q(fit_chi_sel[0]),     // SRL data output
      //.Q31(Q31), // SRL cascade output pin
      .A(5'b01011),     // 5-bit shift depth select input - 12 fit ready +1
      .CE(1'b1),   // Clock enable input
      .CLK(clock), // Clock input
      .D(fit_line_sel_reg[0])      // SRL data input
);

SRLC32E #(
      .INIT(32'h00000000) // Initial Value of Shift Register
   ) fit_chi_sel_1 (
      .Q(fit_chi_sel[1]),     // SRL data output
      //.Q31(Q31), // SRL cascade output pin
      .A(5'b01011),     // 5-bit shift depth select input - 12 fit ready +1
      .CE(1'b1),   // Clock enable input
      .CLK(clock), // Clock input
      .D(fit_line_sel_reg[1])      // SRL data input
);

SRLC32E #(
      .INIT(32'h00000000) // Initial Value of Shift Register
   ) fit_chi_sel_2 (
      .Q(fit_chi_sel[2]),     // SRL data output
      //.Q31(Q31), // SRL cascade output pin
      .A(5'b01011),     // 5-bit shift depth select input - 12 fit ready +1
      .CE(1'b1),   // Clock enable input
      .CLK(clock), // Clock input
      .D(fit_line_sel_reg[2])      // SRL data input
);


endmodule
