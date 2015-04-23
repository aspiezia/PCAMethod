`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:23:10 07/21/2009 
// Design Name: 
// Module Name:    async_input_sync 
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

module async_input_sync(
   input clk,
   (* TIG="TRUE", IOB="FALSE" *) input async_in,
   output reg sync_out
);

   (* ASYNC_REG="TRUE", SHIFT_EXTRACT="NO", HBLKNM="sync_reg" *) reg [1:0] sreg;
   always @(posedge clk) begin
     sync_out <= sreg[1];
     sreg <= {sreg[0], async_in};
   end

endmodule

