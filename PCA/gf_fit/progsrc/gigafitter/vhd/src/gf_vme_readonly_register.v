`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:34:29 01/19/2009 
// Design Name: 
// Module Name:    gf_vme_readonly_register 
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
module gf_vme_readonly_register(
    input clk,
    input init,
    input [15:0] address,
    input [15:0] DECODE_ADDRESS,
    input writeRegister,
    input readRegister,
    inout [31:0] data,
    input [31:0] ro_data,
    output enableReadData
    );

parameter WIDTH = 16;
parameter LSB = 0;

wire AddressSelect;
wire ReadSelect_comb;
reg readData_int;

assign enableReadData = readData_int;

assign ReadSelect_comb = AddressSelect && readRegister;

reg delay;

   always @(posedge clk or posedge init)
      if (init) begin
        readData_int <= 1'b0;
      end
      else begin
		  delay <= ReadSelect_comb;
        readData_int <= delay;
      end 


//comparator
assign AddressSelect = (address[LSB+:WIDTH] == DECODE_ADDRESS[LSB+:WIDTH]);		//va bene? come viene sintetizzato?

assign data = (readData_int) ? ro_data : 32'bz;


endmodule
