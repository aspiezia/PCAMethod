


`timescale 1 ns / 100 ps	// mp 
module mem8block				(	clk,
											init,
											local_add_reg,
											writePulse,
											readPulse,
											const_full_addr,
											const_addr,
											ram_data_bus,
											tmode								
	       						);



// input/output declaration

input clk;
input init;
input [31:0] local_add_reg;
input writePulse;
input readPulse;
inout [755:0] ram_data_bus;
input [12:0] const_full_addr;
output [7:0] const_addr;
input tmode;

wire [7:0] dout;
wire [7:0] din;
wire [12:0] mem_vme_addr;
wire [7:0] mem_sel;
wire [12:0] mem_addr;
wire we;

// menomonical
assign mem_vme_addr = local_add_reg[26:14];
assign mem_sel = local_add_reg[7:0];

//**********************
//*** Write  memory ***
//********************
parameter mem_selected = 8'b00000000; // local ram id
assign we = ( (mem_sel == mem_selected) && writePulse  );

// read memory addrss
assign mem_addr = (tmode == 1'b1) ? mem_vme_addr : const_full_addr;

//*************************
// Memory Instantiation ***
//*************************
assign din = ram_data_bus[7:0];

mem8 make_addr_mem	(	.clka(clk),
								.dina(din),
								.addra(mem_addr),
								.wea(we),			// write enable
								.douta(dout)
);


//*****************************
//*** output of the memory ***
//***************************

assign const_addr = dout;
assign ram_data_bus = ((mem_sel == mem_selected) && readPulse) ? {748'b0,dout} : 756'bz;

endmodule			// end del modulo
