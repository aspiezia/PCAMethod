`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:58:10 06/18/2008 
// Design Name: 
// Module Name:    hitreg 
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
module hitreg(
    input clear,
    input reset,
    input gnext,
    input [22:0] din,
    input we,
	 input clock,
	 input [11:0] phioffset,
    output [5:0] empty,
    output [5:0] overflow,
    output glast,
	 output xftlast,
    output [15:0] out_0,
    output [15:0] out_1,
    output [15:0] out_2,
    output [15:0] out_3,
    output [15:0] out_4,
    output [15:0] out_xft_c,
    output [15:0] out_xft_phi,
	 output [5:0] zin,
	 output [5:0] zout,
	 output out_of_order
    );

reg xft_wren;
wire [15:0] xft_buf_c;
wire [15:0] xft_buf_phi;

wire [5:0] next;
wire [5:0] last;
wire [4:0] svx_wren;
wire wren;

wire and_last;

assign wren = we;

assign svx_wren[0] = &{(din[20:18] == 3'b000), 
							   wren, 
								~xft_wren};
assign svx_wren[1] = &{(din[20:18] == 3'b001),
							   wren,
								~xft_wren};
assign svx_wren[2] = &{(din[20:18] == 3'b010), 
								wren,
								~xft_wren};
assign svx_wren[3] = &{(din[20:18] == 3'b011),
								wren,
								~xft_wren};
assign svx_wren[4] = &{(din[20:18] == 3'b100),
								wren,
								~xft_wren};

assign next[0] = gnext;
assign next[1] = next[0] & (last[0]);
assign next[2] = next[1] & (last[1]);
assign next[3] = next[2] & (last[2]);
assign next[4] = next[3] & (last[3]);
assign next[5] = next[4] & (last[4]);


// two's complement of xft c, the only signed quantity in input
	function [14:0] twocomp15;     // convert a bus from module-sign to two complement^M
      input [14:0] sign_input;
      begin
        if (sign_input[14] == 1)
			twocomp15 = ~{1'b0, sign_input[0+:14]} + 1;
        else twocomp15 = sign_input;
      end
   endfunction

// I'll add 1 here to c, in order to avoid problems with sign
wire signed [14:0] xft_c_twocomp = twocomp15({din[18],7'h00,din[17:12],1'b1});
wire signed [14:0] xft_phi_twocomp = {3'b000,din[11:0]} - {3'b000,phioffset};
assign	xft_buf_c = {1'b0,xft_c_twocomp};
assign	xft_buf_phi = {1'b0, xft_phi_twocomp};

wire [18:0] out_0_buf;
wire [18:0] out_1_buf;
wire [18:0] out_2_buf;
wire [18:0] out_3_buf;
wire [18:0] out_4_buf;
wire [18:0] out_xft_c_buf;
wire [18:0] out_xft_phi_buf;

assign out_0 = (empty[0]) ? 16'h0000 : out_0_buf[0+:16];
assign out_1 = (empty[1]) ? 16'h0000 : out_1_buf[0+:16];
assign out_2 = (empty[2]) ? 16'h0000 : out_2_buf[0+:16];
assign out_3 = (empty[3]) ? 16'h0000 : out_3_buf[0+:16];
assign out_4 = (empty[4]) ? 16'h0000 : out_4_buf[0+:16];
assign out_xft_c = (empty[5]) ? 16'h0000 : out_xft_c_buf[0+:16];
assign out_xft_phi = (empty[5]) ? 16'h0000 : out_xft_phi_buf[0+:16];

assign zin = {out_1_buf[16+:3],out_0_buf[16+:3]};
assign zout = {out_4_buf[16+:3],out_3_buf[16+:3]};

// register empty too
reg [5:0] empty_reg;
wire [5:0] empty0;
assign empty = empty_reg;
always @(posedge clock)
begin
	empty_reg <= empty0;
end

hitmem mem_0(
    .clock(clock),
    .din({din[15+:3],din[14],1'b0,din[13:0]}),
    .wren(svx_wren[0]),
    .next(next[0]),
	 .reset(reset),
	 .clear(clear),
    .empty(empty0[0]),
	 .overflow(overflow[0]),
    .last(last[0]),
    .dout(out_0_buf)
    );
	 
hitmem mem_1(
    .clock(clock),
    .din({din[15+:3],din[14],1'b0,din[13:0]}),  //Lc, sign, din
    .wren(svx_wren[1]),
    .next(next[1]),
	 .reset(reset),
	 .clear(clear),
    .empty(empty0[1]),
	 .overflow(overflow[1]),
    .last(last[1]),
    .dout(out_1_buf)
    );
	 
hitmem mem_2(
    .clock(clock),
    .din({3'b000,din[14],1'b0,din[13:0]}),
    .wren(svx_wren[2]),
    .next(next[2]),
	 .reset(reset),
	 .clear(clear),
    .empty(empty0[2]),
	 .overflow(overflow[2]),
    .last(last[2]),
    .dout(out_2_buf)
    );
	 
hitmem mem_3(
    .clock(clock),
    .din({din[15+:3],din[14],1'b0,din[13:0]}),
    .wren(svx_wren[3]),
    .next(next[3]),
	 .reset(reset),
	 .clear(clear),
    .empty(empty0[3]),
	 .overflow(overflow[3]),
    .last(last[3]),
    .dout(out_3_buf)
    );
	 
hitmem mem_4(
    .clock(clock),
    .din({din[15+:3],din[14],1'b0,din[13:0]}),
    .wren(svx_wren[4]),
    .next(next[4]),
	 .reset(reset),
	 .clear(clear),
    .empty(empty0[4]),
	 .overflow(overflow[4]),
    .last(last[4]),
    .dout(out_4_buf)
    );
	 
hitmem mem_xft_c(
    .clock(clock),
    .din({3'b000,xft_buf_c}),
    .wren(xft_wren & wren),
    .next(next[5]),
	 .reset(reset),
	 .clear(clear),
    .empty(empty0[5]),
	 .overflow(overflow[5]),
    .last(last[5]),
    .dout(out_xft_c_buf)
    );
	 
hitmem mem_xft_phi(
    .clock(clock),
    .din({3'b000,xft_buf_phi}),
    .wren(xft_wren & wren),
    .next(next[5]),
	 .reset(reset),
	 .clear(clear),
//    .empty(empty[5]),			// phi and c are the same
//	 .overflow(overflow[5]),
//    .last(last[5]),
    .dout(out_xft_phi_buf)
    );

assign and_last = last[0] & last[1] & last[2] & last[3] & last[4] & last[5];

FDRSE #(
      .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
   ) u_ff_last (
      .Q(glast),      // Data output
      .C(clock),      // Clock input
      .CE(and_last),    // Clock enable input
      .R(reset),  // Sync clear input
      .D(1'b1)       // Data input
   );

FDRSE #(
      .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
   ) u_ff_xftlast (
      .Q(xftlast),      // Data output
      .C(clock),      // Clock input
      .CE(last[0] & last[1] & last[2] & last[3] & last[4]),    // Clock enable input
      .R(reset),  // Sync clear input
      .D(1'b1)       // Data input
   );

// xft begin
wire xft_begin;
FDRSE #(
      .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
   ) u_ff_xft_begin (
      .Q(xft_begin),      // Data output
      .C(clock),      // Clock input
      .CE((din[20:18] == 3'b101) & we),    // Clock enable input
      .R(reset),  // Sync clear input
      .D(1'b1)       // Data input
   );

assign out_of_order = xft_begin & ~(din[20:18] == 3'b101) & ~xft_wren & we;
	
always @(posedge clock)
begin
	if(reset) begin 
		xft_wren <= 1'b0;
	end
	else begin
		if(wren) begin
			if(xft_wren) xft_wren <= 1'b0;
			else xft_wren <= (din[20:18] == 3'b101);
		end
	end
end

endmodule
