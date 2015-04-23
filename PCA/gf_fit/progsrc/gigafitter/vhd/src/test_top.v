`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:36:55 10/28/2008
// Design Name:   top
// Module Name:   /home/dasnake/lavori/gigafitter/firmware/mezzanina_martina/test_top.v
// Project Name:  mezzanina_gigafitter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_top;

	// Inputs
	reg [4:0] opcode;
	reg [22:0] data_in;
	reg clk;
	reg ds;
	reg reset;
	reg re;
	reg VME_wrpulse;
	reg VME_rdpulse;
	reg VME_busbusy;

	// Outputs
	wire hold;
	wire [9:0] data_count;
	wire empty;
	wire [22:0] data_out;
	wire clock_out;
	wire hold_out;
	wire ds_out;
	wire valid;
	wire dv_out;
	wire locked;
	wire VME_dv;
	wire makeadd_en_out;
	wire [13:0] Coeff_VME_bus_out;
	wire coeff_en_out;
	wire coeff_ram_we_out;
	wire [13:0] reg48_out;
	wire [19:0] debug;

	// Bidirs
	wire [33:0] VME_bus;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.opcode(opcode), 
		.data_in(data_in), 
		.hold(hold), 
		.clk(clk), 
		.data_count(data_count), 
		.empty(empty), 
		.ds(ds), 
		.reset(reset), 
		.data_out(data_out), 
		.clock_out(clock_out), 
		.hold_out(hold_out), 
		.ds_out(ds_out), 
		.re(re), 
		.valid(valid), 
		.dv_out(dv_out), 
		.locked(locked), 
		.VME_bus(VME_bus), 
		.VME_wrpulse(VME_wrpulse), 
		.VME_rdpulse(VME_rdpulse), 
		.VME_busbusy(VME_busbusy), 
		.VME_dv(VME_dv), 
		.makeadd_en_out(makeadd_en_out), 
		.Coeff_VME_bus_out(Coeff_VME_bus_out), 
		.coeff_en_out(coeff_en_out), 
		.coeff_ram_we_out(coeff_ram_we_out), 
		.reg48_out(reg48_out), 
		.debug(debug)
	);

	initial begin
		// Initialize Inputs
		opcode = 0;
		data_in = 0;
		clk = 0;
		ds = 0;
		reset = 0;
		re = 0;
		VME_wrpulse = 0;
		VME_rdpulse = 0;
		VME_busbusy = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always begin
		#12.5 clk = ~clk;
	end
      
endmodule

