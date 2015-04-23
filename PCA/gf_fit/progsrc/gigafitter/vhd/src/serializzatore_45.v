`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:53:09 11/01/2008 
// Design Name: 
// Module Name:    serializzatore_45 
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
module serializzatore_45(
	input clock,
	input reset,
	input start,
	input [102:0] data_in_ser,
	input [755:0] const_data,
	input in_valid,
	output [15:0] out_ser,
	output dv,
	output ev,
	output hit6,
	output ee,
	output [4:0] hitmap,
	output [4:0] lcmap,
	output [17:0] c_chi1,
	output [17:0] c_chi1_0,
	output [17:0] c_chi2,
	output [17:0] c_chi2_0,
	output [17:0] c_chi3,
	output [17:0] c_chi3_0,
	output [17:0] c_c,
	output [17:0] c_c_0,
	output [17:0] c_d,
	output [17:0] c_d_0,
	output [17:0] c_phi,
	output [17:0] c_phi_0,
	output [4:0] xft_phi_msb

	);

reg [15:0] out_ser_in;

// mnemonics
wire ee_comb;
assign ee_comb = data_in_ser[102];
// control fsm

parameter WAIT = 4'b0000;
parameter REG_COMB = 4'b0001;
parameter HIT1 = 4'b0010;
parameter HIT2 = 4'b0011;
parameter HIT3 = 4'b0100;
parameter HIT4 = 4'b0101;
parameter HIT5 = 4'b0110;
parameter HIT6 = 4'b0111;
parameter HIT6_REG = 4'b1000;

reg [3:0] state = WAIT;

always @(posedge clock)
begin
	if(reset) begin
		state <= WAIT;
	end else begin
	(* PARALLEL_CASE *)case(state)
		WAIT: if(start) state <= REG_COMB;
			else state <= WAIT;
		REG_COMB: if(~in_valid) state <= WAIT;
			else if(ee_comb & ~start) state <= WAIT;
			else if(ee_comb & start) state <= REG_COMB;
			else state <= HIT1;
		HIT1: state <= HIT2;
		HIT2: state <= HIT3;
		HIT3: state <= HIT4;
		HIT4: state <= HIT5;
		HIT5: if(start) state <= HIT6_REG;
			else state <= HIT6;
		HIT6: if(start) state <= REG_COMB;
			else state <= WAIT;
		HIT6_REG: if(~in_valid) state <= WAIT;
			else if(ee_comb & ~start) state <= WAIT;
			else if(ee_comb & start) state <= REG_COMB;
			else state <= HIT1;
		default: state <= WAIT;
	endcase
	end
end

// non-shifted output/internal signals

wire dv_int;
assign dv_int = (state == HIT1) | (state == HIT2) | (state == HIT3) | (state == HIT4) | (state == HIT5) | (state == HIT6) |  (state == HIT6_REG);

wire ee_int;
assign ee_int = ((state == REG_COMB) | (state == HIT6_REG)) & (ee_comb) & ~in_valid;

wire ev_int;
assign ev_int = (state == HIT6) | (state == HIT6_REG);

wire reg_comb_en;
assign reg_comb_en = ((state == REG_COMB) | (state == HIT6_REG)) & ~ee_comb;

wire reg_const_en;
assign reg_const_en = (state == HIT2);

assign hit6 = (state == HIT6) | (state == HIT6_REG);

// comb and const registers

reg [100:0] reg_comb;
always @(posedge clock)
begin
	if(reset) reg_comb <= 101'b0;
	else if(reg_comb_en) reg_comb <= data_in_ser[0+:101];
	else reg_comb <= reg_comb;
end

reg [755:0] reg_const;
always @(posedge clock)
begin
	if(reset) reg_const <= 756'b0;
	else if(reg_const_en) reg_const <= const_data;
	else reg_const <= reg_const;
end

// hitmap and lcmap, from reg_comb

assign hitmap = reg_comb[96+:5];

reg [4:0] lcmap_reg;
assign lcmap = lcmap_reg;

always @(hitmap or reg_comb)
begin
	case(hitmap)
		5'b11110: lcmap_reg = {reg_comb[63],reg_comb[47],reg_comb[31],reg_comb[15],1'b0};
		5'b11101: lcmap_reg = {reg_comb[63],reg_comb[47],reg_comb[31],1'b0,reg_comb[15]};
		5'b11011: lcmap_reg = {reg_comb[63],reg_comb[47],1'b0,reg_comb[31],reg_comb[15]};
		5'b10111: lcmap_reg = {reg_comb[63],1'b0,reg_comb[47],reg_comb[31],reg_comb[15]};
		5'b01111: lcmap_reg = {1'b0,reg_comb[63],reg_comb[47],reg_comb[31],reg_comb[15]};
		default: lcmap_reg = {reg_comb[63],reg_comb[47],reg_comb[31],reg_comb[15],1'b0};
	endcase
end

// hit mux

wire [4:0] xft_phi_msb_in;
assign xft_phi_msb_in = reg_comb[76:72];

always @(state or reg_comb)
begin
	case(state)
	// << 1 and add 1 to SVX
	HIT1: out_ser_in = {reg_comb[14:0],1'b1};
	HIT2: out_ser_in = {reg_comb[30:16],1'b1};
	HIT3: out_ser_in = {reg_comb[46:32],1'b1};
	HIT4: out_ser_in = {reg_comb[62:48],1'b1};
	HIT5: out_ser_in = {{5{reg_comb[71]}},reg_comb[71:64],3'b100}; // pushing phi << 2
//	HIT5: out_ser_in = reg_comb[78:64]; // 
	HIT6: out_ser_in = {reg_comb[88:80],7'b0000000};
	HIT6_REG: out_ser_in = {reg_comb[88:80],7'b0000000};
	default: out_ser_in = 16'h0000;
	endcase
end

// two clock cycles hit shift

reg [15:0] hit_buf_1;
reg [15:0] hit_buf_2;
reg [4:0] xft_phi_msb_1;
reg [4:0] xft_phi_msb_2;
assign xft_phi_msb = xft_phi_msb_2;
always @(posedge clock)
begin
	hit_buf_1 <= out_ser_in;
	xft_phi_msb_1 <= xft_phi_msb_in;
	hit_buf_2 <= hit_buf_1;
	xft_phi_msb_2 <= xft_phi_msb_1;
end

assign out_ser = hit_buf_2;

// two clock cycles control signals shift

reg [2:0] buf4_1;
reg [2:0] buf4_2;
always @(posedge clock)
begin
	buf4_1 <= {dv_int,ev_int,ee_int};
	buf4_2 <= buf4_1;
end

assign dv = buf4_2[2];
assign ev = buf4_2[1];
assign ee = buf4_2[0];

// two clock cycle state shift for const/hit sync

reg [3:0] state_buf1;
reg [3:0] state_buf2;
always @(posedge clock)
begin
	state_buf1 <= state;
	state_buf2 <= state_buf1;
end

// const mux and outputs
assign c_chi1_0	=	reg_const[17:0];
assign c_chi2_0	=	reg_const[35:18];
assign c_chi3_0	=	reg_const[53:36];
assign c_c_0		=	reg_const[71:54];
assign c_d_0		=	reg_const[89:72];
assign c_phi_0		=	reg_const[107:90];

reg [17:0] c_chi1_int;
reg [17:0] c_chi2_int;
reg [17:0] c_chi3_int;
reg [17:0] c_c_int;
reg [17:0] c_d_int;
reg [17:0] c_phi_int;

always @(state_buf2 or reg_const)
begin
	case(state_buf2)
		HIT1: begin
			c_chi1_int 	<=	reg_const[125:108];
			c_chi2_int 	<=	reg_const[143:126];
			c_chi3_int 	<=	reg_const[161:144];
			c_c_int	 	<=	reg_const[179:162];
			c_d_int 		<=	reg_const[197:180];
			c_phi_int 	<=	reg_const[215:198];
		end
		HIT2: begin
			c_chi1_int 	<=	reg_const[233:216];
			c_chi2_int 	<=	reg_const[251:234];
			c_chi3_int 	<=	reg_const[269:252];
			c_c_int	 	<=	reg_const[287:270];
			c_d_int 		<=	reg_const[305:288];
			c_phi_int 	<=	reg_const[323:306];
		end
		HIT3: begin
			c_chi1_int 	<=	reg_const[341:324];
			c_chi2_int 	<=	reg_const[359:342];
			c_chi3_int 	<=	reg_const[377:360];
			c_c_int	 	<=	reg_const[395:378];
			c_d_int 		<=	reg_const[413:396];
			c_phi_int 	<=	reg_const[431:414];
		end
		HIT4: begin
			c_chi1_int 	<=	reg_const[449:432];
			c_chi2_int 	<=	reg_const[467:450];
			c_chi3_int 	<=	reg_const[485:468];
			c_c_int	 	<=	reg_const[503:486];
			c_d_int 		<=	reg_const[521:504];
			c_phi_int 	<=	reg_const[539:522];
		end
		HIT5: begin
			c_chi1_int 	<=	reg_const[557:540];
			c_chi2_int 	<=	reg_const[575:558];
			c_chi3_int 	<=	reg_const[593:576];
			c_c_int	 	<=	reg_const[611:594];
			c_d_int 		<=	reg_const[629:612];
			c_phi_int 	<=	reg_const[647:630];
		end
		HIT6: begin
			c_chi1_int 	<=	reg_const[665:648];
			c_chi2_int 	<=	reg_const[683:666];
			c_chi3_int 	<=	reg_const[701:684];
			c_c_int	 	<=	reg_const[719:702];
			c_d_int 		<=	reg_const[737:720];
			c_phi_int 	<=	reg_const[755:738];
		end
		HIT6_REG: begin
			c_chi1_int 	<=	reg_const[665:648];
			c_chi2_int 	<=	reg_const[683:666];
			c_chi3_int 	<=	reg_const[701:684];
			c_c_int	 	<=	reg_const[719:702];
			c_d_int 		<=	reg_const[737:720];
			c_phi_int 	<=	reg_const[755:738];
		end
		default: begin
			c_chi1_int 	<=	18'b0;
			c_chi2_int 	<=	18'b0;
			c_chi3_int 	<=	18'b0;
			c_c_int	 	<=	18'b0;
			c_d_int 		<=	18'b0;
			c_phi_int 	<=	18'b0;
		end
	endcase
end

assign c_chi1 = c_chi1_int;
assign c_chi2 = c_chi2_int;
assign c_chi3 = c_chi3_int;
assign c_c = c_c_int;
assign c_d = c_d_int;
assign c_phi = c_phi_int;

endmodule


