`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:04:55 05/23/2008 
// Design Name: 
// Module Name:    mezzanina_gigafitter 
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
module mezzanina_gigafitter(
    
	 // SVT input
	 
	 input [23:0] W0_DATA,  // from J7 connector 
    input [23:0] W1_DATA,  // from J8 connector	 
    input [23:0] W2_DATA,  // from J5 connector
    input [23:0] W3_DATA,  // from J4 connector
	 	 
	 // SVT hold
	 
    output W_HOLD_1,
	 output W_HOLD_2,
	 output W_HOLD_3,
	 output W_HOLD_4,
	 
	 // inout Pulsar
	 
		/* J1 connector: 
					- J1DATA_out [23:1] = svt_data_out to Pulsar
					- J1DATA_out [24] = svt_data_valid to Pulsar
					- J1DATA_in [25] = svt_read_enable from Pulsar
					- J1DATA_in [45:26] = VME_bus_1 from Pulsar  */
	 
		 output [24:1] J1DATA_out,
		 input J1DATA_26,
		 input J1DATA_27,
		 inout [45:28] J1DATA_inout,
		 input J1DATA_25,
		 input J1LCLK,
		 
		 inout [14:1] J3DATA_inout, // vme data
	//	 input [23:15]J3DATA_in;
		 input [27:15] J3DATA_in, // vme addr
	//	 output J3DATA_out_24;
	//	 inout [27:25] J3DATA;  
	//	 input [4:1] J3ID,
		 input [2:1] J3ID,
		 output [3:3] J3ID_out,
		 input [4:1] J3PT,
		 input J3WRITECLK,
	//	 input J3CDF_CLK;
	 // led
	 
	 output FLOATIN_3,  // led2
	 output FLOATIN_4,  // led1
	 // to test connector J6
	 
	 output [20:1] OUT
);

wire locked;
wire locked_slowclock;
wire VME_dv;
//wire [13:0]Coeff_VME_bus_out, reg48_out;

//assign J3DATA_out_24 = VME_dv;
wire lost_sync;
assign FLOATIN_3 = ~locked | ~locked_slowclock;
assign FLOATIN_4 = lost_sync;
wire [19:0] debug;
assign OUT[20:1] = debug;

top mytop(
.data_in_0({~W0_DATA[22], ~W0_DATA[21], W0_DATA[20], W0_DATA[19], ~W0_DATA[18], ~W0_DATA[17], W0_DATA[16], W0_DATA[15], ~W0_DATA[14], ~W0_DATA[13], W0_DATA[12], W0_DATA[11], ~W0_DATA[10], ~W0_DATA[9], W0_DATA[8], W0_DATA[7], ~W0_DATA[6], ~W0_DATA[5], W0_DATA[4], W0_DATA[3], ~W0_DATA[2], ~W0_DATA[1], W0_DATA[0]}),
.data_in_1({~W1_DATA[22], ~W1_DATA[21], W1_DATA[20], W1_DATA[19], ~W1_DATA[18], ~W1_DATA[17], W1_DATA[16], W1_DATA[15], ~W1_DATA[14], ~W1_DATA[13], W1_DATA[12], W1_DATA[11], ~W1_DATA[10], ~W1_DATA[9], W1_DATA[8], W1_DATA[7], ~W1_DATA[6], ~W1_DATA[5], W1_DATA[4], W1_DATA[3], ~W1_DATA[2], ~W1_DATA[1], W1_DATA[0]}),
.data_in_2({~W2_DATA[22], ~W2_DATA[21], W2_DATA[20], W2_DATA[19], ~W2_DATA[18], ~W2_DATA[17], W2_DATA[16], W2_DATA[15], ~W2_DATA[14], ~W2_DATA[13], W2_DATA[12], W2_DATA[11], ~W2_DATA[10], ~W2_DATA[9], W2_DATA[8], W2_DATA[7], ~W2_DATA[6], ~W2_DATA[5], W2_DATA[4], W2_DATA[3], ~W2_DATA[2], ~W2_DATA[1], W2_DATA[0]}),
.data_in_3({~W3_DATA[22], ~W3_DATA[21], W3_DATA[20], W3_DATA[19], ~W3_DATA[18], ~W3_DATA[17], W3_DATA[16], W3_DATA[15], ~W3_DATA[14], ~W3_DATA[13], W3_DATA[12], W3_DATA[11], ~W3_DATA[10], ~W3_DATA[9], W3_DATA[8], W3_DATA[7], ~W3_DATA[6], ~W3_DATA[5], W3_DATA[4], W3_DATA[3], ~W3_DATA[2], ~W3_DATA[1], W3_DATA[0]}),
.hold_0(W_HOLD_1),
.hold_1(W_HOLD_2),
.hold_2(W_HOLD_3),
.hold_3(W_HOLD_4),
.clk(J3WRITECLK), 
.ds_0(W0_DATA[23]), 
.ds_1(W1_DATA[23]), 
.ds_2(W2_DATA[23]), 
.ds_3(W3_DATA[23]), 
.reset_pulsar(J3PT[4]), 
.data_out(J1DATA_out[1+:23]),
.re(J1DATA_25),
.valid(J1DATA_out[24]),
.locked(locked),
.locked_slowclock(locked_slowclock),
.VMEdata({J3DATA_inout[14:1],J1DATA_inout[45:28]}),
.VMEaddr({J3PT[3:1], J3DATA_in[27:15]}),
.VMEread(J1DATA_26),
.VMEwrite(J1DATA_27),
.freeze(J3ID[1]),
.mezzanine(J3ID[2]),
.svt_error(J3ID_out[3]),
.mezzanine_sel(J1LCLK),
.lost_sync_err(lost_sync),
.debug(debug)

);	

//assign J3ID_out[4] = 1'b0;
	
endmodule
