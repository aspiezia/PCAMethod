`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:24:27 02/25/2009 
// Design Name: 
// Module Name:    dcm_changefreq_fsm 
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
module dcm_changefreq_fsm(
    input dcm_reg_write,
    input clock,
	 input reset,
    input [31:0] dcm_reg,
	 input [15:0] dcm_do,
	 input drdy,
	 input enable_change,
    output den,
    output dwe,
    output drst,
    output [15:0] di,
    output [6:0] daddr,
	 output [4:0] state_out,
	 output [15:0] last_50h,
	 output [15:0] last_51h,
	 output [15:0] last_41h
    );

parameter READY = 			5'b00000;
parameter READ_50h = 		5'b00001;
parameter WAIT_READ_50h = 	5'b01001;
parameter WRITE_50h = 		5'b00010;
parameter WAIT_WRITE_50h =	5'b01010;
parameter READ_41h = 		5'b00011;
parameter WAIT_READ_41h = 	5'b01011;
parameter WRITE_41h = 		5'b00100;
parameter WAIT_WRITE_41h = 5'b01100;
parameter READ_51h = 		5'b00101;
parameter WAIT_READ_51h = 	5'b01101;
parameter WRITE_51h = 		5'b00111;
parameter WAIT_WRITE_51h =	5'b01111;
parameter READ_00h =			5'b10000;
parameter WAIT_READ_00h = 	5'b10001;

reg [4:0] state;
reg [4:0] next_state;

assign state_out = state;
always @(posedge clock)
begin
	if(reset) state <= READY;
	else state <= next_state;
end

always @(state or dcm_reg_write or drdy or enable_change)
begin
	case(state)
		READY: if(dcm_reg_write & enable_change) next_state <= READ_50h;
		else next_state <= READY;
		
		READ_50h: next_state <= WAIT_READ_50h;
		WRITE_50h: next_state <= WAIT_WRITE_50h;
		READ_41h: next_state <= WAIT_READ_41h;
		WRITE_41h: next_state <= WAIT_WRITE_41h;
		READ_51h: next_state <= WAIT_READ_51h;
		WRITE_51h: next_state <= WAIT_WRITE_51h;
	   READ_00h: next_state <= WAIT_READ_00h;

		WAIT_READ_50h: if (drdy) next_state <= WRITE_50h;
			else next_state <= WAIT_READ_50h;
			
		WAIT_WRITE_50h: if (drdy) next_state <= READ_41h; // should be READ_41h
			else next_state <= WAIT_WRITE_50h;
			
		WAIT_READ_41h: if (drdy) next_state <= WRITE_41h;
			else next_state <= WAIT_READ_41h;
			
		WAIT_WRITE_41h: if (drdy) next_state <= READ_51h;
			else next_state <= WAIT_WRITE_41h;
			
		WAIT_READ_51h: if (drdy) next_state <= WRITE_51h;
			else next_state <= WAIT_READ_51h;
			
		WAIT_WRITE_51h: if (drdy) next_state <= READ_00h;
			else next_state <= WAIT_WRITE_51h;

		WAIT_READ_00h: if (drdy) next_state <= READY;
			else next_state <= WAIT_READ_00h;
			
		default: next_state <= READY;
	endcase
end

reg [15:0] do_reg;
reg [15:0] reg_50h;
reg [15:0] reg_51h;
reg [15:0] reg_41h;
assign last_50h = reg_50h;
assign last_51h = reg_51h;
assign last_41h = reg_41h;


always @(posedge clock)
begin
	if(drdy) begin
		do_reg <= dcm_do;
		if(state == WAIT_READ_50h) reg_50h <= dcm_do;
		else reg_50h <= reg_50h;
		if(state == WAIT_READ_51h) reg_51h <= dcm_do;
		else reg_51h <= reg_51h;
		if(state == WAIT_READ_41h) reg_41h <= dcm_do;
		else reg_41h <= reg_41h;
	end else begin
		do_reg <= do_reg;
		reg_50h <= reg_50h;
		reg_51h <= reg_51h;
		reg_41h <= reg_41h;
	end
end

reg [15:0] di_reg;
assign di = di_reg;

always @(state or do_reg or dcm_reg)
begin
	case (state)
		WRITE_50h: di_reg = dcm_reg[0+:16];
		WRITE_41h: di_reg = {do_reg[15:3],dcm_reg[16],do_reg[1:0]};
		WRITE_51h: di_reg = {do_reg[15:4],dcm_reg[16],dcm_reg[16],do_reg[1:0]};
		default: di_reg = do_reg;
	endcase
end

reg [6:0] daddr_reg;
assign daddr = daddr_reg;

always @(state)
begin
	case (state)
		READY: daddr_reg = 7'h50;
		READ_50h: daddr_reg = 7'h50;
		WAIT_READ_50h: daddr_reg = 7'h50;
		WRITE_50h: daddr_reg = 7'h50;
		WAIT_WRITE_50h: daddr_reg = 7'h41;
		READ_41h: daddr_reg = 7'h41;
		WAIT_READ_41h: daddr_reg = 7'h41;
		WRITE_41h: daddr_reg = 7'h41;
		WAIT_WRITE_41h: daddr_reg = 7'h51;
		READ_51h: daddr_reg = 7'h51;
		WAIT_READ_51h: daddr_reg = 7'h51;
		WRITE_51h: daddr_reg = 7'h51;
		WAIT_WRITE_51h: daddr_reg = 7'h00;
		READ_00h: daddr_reg = 7'h00;
		default: daddr_reg = 7'h00;
	endcase
end

assign den = (state == READ_50h) | (state == WRITE_50h) | (state == READ_41h) | (state == WRITE_41h) | (state == READ_51h) | (state == WRITE_51h) | (state == READ_00h) ;
assign dwe = (state == WRITE_50h) | (state == WRITE_41h) | (state == WRITE_51h);
assign drst = (state == WRITE_50h) | (state == WRITE_41h) | (state == WRITE_51h) | (state == WAIT_WRITE_50h) | (state == WAIT_WRITE_41h) | (state == WAIT_WRITE_51h);


endmodule
