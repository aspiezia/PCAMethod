`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:42:49 02/17/2009 
// Design Name: 
// Module Name:    output_merger_fsm 
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
module output_merger_fsm_sync(
    input clock,
    input reset,
    input w0_empty,
    input w1_empty,
    input w2_empty,
    input w3_empty,
    input w0_valid,
    input w1_valid,
    input w2_valid,
    input w3_valid,
    input ee,
	 input [3:0] wedge_enable,
	 input lost_sync_reg,
    output w0_re,
    output w1_re,
    output w2_re,
    output w3_re,
    output [1:0] mux_sel,
    output out_we,
	 output ee_comp_reg_ce,
	 output ee_comp_ce,
	 output buf_we,
	 output error_out,
	 input fifo_out_hfull,
	 output [3:0] state_out
    );
	 
parameter START = 4'b0000;
parameter READ_W0 = 4'b0001;
parameter READ_W1 = 4'b0010;
parameter READ_W2 = 4'b0011;
parameter READ_W3 = 4'b0100;
parameter EE = 4'b0101;
parameter ERROR = 4'b0111;
parameter ERROR_OUT = 4'b1000;

reg [3:0] state;
reg [3:0] next_state;

assign state_out = state;

always @(posedge clock)
begin
	if(reset) state <= START;
	else state <= next_state;
end

reg [1:0] mux_sel_reg;
assign mux_sel = mux_sel_reg;
always @(state or mux_sel_reg)
begin
	case(state)
		READ_W0: mux_sel_reg = 2'b00;
		READ_W1: mux_sel_reg = 2'b01;
		READ_W2: mux_sel_reg = 2'b10;
		READ_W3: mux_sel_reg = 2'b11;
		default: mux_sel_reg = 2'b00;
	endcase
end

assign w0_re = ((state == READ_W0) & (~ee | ~w0_valid)) & ~w0_empty & ~fifo_out_hfull;
assign w1_re = ((state == READ_W1) & (~ee | ~w1_valid)) & ~w1_empty & ~fifo_out_hfull;
assign w2_re = ((state == READ_W2) & (~ee | ~w2_valid)) & ~w2_empty & ~fifo_out_hfull;
assign w3_re = ((state == READ_W3) & (~ee | ~w3_valid)) & ~w3_empty & ~fifo_out_hfull;

assign error_out = (state == ERROR_OUT);

reg [2:0] first_veto;
always @(wedge_enable or first_veto)
begin
	case(wedge_enable)
		4'b0010: first_veto = 3'b001;
		4'b0110: first_veto = 3'b001;
		4'b1010: first_veto = 3'b001;
		4'b1110: first_veto = 3'b001;

		4'b0100: first_veto = 3'b010;
		4'b1100: first_veto = 3'b010;

		4'b1000: first_veto = 3'b100;
		default: first_veto = 3'b000;
	endcase
end

reg buf_we_reg;
reg out_we_reg;
reg ee_comp_reg_ce_reg;
//reg ee;
always @(posedge clock)
begin
	buf_we_reg <= w0_re | w1_re | w2_re | w3_re;
	out_we_reg <= (buf_we_reg & ~ee) | (state == EE);
	ee_comp_reg_ce_reg <= (buf_we_reg & ee);
end
assign out_we = out_we_reg;
assign buf_we = buf_we_reg;
assign ee_comp_reg_ce = ee_comp_reg_ce_reg;

wire valid;
assign valid = w0_valid | w1_valid | w2_valid | w3_valid;

reg ee_comp_ce_reg;
always @(posedge clock)
begin
	if(reset) ee_comp_ce_reg = 1'b0;
	else if( (ee & valid) & 
	(((state == READ_W1) & ~first_veto[0]) |
	 ((state == READ_W2) & ~first_veto[1]) |
	 ((state == READ_W3) & ~first_veto[2])))
		ee_comp_ce_reg = 1'b1;
	else
		ee_comp_ce_reg = 1'b0;
end

assign ee_comp_ce = ee_comp_ce_reg;

always @(state or w0_valid or w1_valid or w2_valid or w3_valid or wedge_enable or ee or lost_sync_reg or fifo_out_hfull)
begin
	case(state)
		START: if(wedge_enable[0] & ~fifo_out_hfull) next_state <= READ_W0;
			else if(wedge_enable[1] & ~fifo_out_hfull) next_state <= READ_W1;
			else if(wedge_enable[2] & ~fifo_out_hfull) next_state <= READ_W2;
			else if(wedge_enable[3] & ~fifo_out_hfull) next_state <= READ_W3;
			else next_state <= START;
			
		READ_W0: if(ee & w0_valid) begin
			if (wedge_enable[1]) next_state <= READ_W1;
			else if(wedge_enable[2]) next_state <= READ_W2;
			else if(wedge_enable[3]) next_state <= READ_W3;
			else next_state <= EE; // sara` EE
			end else next_state <= READ_W0;
		
		READ_W1: if(lost_sync_reg) next_state <= ERROR_OUT;
			else if(ee & w1_valid) begin
			if (wedge_enable[2]) next_state <= READ_W2;
			else if(wedge_enable[3]) next_state <= READ_W3;
			else next_state <= EE; // sara` EE
			end else next_state <= READ_W1;
				
		READ_W2: if(lost_sync_reg) next_state <= ERROR_OUT;
		   else if(ee & w2_valid) begin
			if (wedge_enable[3]) next_state <= READ_W3;
			else next_state <= EE; // sara` EE
			end else next_state <= READ_W2;
		
		READ_W3: if(lost_sync_reg) next_state <= ERROR_OUT;
			else if(ee & w3_valid) begin
				next_state <= EE;
			end else next_state <= READ_W3;
		
		EE: if(lost_sync_reg) next_state <= ERROR_OUT;
			else if(wedge_enable[0] & ~fifo_out_hfull) next_state <= READ_W0;
			else if(wedge_enable[1] & ~fifo_out_hfull) next_state <= READ_W1;
			else if(wedge_enable[2] & ~fifo_out_hfull) next_state <= READ_W2;
			else if(wedge_enable[3] & ~fifo_out_hfull) next_state <= READ_W3;
			else next_state <= START;
		
		ERROR_OUT: next_state <= ERROR;
		ERROR: next_state <= ERROR;
		
		default: next_state <= START;
	endcase
end

endmodule
