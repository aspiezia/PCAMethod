`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:59:36 05/09/2009 
// Design Name: 
// Module Name:    hitlc_mux 
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
module hitlc_mux(
	input clock,
	input [2:0] sel_chi,

	 input [4:0] hitmap_1,
	 input [4:0] hitmap_2,
	 input [4:0] hitmap_3,
	 input [4:0] hitmap_4,
	 input [4:0] hitmap_5,
	 input [4:0] hitmap_6,

	 output [4:0] hitmap,
	 output [4:0] hitmap_current,
	 
	 input [4:0] lcmap_1,
	 input [4:0] lcmap_2,
	 input [4:0] lcmap_3,
	 input [4:0] lcmap_4,
	 input [4:0] lcmap_5,
	 input [4:0] lcmap_6,
	 
	 output [4:0] lcmap
    );

reg [4:0] hitmap_reg;
reg [4:0] hitmap_reg1;
reg [4:0] hitmap_reg2;
reg [4:0] lcmap_reg;
reg [4:0] lcmap_reg1;
reg [4:0] lcmap_reg2;


assign hitmap = hitmap_reg2;
assign lcmap = lcmap_reg2;
assign hitmap_current = hitmap_reg;

always @(posedge clock)
begin
	hitmap_reg1 <= hitmap_reg;
	hitmap_reg2 <= hitmap_reg1;
	lcmap_reg1 <= lcmap_reg;
	lcmap_reg2 <= lcmap_reg1;
end

always @(sel_chi or
	hitmap_1 or
	hitmap_2 or
	hitmap_3 or
	hitmap_4 or
	hitmap_5 or
	hitmap_6 or
	lcmap_1 or
	lcmap_2 or
	lcmap_3 or
	lcmap_4 or
	lcmap_5 or
	lcmap_6 
	) 
begin
	case(sel_chi)
		3'b000: begin
			hitmap_reg <= hitmap_1;
			lcmap_reg  <=  lcmap_1;
		end
		3'b001: begin
			hitmap_reg <= hitmap_2;
			lcmap_reg  <=  lcmap_2;
		end
		3'b010: begin
			hitmap_reg <= hitmap_3;
			lcmap_reg  <=  lcmap_3;
		end
		3'b011: begin
			hitmap_reg <= hitmap_4;
			lcmap_reg  <=  lcmap_4;			
		end
		3'b100: begin
			hitmap_reg <= hitmap_5;
			lcmap_reg  <=  lcmap_5;			
		end
		3'b101: begin
			hitmap_reg <= hitmap_6;
			lcmap_reg  <=  lcmap_6;			
		end
		default: begin
			hitmap_reg <= hitmap_1;
			lcmap_reg  <=  lcmap_1;			
		end
	endcase
end

endmodule
