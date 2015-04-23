`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:49:26 12/02/2008
// Design Name:   top
// Module Name:   C:/Documents and Settings/Martina/Documenti/Gigafitter/work/mezzanina_testfirmware/Combiner_Fitter_21_11/test_top_roadid.v
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

module test_top_roadid;

	// Inputs
	reg [4:0] opcode;
	reg [22:0] data_in;
	reg clk;
	reg ds;
	reg reset_pulsar;
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
		.reset_pulsar(reset_pulsar), 
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
		.debug(debug)
	);

	

	initial begin
		// Initialize Inputs
		opcode = 0;
		data_in = 0;
		clk = 0;
		ds = 0;
		reset_pulsar = 0;
		re = 0;
		VME_wrpulse = 0;
		VME_rdpulse = 0;
		VME_busbusy = 0;

		// Wait 100 ns for global reset to finish
		#900;
     data_in = 23'h00cc0c;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h00cc0c;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h0539da;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h0539da;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h081a25;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h0cc6c6;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h1132d6;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h15feed;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h04b68c;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h287e23;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h600001;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h600002;
		ds = 0;
		#20 ds = 1;
		#20;
////////////////////////////////////
	#700;
      data_in = 23'h00cc0c;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h0539da;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h081a25;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h0cc6c6;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h1132d6;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h15feed;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h04b68c;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h290f34;
		ds = 0;
		#20 ds = 1;
		#20;
		data_in = 23'h600003;
		ds = 0;
		#20 ds = 1;
		#20;
/*#20 data_in = 23'h0092f9; ds = 0; #20 ds = 1;
#20 data_in = 23'h05d8f0; ds = 0; #20 ds = 1;
#20 data_in = 23'h055750; ds = 0; #20 ds = 1;
#20 data_in = 23'h08bd69; ds = 0; #20 ds = 1;
#20 data_in = 23'h081988; ds = 0; #20 ds = 1;
#20 data_in = 23'h0cba47; ds = 0; #20 ds = 1;
#20 data_in = 23'h10e1d6; ds = 0; #20 ds = 1;
#20 data_in = 23'h15feed; ds = 0; #20 ds = 1;
#20 data_in = 23'h029ab2; ds = 0; #20 ds = 1;
#20 data_in = 23'h15feed; ds = 0; #20 ds = 1;
#20 data_in = 23'h0292bb; ds = 0; #20 ds = 1;
#20 data_in = 23'h3ecae6; ds = 0; #20 ds = 1;
#20 data_in = 23'h704b84; ds = 0; #20 ds = 1;
#20 data_in = 23'h0094d4; ds = 0; #20 ds = 1;
#20 data_in = 23'h00c62f; ds = 0; #20 ds = 1;
#20 data_in = 23'h04eabd; ds = 0; #20 ds = 1;
#20 data_in = 23'h056e84; ds = 0; #20 ds = 1;
#20 data_in = 23'h08f5b9; ds = 0; #20 ds = 1;
#20 data_in = 23'h093a5c; ds = 0; #20 ds = 1;
#20 data_in = 23'h0d2c1f; ds = 0; #20 ds = 1;
#20 data_in = 23'h11222c; ds = 0; #20 ds = 1;
#20 data_in = 23'h15feed; ds = 0; #20 ds = 1;
#20 data_in = 23'h02aa61; ds = 0; #20 ds = 1;
#20 data_in = 23'h15feed; ds = 0; #20 ds = 1;
#20 data_in = 23'h0315e6; ds = 0; #20 ds = 1;
#20 data_in = 23'h33e66d; ds = 0; #20 ds = 1;
#20 data_in = 23'h7f736c; ds = 0; #20 ds = 1;
#20 data_in = 23'h01ab55; ds = 0; #20 ds = 1;
#20 data_in = 23'h0413c5; ds = 0; #20 ds = 1;
#20 data_in = 23'h0473d7; ds = 0; #20 ds = 1;
#20 data_in = 23'h086b20; ds = 0; #20 ds = 1;
#20 data_in = 23'h0d175f; ds = 0; #20 ds = 1;
#20 data_in = 23'h0d75be; ds = 0; #20 ds = 1;
#20 data_in = 23'h10190d; ds = 0; #20 ds = 1;
#20 data_in = 23'h11b11f; ds = 0; #20 ds = 1;
#20 data_in = 23'h15feed; ds = 0; #20 ds = 1;
#20 data_in = 23'h00b57a; ds = 0; #20 ds = 1;
#20 data_in = 23'h2476c0; ds = 0; #20 ds = 1;
#20 data_in = 23'h6085a4; ds = 0; #20 ds = 1;
#20 data_in = 23'h0178d5; ds = 0; #20 ds = 1;
#20 data_in = 23'h05744f; ds = 0; #20 ds = 1;
#20 data_in = 23'h049f82; ds = 0; #20 ds = 1;
#20 data_in = 23'h0921fe; ds = 0; #20 ds = 1;
#20 data_in = 23'h0cf5e3; ds = 0; #20 ds = 1;
#20 data_in = 23'h1034d1; ds = 0; #20 ds = 1;
#20 data_in = 23'h15feed; ds = 0; #20 ds = 1;
#20 data_in = 23'h032a58; ds = 0; #20 ds = 1;
#20 data_in = 23'h2b844f; ds = 0; #20 ds = 1;
#20 data_in = 23'h6d8cb3; ds = 0; #20 ds = 1;
#20 data_in = 23'h000714; ds = 0; #20 ds = 1;
#20 data_in = 23'h0185f6; ds = 0; #20 ds = 1;
#20 data_in = 23'h05464e; ds = 0; #20 ds = 1;
#20 data_in = 23'h059cf0; ds = 0; #20 ds = 1;
#20 data_in = 23'h0893d7; ds = 0; #20 ds = 1;
#20 data_in = 23'h09d114; ds = 0; #20 ds = 1;
#20 data_in = 23'h0c5403; ds = 0; #20 ds = 1;
#20 data_in = 23'h116436; ds = 0; #20 ds = 1;
#20 data_in = 23'h15feed; ds = 0; #20 ds = 1;
#20 data_in = 23'h01839b; ds = 0; #20 ds = 1;
#20 data_in = 23'h15feed; ds = 0; #20 ds = 1;
#20 data_in = 23'h00110b; ds = 0; #20 ds = 1;
#20 data_in = 23'h2ebddc; ds = 0; #20 ds = 1;
#20 data_in = 23'h6f27aa; ds = 0; #20 ds = 1;
#20 data_in = 23'h018d2d; ds = 0; #20 ds = 1;
#20 data_in = 23'h047f03; ds = 0; #20 ds = 1;
#20 data_in = 23'h09af7b; ds = 0; #20 ds = 1;
#20 data_in = 23'h08f874; ds = 0; #20 ds = 1;
#20 data_in = 23'h0dfcdb; ds = 0; #20 ds = 1;
#20 data_in = 23'h0d5aba; ds = 0; #20 ds = 1;
#20 data_in = 23'h100cf4; ds = 0; #20 ds = 1;
#20 data_in = 23'h15feed; ds = 0; #20 ds = 1;
#20 data_in = 23'h035c2e; ds = 0; #20 ds = 1;
#20 data_in = 23'h15feed; ds = 0; #20 ds = 1;
#20 data_in = 23'h034d57; ds = 0; #20 ds = 1;
#20 data_in = 23'h31a6c0; ds = 0; #20 ds = 1;
#20 data_in = 23'h6611be; ds = 0; #20 ds = 1;
#20 data_in = 23'h013319; ds = 0; #20 ds = 1;
#20 data_in = 23'h00f643; ds = 0; #20 ds = 1;
#20 data_in = 23'h0589a6; ds = 0; #20 ds = 1;
#20 data_in = 23'h08acf8; ds = 0; #20 ds = 1;
#20 data_in = 23'h0d4be6; ds = 0; #20 ds = 1;
#20 data_in = 23'h0ca2ad; ds = 0; #20 ds = 1;
#20 data_in = 23'h11cf25; ds = 0; #20 ds = 1;
#20 data_in = 23'h11fc30; ds = 0; #20 ds = 1;
#20 data_in = 23'h15feed; ds = 0; #20 ds = 1;
#20 data_in = 23'h003c12; ds = 0; #20 ds = 1;
#20 data_in = 23'h15feed; ds = 0; #20 ds = 1;
#20 data_in = 23'h00445c; ds = 0; #20 ds = 1;
#20 data_in = 23'h30a342; ds = 0; #20 ds = 1;
#20 data_in = 23'h7886e2; ds = 0; #20 ds = 1;
#20 data_in = 23'h002f5a; ds = 0; #20 ds = 1;
#20 data_in = 23'h042336; ds = 0; #20 ds = 1;
#20 data_in = 23'h055d2c; ds = 0; #20 ds = 1;
#20 data_in = 23'h084cad; ds = 0; #20 ds = 1;
#20 data_in = 23'h0c75bc; ds = 0; #20 ds = 1;
#20 data_in = 23'h117e91; ds = 0; #20 ds = 1;
#20 data_in = 23'h11516a; ds = 0; #20 ds = 1;
#20 data_in = 23'h15feed; ds = 0; #20 ds = 1;
#20 data_in = 23'h031bb6; ds = 0; #20 ds = 1;
#20 data_in = 23'h15feed; ds = 0; #20 ds = 1;
#20 data_in = 23'h0141a3; ds = 0; #20 ds = 1;
#20 data_in = 23'h347481; ds = 0; #20 ds = 1;
#20 data_in = 23'h718864; ds = 0; #20 ds = 1;
#20 data_in = 23'h003d6d; ds = 0; #20 ds = 1;
#20 data_in = 23'h01e6ce; ds = 0; #20 ds = 1;
#20 data_in = 23'h05d2fd; ds = 0; #20 ds = 1;
#20 data_in = 23'h0931ef; ds = 0; #20 ds = 1;
#20 data_in = 23'h088041; ds = 0; #20 ds = 1;
#20 data_in = 23'h0cf1c0; ds = 0; #20 ds = 1;
#20 data_in = 23'h0d0ec6; ds = 0; #20 ds = 1;
#20 data_in = 23'h1110f8; ds = 0; #20 ds = 1;
#20 data_in = 23'h1000a6; ds = 0; #20 ds = 1;
#20 data_in = 23'h15feed; ds = 0; #20 ds = 1;
#20 data_in = 23'h017422; ds = 0; #20 ds = 1;
#20 data_in = 23'h30569f; ds = 0; #20 ds = 1;
#20 data_in = 23'h62397b; ds = 0; #20 ds = 1;
#20 data_in = 23'h0153ab; ds = 0; #20 ds = 1;
#20 data_in = 23'h00c975; ds = 0; #20 ds = 1;
#20 data_in = 23'h0422b4; ds = 0; #20 ds = 1;
#20 data_in = 23'h05719a; ds = 0; #20 ds = 1;
#20 data_in = 23'h09b7f6; ds = 0; #20 ds = 1;
#20 data_in = 23'h08ae97; ds = 0; #20 ds = 1;
#20 data_in = 23'h0c602f; ds = 0; #20 ds = 1;
#20 data_in = 23'h0cb110; ds = 0; #20 ds = 1;
#20 data_in = 23'h106894; ds = 0; #20 ds = 1;
#20 data_in = 23'h15feed; ds = 0; #20 ds = 1;
#20 data_in = 23'h00fc1e; ds = 0; #20 ds = 1;
#20 data_in = 23'h20edad; ds = 0; #20 ds = 1;
#20 data_in = 23'h62aaff; ds = 0; #20 ds = 1;
*/
	
		// Add stimulus here

	end


      
endmodule

