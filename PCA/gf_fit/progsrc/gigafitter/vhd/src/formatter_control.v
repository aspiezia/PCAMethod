`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:24:23 04/03/2008 
// Design Name: 
// Module Name:    formatter_control 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: This is a state machine with a state for each word that must be latched on output
//								It is controlled by the EMPTY of the input fifo, the full of the output fifo and by the
//								the EE & EP bits.
//////////////////////////////////////////////////////////////////////////////////
module formatter_control(TRACK_FIFO_RE, FIFO_EE_RE, OUT_FIFO_WE, SEL, RESET, CLOCK, EE_OUT, EP_OUT, DATA_TYPE, DATA_FIFO_EMPTY, DATA_FIFO_RE, OUT_FIFO_FULL);

  	parameter WAIT = 4'b0000;
	parameter WORD1 = 4'b0001;
	parameter WORD2 = 4'b0010;
	parameter WORD3 = 4'b0011;
	parameter WORD4 = 4'b0100;
	parameter WORD5 = 4'b0101;
	parameter WORD6 = 4'b0110;
	parameter WORD7 = 4'b0111;
	parameter WORD7_WAIT = 4'b1111;
	parameter ENDEVENT = 4'b1000;
	parameter ENDEVENT_WAIT = 4'b1010;
	parameter READ_TYPE = 4'b1001;
	
	input RESET;
	
	output TRACK_FIFO_RE;
	output OUT_FIFO_WE, EE_OUT, EP_OUT, FIFO_EE_RE;
	output [2:0] SEL;
	input CLOCK;
	input DATA_TYPE;
	output DATA_FIFO_RE;
	input DATA_FIFO_EMPTY;
	input OUT_FIFO_FULL;

	wire [2:0] SEL;
	reg [3:0] state, next_state;

	assign OUT_FIFO_WE = (state == WORD1) | (state == WORD2) | 
		(state == WORD3) | (state == WORD4) | (state == WORD5) | 
		(state == WORD6) | (state == WORD7) | (state == ENDEVENT) | 
		(state == WORD7_WAIT) | (state == ENDEVENT_WAIT);
	assign TRACK_FIFO_RE = (state == WORD1);
	assign EP_OUT = (state == WORD7) | (state == ENDEVENT) | 
		(state == WORD7_WAIT) | (state == ENDEVENT_WAIT);
	assign EE_OUT = (state == ENDEVENT) | (state == ENDEVENT_WAIT);

	assign FIFO_EE_RE = (state == ENDEVENT) | (state == ENDEVENT_WAIT);
	
	// read the data flux fifo when not empty and out not full
	assign DATA_FIFO_RE = (~DATA_FIFO_EMPTY) & (~OUT_FIFO_FULL) & (
		(state == WAIT) | // wait for new data
		(state == WORD6) | // one word left of track data
		((state == WORD7) & (DATA_TYPE == 1'b1)) | // next is read type(EE)
		(state == WORD7_WAIT) | // next is read type
		((state == ENDEVENT) & (DATA_TYPE == 1'b1)) | // next is read type(EE)
		((state == READ_TYPE) & (DATA_TYPE == 1'b1)) | // next is read type(EE)
		(state == ENDEVENT_WAIT)); // next is read type
	
	reg [2:0] SEL_reg;
	assign SEL = SEL_reg;
	
	always @(state)
	begin
		case(state)
			WAIT: SEL_reg = 3'b000;
			WORD1: SEL_reg = 3'b000;
			WORD2: SEL_reg = 3'b001;
			WORD3: SEL_reg = 3'b010;
			WORD4: SEL_reg = 3'b011;
			WORD5: SEL_reg = 3'b100;
			WORD6: SEL_reg = 3'b101;
			WORD7: SEL_reg = 3'b110;
			WORD7_WAIT: SEL_reg = 3'b110;
			ENDEVENT: SEL_reg = 3'b111;
			ENDEVENT_WAIT: SEL_reg = 3'b111;
			default: SEL_reg = 3'b000;
		endcase
	end
	
always @(posedge CLOCK) begin
	if(RESET) state <= WAIT;
	else state <= next_state;
end

always @(state or DATA_FIFO_EMPTY or DATA_TYPE or OUT_FIFO_FULL) begin

	case(state)
	
	WAIT: if(DATA_FIFO_EMPTY | OUT_FIFO_FULL) next_state <= WAIT;
		else next_state <= READ_TYPE;
		
	READ_TYPE: if(DATA_TYPE == 1'b0) next_state <= WORD1;
		else if(DATA_FIFO_EMPTY) next_state <= ENDEVENT_WAIT;
		else next_state <= ENDEVENT;
		
	WORD1: next_state <= WORD2;
	WORD2: next_state <= WORD3;
	WORD3: next_state <= WORD4;
	WORD4: next_state <= WORD5;
	WORD5: next_state <= WORD6;
	WORD6: if(DATA_FIFO_EMPTY | OUT_FIFO_FULL) next_state <= WORD7_WAIT; 
		else next_state <= WORD7;
	
	WORD7: if(DATA_TYPE == 1'b0) next_state <= WORD1;
		else if(DATA_FIFO_EMPTY | OUT_FIFO_FULL) next_state <= ENDEVENT_WAIT;
		else next_state <= ENDEVENT;
	
	WORD7_WAIT: if(DATA_FIFO_EMPTY | OUT_FIFO_FULL) next_state <= WAIT;
		else next_state <= READ_TYPE;
	
	ENDEVENT: if(DATA_TYPE == 1'b0) next_state <= WORD1;
		else if(DATA_FIFO_EMPTY | OUT_FIFO_FULL) next_state <= ENDEVENT_WAIT;
		else next_state <= ENDEVENT;

	ENDEVENT_WAIT: if(DATA_FIFO_EMPTY | OUT_FIFO_FULL) next_state <= WAIT;
		else next_state <= READ_TYPE;

	default: next_state <= WAIT;
	endcase
end

				
endmodule
