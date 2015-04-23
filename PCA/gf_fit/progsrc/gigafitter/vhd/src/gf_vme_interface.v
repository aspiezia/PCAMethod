


`timescale 1 ns / 100 ps	// mp 
module gf_vme_interface		(	clk,
										slowclk,
														init,
														VMEaddr,
														VMEdata,
														VMEwrite_p,
														VMEread_p,
														local_add_reg,
														control_reg1,
														ram_writePulse,
														ram_readPulse,
														ram_data_bus,
														
														mezzanine,
														mezzanine_sel,
														
														ispy_counter_w0,
														ispy_word_w0,
														ispy_readPulse_w0,
														ispy_addr_w0,
														ispy_reset_w0,

														ispy_counter_w1,
														ispy_word_w1,
														ispy_readPulse_w1,
														ispy_addr_w1,
														ispy_reset_w1,

														ispy_counter_w2,
														ispy_word_w2,
														ispy_readPulse_w2,
														ispy_addr_w2,
														ispy_reset_w2,

														ispy_counter_w3,
														ispy_word_w3,
														ispy_readPulse_w3,
														ispy_addr_w3,
														ispy_reset_w3,

														ospy_counter_w0,
														ospy_word_w0,
														ospy_readPulse_w0,
														ospy_addr_w0,
														ospy_reset_w0,

														ospy_counter_w1,
														ospy_word_w1,
														ospy_readPulse_w1,
														ospy_addr_w1,
														ospy_reset_w1,

														ospy_counter_w2,
														ospy_word_w2,
														ospy_readPulse_w2,
														ospy_addr_w2,
														ospy_reset_w2,

														ospy_counter_w3,
														ospy_word_w3,
														ospy_readPulse_w3,
														ospy_addr_w3,
														ospy_reset_w3,
														
														ospy_counter_mezzanine,
														ospy_word_mezzanine,
														ospy_readPulse_mezzanine,
														ospy_addr_mezzanine,
														ospy_reset_mezzanine,
														//TM
														gf_status,
														//
														dcm_reg,
														dcm_reg_write,
														last_50h,
														
														chi2cut,
														phioffset_w0w1,
														phioffset_w2w3,
														
														w0_status,
														clear_w0_status,
														w1_status,
														clear_w1_status,
														w2_status,
														clear_w2_status,
														w3_status,
														clear_w3_status,
														
														sectors,
														
														cdf_error_mask,
														svt_error_mask,
														error_reg,
														clear_error_reg,
														
														reset_vme
	       									);



// input/output declaration

input clk;
input slowclk;
input init;
input [15:0] VMEaddr;
inout [31:0] VMEdata;		// INOUT	!!!
input VMEwrite_p;
input VMEread_p;
input mezzanine;
input mezzanine_sel;
output [31:0] local_add_reg;
output [31:0] control_reg1;
output ram_writePulse;
output ram_readPulse;
inout [755:0] ram_data_bus;

input [31:0] ispy_counter_w0;
input [31:0] ispy_word_w0;
output ispy_readPulse_w0;
output [8:0] ispy_addr_w0;
output ispy_reset_w0;

input [31:0] ispy_counter_w1;
input [31:0] ispy_word_w1;
output ispy_readPulse_w1;
output [8:0] ispy_addr_w1;
output ispy_reset_w1;

input [31:0] ispy_counter_w2;
input [31:0] ispy_word_w2;
output ispy_readPulse_w2;
output [8:0] ispy_addr_w2;
output ispy_reset_w2;

input [31:0] ispy_counter_w3;
input [31:0] ispy_word_w3;
output ispy_readPulse_w3;
output [8:0] ispy_addr_w3;
output ispy_reset_w3;

input [31:0] ospy_counter_w0;
input [31:0] ospy_word_w0;
output ospy_readPulse_w0;
output [8:0] ospy_addr_w0;
output ospy_reset_w0;

input [31:0] ospy_counter_w1;
input [31:0] ospy_word_w1;
output ospy_readPulse_w1;
output [8:0] ospy_addr_w1;
output ospy_reset_w1;

input [31:0] ospy_counter_w2;
input [31:0] ospy_word_w2;
output ospy_readPulse_w2;
output [8:0] ospy_addr_w2;
output ospy_reset_w2;

input [31:0] ospy_counter_w3;
input [31:0] ospy_word_w3;
output ospy_readPulse_w3;
output [8:0] ospy_addr_w3;
output ospy_reset_w3;

input [31:0] ospy_counter_mezzanine;
input [31:0] ospy_word_mezzanine;
output ospy_readPulse_mezzanine;
output [10:0] ospy_addr_mezzanine;
output ospy_reset_mezzanine;

input [31:0] gf_status;

input [31:0] w0_status;
output clear_w0_status;

input [31:0] w1_status;
output clear_w1_status;

input [31:0] w2_status;
output clear_w2_status;

input [31:0] w3_status;
output clear_w3_status;

output [31:0] dcm_reg;
output dcm_reg_write;
input [31:0] last_50h;

output [31:0] chi2cut;
output [31:0] phioffset_w0w1;
output [31:0] phioffset_w2w3;

output [31:0] sectors;

output [31:0] cdf_error_mask;
output [31:0] svt_error_mask;
input [31:0] error_reg;
output clear_error_reg;

output reset_vme;

//input TM;		// not used now mp 22.12.08

wire VMEwrite;
wire VMEread;

// mezzanine selection (it is in the VME addr)

reg mezzanine_sel_reg;
always @(posedge clk)
begin
	mezzanine_sel_reg <= mezzanine_sel;
end

assign VMEwrite = VMEwrite_p & (mezzanine == mezzanine_sel_reg);
assign VMEread = VMEread_p & (mezzanine == mezzanine_sel_reg);


wire enableRead_local_add_reg1;
wire enableRead_gf_vme_register756_1;
wire enableRead_control_reg1;
wire [31:0] local_add_reg;
wire ram_writePulse;
wire ram_readPulse;


//-----------------------
//-- local_add_reg1  --
//-----------------------

// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0000 01XX			
//0x820004
parameter local_add_reg_address = 16'b1000000000000001;					
gf_vme_register local_add_reg1
								(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(local_add_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							.enableReadData(enableRead_local_add_reg1),
      							.q(local_add_reg)	//output
     					 );


// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0000 00XX			
//0x820000
parameter RWpulse_address = 16'b1000000000000000;
gf_vme_RWpulse_decoder RWpulse1
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(RWpulse_address),
									.writeAccess(VMEwrite),
									.readAccess(VMEread),
									.writePulse(ram_writePulse),
									.readPulse(ram_readPulse)
	       			);


// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0000 10XX			
//0x820008

parameter gf_vme_register756wr_address = 16'b1000000000000010;
gf_vme_register756 gf_vme_register756_write
							(
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(gf_vme_register756wr_address),
									.local_add_reg(local_add_reg),		//input
									.writeRegister(VMEwrite),
									.readRegister(VMEread),
									.ram_writePulse(ram_writePulse),
									.data(VMEdata),
									.enableReadData(enableRead_gf_vme_register756_1),
									.ram_data_bus(ram_data_bus)
								
	       				);

// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0000 11XX			
//0x82000C

parameter gf_vme_register756rd_address = 16'b1000000000000011;
gf_vme_register756_readonly gf_vme_register756_read
							(
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(gf_vme_register756rd_address),
									.local_add_reg(local_add_reg),		//input
									.readPulse(ram_readPulse),	// input
									.readRegister(VMEread),
									.mem_data(ram_data_bus),
									.data_to_vme(VMEdata)
	       				);


//-----------------------
//-- control_reg1      --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0001 00XX			
//0x820010

parameter control_reg1_address = 16'b1000000000000100;					
gf_vme_register u_control_reg1
								(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(control_reg1_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							.enableReadData(enableRead_control_reg1),
      							.q(control_reg1)	//output
     					 );

//-----------------------
//-- firmware_version_reg     --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0001 01XX			
//0x820014

parameter firmware_reg_address = 16'b1000000000000101;
parameter firmware_version = 32'h10011102;					
gf_vme_readonly_register u_firmware_reg
								(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(firmware_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							.enableReadData(enableRead_firmware_reg),
      							.ro_data(firmware_version)	//output
     					 );

						 
//-----------------------
//-- ispy_counter_w0_reg     --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0001 10XX			
//0x820018																		

parameter ispy_counter_w0_reg_address = 16'b1000000000000110;
gf_vme_readonly_register u_ispy_counter_w0_reg	(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(ispy_counter_w0_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							.enableReadData(enableRead_ispy_counter_w0_reg),
      							.ro_data(ispy_counter_w0)	
);
gf_vme_RWpulse_decoder ispy_counter_w0_pulse
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(ispy_counter_w0_reg_address),
									.writeAccess(VMEwrite),
									.readAccess(VMEread),
									.writePulse(ispy_reset_w0)
//									.readPulse(readPulse)
	       			);
						 
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0010 0000 0000 00XX			
// 0x822QQQ																				

parameter ispy_read_w0_address = 16'b1000100000000000;
assign ispy_addr_w0 = VMEaddr[8:0];

gf_vme_readonly_register #(
	.WIDTH(7),
	.LSB(9)) u_ispy_read_w0_reg
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(ispy_read_w0_address),
									.writeRegister(VMEwrite),
									.readRegister(VMEread),
									.data(VMEdata),
									.enableReadData(ispy_readPulse_w0),
									.ro_data(ispy_word_w0)
	       			);


//-----------------------
//-- ispy_counter_w1_reg     --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0001 10XX			
//0x82001c																		

parameter ispy_counter_w1_reg_address = 16'b1000000000000111;
gf_vme_readonly_register u_ispy_counter_w1_reg	(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(ispy_counter_w1_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							.enableReadData(enableRead_ispy_counter_w1_reg),
      							.ro_data(ispy_counter_w1)	
);
gf_vme_RWpulse_decoder ispy_counter_w1_pulse
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(ispy_counter_w1_reg_address),
									.writeAccess(VMEwrite),
									.readAccess(VMEread),
									.writePulse(ispy_reset_w1)
//									.readPulse(readPulse)
	       			);
						 
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0010 0000 0000 00XX			
// 0x824QQQ																				

parameter ispy_read_w1_address = 16'b1001000000000000;
assign ispy_addr_w1 = VMEaddr[8:0];

gf_vme_readonly_register #(
	.WIDTH(7),
	.LSB(9)) u_ispy_read_w1_reg
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(ispy_read_w1_address),
									.writeRegister(VMEwrite),
									.readRegister(VMEread),
									.data(VMEdata),
									.enableReadData(ispy_readPulse_w1),
									.ro_data(ispy_word_w1)
	       			);

//-----------------------
//-- ispy_counter_w2_reg     --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0010 00XX			
//0x820020																		

parameter ispy_counter_w2_reg_address = 16'b1000000000001000;
gf_vme_readonly_register u_ispy_counter_w2_reg	(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(ispy_counter_w2_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							.enableReadData(enableRead_ispy_counter_w2_reg),
      							.ro_data(ispy_counter_w2)	
);
gf_vme_RWpulse_decoder ispy_counter_w2_pulse
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(ispy_counter_w2_reg_address),
									.writeAccess(VMEwrite),
									.readAccess(VMEread),
									.writePulse(ispy_reset_w2)
//									.readPulse(readPulse)
	       			);
						 
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0110 0000 0000 00XX			
// 0x826QQQ																				

parameter ispy_read_w2_address = 16'b1001100000000000;
assign ispy_addr_w2 = VMEaddr[8:0];

gf_vme_readonly_register #(
	.WIDTH(7),
	.LSB(9)) u_ispy_read_w2_reg
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(ispy_read_w2_address),
									.writeRegister(VMEwrite),
									.readRegister(VMEread),
									.data(VMEdata),
									.enableReadData(ispy_readPulse_w2),
									.ro_data(ispy_word_w2)
	       			);

//-----------------------
//-- ispy_counter_w3_reg     --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0010 01XX			
//0x820024																		

parameter ispy_counter_w3_reg_address = 16'b1000000000001001;
gf_vme_readonly_register u_ispy_counter_w3_reg	(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(ispy_counter_w3_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							.enableReadData(enableRead_ispy_counter_w3_reg),
      							.ro_data(ispy_counter_w3)	
);
gf_vme_RWpulse_decoder ispy_counter_w3_pulse
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(ispy_counter_w3_reg_address),
									.writeAccess(VMEwrite),
									.readAccess(VMEread),
									.writePulse(ispy_reset_w3)
//									.readPulse(readPulse)
	       			);
						 
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 1000 0000 0000 00XX			
// 0x828QQQ																				

parameter ispy_read_w3_address = 16'b1010000000000000;
assign ispy_addr_w3 = VMEaddr[8:0];

gf_vme_readonly_register #(
	.WIDTH(7),
	.LSB(9)) u_ispy_read_w3_reg
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(ispy_read_w3_address),
									.writeRegister(VMEwrite),
									.readRegister(VMEread),
									.data(VMEdata),
									.enableReadData(ispy_readPulse_w3),
									.ro_data(ispy_word_w3)
	       			);
				 
//-----------------------
//-- ospy_counter_w0_reg     --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0010 10XX			
//0x820028																		

parameter ospy_counter_w0_reg_address = 16'b1000000000001010;
gf_vme_readonly_register u_ospy_counter_w0_reg	(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(ospy_counter_w0_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							.enableReadData(enableRead_ospy_counter_w0_reg),
      							.ro_data(ospy_counter_w0)	
);
gf_vme_RWpulse_decoder ospy_counter_w0_pulse
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(ospy_counter_w0_reg_address),
									.writeAccess(VMEwrite),
									.readAccess(VMEread),
									.writePulse(ospy_reset_w0)
//									.readPulse(readPulse)
	       			);
						 
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 1010 0000 0000 00XX			
// 0x82aQQQ																				

parameter ospy_read_w0_address = 16'b1010100000000000;
assign ospy_addr_w0 = VMEaddr[8:0];

gf_vme_readonly_register #(
	.WIDTH(7),
	.LSB(9)) u_ospy_read_w0_reg
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(ospy_read_w0_address),
									.writeRegister(VMEwrite),
									.readRegister(VMEread),
									.data(VMEdata),
									.enableReadData(ospy_readPulse_w0),
									.ro_data(ospy_word_w0)
	       			);


//-----------------------
//-- ospy_counter_w1_reg     --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0010 11XX			
//0x82002c																		

parameter ospy_counter_w1_reg_address = 16'b1000000000001011;
gf_vme_readonly_register u_ospy_counter_w1_reg	(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(ospy_counter_w1_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							.enableReadData(enableRead_ospy_counter_w1_reg),
      							.ro_data(ospy_counter_w1)	
);
gf_vme_RWpulse_decoder ospy_counter_w1_pulse
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(ospy_counter_w1_reg_address),
									.writeAccess(VMEwrite),
									.readAccess(VMEread),
									.writePulse(ospy_reset_w1)
//									.readPulse(readPulse)
	       			);
						 
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 1100 0000 0000 00XX			
// 0x82cQQQ																				

parameter ospy_read_w1_address = 16'b1011000000000000;
assign ospy_addr_w1 = VMEaddr[8:0];

gf_vme_readonly_register #(
	.WIDTH(7),
	.LSB(9)) u_ospy_read_w1_reg
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(ospy_read_w1_address),
									.writeRegister(VMEwrite),
									.readRegister(VMEread),
									.data(VMEdata),
									.enableReadData(ospy_readPulse_w1),
									.ro_data(ospy_word_w1)
	       			);

//-----------------------
//-- ispy_counter_w2_reg     --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0011 00XX			
//0x820030																		

parameter ospy_counter_w2_reg_address = 16'b1000000000001100;
gf_vme_readonly_register u_ospy_counter_w2_reg	(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(ospy_counter_w2_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							.enableReadData(enableRead_ospy_counter_w2_reg),
      							.ro_data(ospy_counter_w2)	
);
gf_vme_RWpulse_decoder ospy_counter_w2_pulse
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(ospy_counter_w2_reg_address),
									.writeAccess(VMEwrite),
									.readAccess(VMEread),
									.writePulse(ospy_reset_w2)
//									.readPulse(readPulse)
	       			);
						 
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX11 0000 0000 0000 00XX			
// 0x830QQQ																				

parameter ospy_read_w2_address = 16'b1100000000000000;
assign ospy_addr_w2 = VMEaddr[8:0];

gf_vme_readonly_register #(
	.WIDTH(7),
	.LSB(9)) u_ospy_read_w2_reg
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(ospy_read_w2_address),
									.writeRegister(VMEwrite),
									.readRegister(VMEread),
									.data(VMEdata),
									.enableReadData(ospy_readPulse_w2),
									.ro_data(ospy_word_w2)
	       			);

//-----------------------
//-- ospy_counter_w3_reg     --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0011 01XX			
//0x820034																		

parameter ospy_counter_w3_reg_address = 16'b1000000000001101;
gf_vme_readonly_register u_ospy_counter_w3_reg	(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(ospy_counter_w3_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							.enableReadData(enableRead_ospy_counter_w3_reg),
      							.ro_data(ospy_counter_w3)	
);
gf_vme_RWpulse_decoder ospy_counter_w3_pulse
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(ospy_counter_w3_reg_address),
									.writeAccess(VMEwrite),
									.readAccess(VMEread),
									.writePulse(ospy_reset_w3)
//									.readPulse(readPulse)
	       			);
						 
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX11 0010 0000 0000 00XX			
// 0x832QQQ																				

parameter ospy_read_w3_address = 16'b1100100000000000;
assign ospy_addr_w3 = VMEaddr[8:0];

gf_vme_readonly_register #(
	.WIDTH(7),
	.LSB(9)) u_ospy_read_w3_reg
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(ospy_read_w3_address),
									.writeRegister(VMEwrite),
									.readRegister(VMEread),
									.data(VMEdata),
									.enableReadData(ospy_readPulse_w3),
									.ro_data(ospy_word_w3)
	       			);


//-----------------------
//-- ospy_counter_mezzanine_reg     --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0011 10XX			
//0x820038																		

parameter ospy_counter_mezzanine_reg_address = 16'b1000000000001110;
gf_vme_readonly_register u_ospy_counter_mezzanine_reg	(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(ospy_counter_mezzanine_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							.enableReadData(enableRead_ospy_counter_mezzanine_reg),
      							.ro_data(ospy_counter_mezzanine)	
);
gf_vme_RWpulse_decoder ospy_counter_mezzanine_pulse
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(ospy_counter_mezzanine_reg_address),
									.writeAccess(VMEwrite),
									.readAccess(VMEread),
									.writePulse(ospy_reset_mezzanine)
//									.readPulse(readPulse)
	       			);
						 
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX11 0100 0000 0000 00XX			
// 0x834QQQ																				

parameter ospy_read_mezzanine_address = 16'b1101000000000000;
assign ospy_addr_mezzanine = VMEaddr[10:0];

gf_vme_readonly_register #(
	.WIDTH(5),
	.LSB(11)) u_ospy_read_mezzanine_reg
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(ospy_read_mezzanine_address),
									.writeRegister(VMEwrite),
									.readRegister(VMEread),
									.data(VMEdata),
									.enableReadData(ospy_readPulse_mezzanine),
									.ro_data(ospy_word_mezzanine)
	       			);


//-----------------------
//-- status_reg     --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0011 11XX			
//0x82003c

parameter status_reg_address = 16'b1000000000001111;
gf_vme_readonly_register u_status_reg
								(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(status_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							.enableReadData(enableRead_status_reg),
      							.ro_data(gf_status)	//output
     					 );


//-----------------------
//-- dcm_reg  --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0100 00XX			
//0x820040


parameter dcm_reg_address = 16'b1000000000010000;					
gf_vme_register u_dcm_reg
								(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(dcm_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							.enableReadData(enableRead_dcm_reg1),
      							.q(dcm_reg)	//output
     					 );


// VMEaddress(23 .. 20) = 1001													// da sistaemare (mp)
// VMEaddress(20 ..  2) = 0000 0000 0000 00XX XXXX			// da sistaemare (mp)
// 0xA00000																							// da sistaemare (mp)

gf_vme_RWpulse_decoder u_dcm_reg_rwdecoder
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(dcm_reg_address),
									.writeAccess(VMEwrite),
									.readAccess(VMEread),
									.writePulse(dcm_reg_write)
	       			);

//-----------------------
//-- last_50h_reg     --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0100 01XX			
//0x820044

parameter last_50h_reg_address = 16'b1000000000010001;
gf_vme_readonly_register u_last_50h_reg
								(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(last_50h_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							.enableReadData(enableRead_last_50h_reg),
      							.ro_data(last_50h)	//output
     					 );

//-----------------------
//-- chi2cut_reg  --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0100 10XX			
//0x820048


parameter chi2cut_reg_address = 16'b1000000000010010;					
gf_vme_register u_chi2cut_reg
								(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(chi2cut_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							.enableReadData(enableRead_chi2cut_reg1),
      							.q(chi2cut)	//output
     					 );

//-----------------------
//-- phioffset_w0w1_reg  --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0100 11XX			
//0x82004c


parameter phioffset_w0w1_reg_address = 16'b1000000000010011;					
gf_vme_register u_phioffset_w0w1_reg
								(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(phioffset_w0w1_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							.enableReadData(enableRead_phioffset_reg1),
      							.q(phioffset_w0w1)	//output
     					 );


//-----------------------
//-- phioffset_w0w1_reg  --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0101 00XX			
//0x820050


parameter phioffset_w2w3_reg_address = 16'b1000000000010100;					
gf_vme_register u_phioffset_w2w3_reg
								(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(phioffset_w2w3_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							.enableReadData(enableRead_phioffset2_reg1),
      							.q(phioffset_w2w3)	//output
     					 );

//-----------------------
//-- w0_status_reg     --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0101 01XX			
//0x820054

parameter w0_status_reg_address = 16'b1000000000010101;
gf_vme_readonly_register u_w0_status_reg
								(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(w0_status_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							//.enableReadData(enableRead_status_reg),
      							.ro_data(w0_status)	//output
     					 );
gf_vme_RWpulse_decoder u_w0_status_rwpulse
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(w0_status_reg_address),
									.writeAccess(VMEwrite),
									.readAccess(VMEread),
									.writePulse(clear_w0_status)
//									.readPulse(ram_readPulse)
	       			);

//-----------------------
//-- w1_status_reg     --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0101 10XX			
//0x820058

parameter w1_status_reg_address = 16'b1000000000010110;
gf_vme_readonly_register u_w1_status_reg
								(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(w1_status_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							//.enableReadData(enableRead_status_reg),
      							.ro_data(w1_status)	//output
     					 );
gf_vme_RWpulse_decoder u_w1_status_rwpulse
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(w1_status_reg_address),
									.writeAccess(VMEwrite),
									.readAccess(VMEread),
									.writePulse(clear_w1_status)
//									.readPulse(ram_readPulse)
	       			);

//-----------------------
//-- w2_status_reg     --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0101 11XX			
//0x82005C

parameter w2_status_reg_address = 16'b1000000000010111;
gf_vme_readonly_register u_w2_status_reg
								(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(w2_status_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							//.enableReadData(enableRead_status_reg),
      							.ro_data(w2_status)	//output
     					 );
gf_vme_RWpulse_decoder u_w2_status_rwpulse
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(w2_status_reg_address),
									.writeAccess(VMEwrite),
									.readAccess(VMEread),
									.writePulse(clear_w2_status)
//									.readPulse(ram_readPulse)
	       			);

//-----------------------
//-- w3_status_reg     --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0110 00XX			
//0x820060

parameter w3_status_reg_address = 16'b1000000000011000;
gf_vme_readonly_register u_w3_status_reg
								(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(w3_status_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							//.enableReadData(enableRead_status_reg),
      							.ro_data(w3_status)	//output
     					 );
gf_vme_RWpulse_decoder u_w3_status_rwpulse
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(w3_status_reg_address),
									.writeAccess(VMEwrite),
									.readAccess(VMEread),
									.writePulse(clear_w3_status)
//									.readPulse(ram_readPulse)
	       			);

//-----------------------
//-- sectors_reg     --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0110 01XX			
//0x820064

parameter sectors_reg_address = 16'b1000000000011001;
gf_vme_register u_sectors_reg
								(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(sectors_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							//.enableReadData(enableRead_status_reg),
      							.q(sectors)	//output
     					 );

//-----------------------
//-- reset_pulse       --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0110 10XX			
//0x820068


parameter reset_pulse_address = 16'b1000000000011010;
gf_vme_RWpulse_decoder reset_pulse
							(	
									.clk(slowclk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(reset_pulse_address),
									.writeAccess(VMEwrite),
									.readAccess(VMEread),
									.writePulse(reset_vme)
//									.readPulse(readPulse)
	       			);
						 
//-----------------------
//-- cdf_error_mask_reg     --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0110 11XX			
//0x82006C

parameter cdf_error_mask_reg_address = 16'b1000000000011011;
gf_vme_register u_cdf_error_mask_reg
								(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(cdf_error_mask_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							//.enableReadData(enableRead_status_reg),
      							.q(cdf_error_mask)	//output
     					 );
	 
//-----------------------
//-- svt_error_mask_reg     --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0111 00XX			
//0x820070

parameter svt_error_mask_reg_address = 16'b1000000000011100;
gf_vme_register u_svt_error_mask_reg
								(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(svt_error_mask_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							//.enableReadData(enableRead_status_reg),
      							.q(svt_error_mask)	//output
     					 );

//-----------------------
//-- error_reg         --
//-----------------------
// VMEaddress(23 .. 20) = 10XX
// VMEaddress(20 ..  2) = XX10 0000 0000 0111 01XX			
//0x820074

parameter error_reg_address = 16'b1000000000011101;
gf_vme_readonly_register u_error_reg
								(	
      							.clk(clk),
      							.init(init),
      							.address(VMEaddr),
      							.DECODE_ADDRESS(error_reg_address),
      							.writeRegister(VMEwrite),
      							.readRegister(VMEread),
      							.data(VMEdata),
      							.enableReadData(enableRead_error_reg),
      							.ro_data(error_reg)	//output
     					 );
gf_vme_RWpulse_decoder u_error_reg_rwpulse
							(	
									.clk(clk),
									.init(init),
									.address(VMEaddr),
									.DECODE_ADDRESS(error_reg_address),
									.writeAccess(VMEwrite),
									.readAccess(VMEread),
									.writePulse(clear_error_reg)
//									.readPulse(ram_readPulse)
	       			);

endmodule			// end del modulo
