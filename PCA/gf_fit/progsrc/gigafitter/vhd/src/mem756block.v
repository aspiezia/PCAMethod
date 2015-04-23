


`timescale 1 ns / 100 ps	// mp 
module mem756block				(	clk,
											init,
											local_add_reg,
											writePulse,
											readPulse,
											const_addr,
											const_data,
											ram_data_bus,
											tmode								
	       						);



// input/output declaration

input clk;
input init;
input [31:0] local_add_reg;
input writePulse;
input readPulse;
output [755:0] const_data;
inout [755:0] ram_data_bus;
input [7:0] const_addr;
input tmode;

wire [755:0] dout;
wire [755:0] din;
wire [7:0] mem_vme_addr;
wire [7:0] mem_sel;
wire [7:0] mem_addr;
wire we;

// menomonical
assign mem_vme_addr = local_add_reg[21:14];
assign mem_sel = local_add_reg[7:0];

//**********************
//*** Write  memory ***
//********************
parameter mem_selected = 8'b00000000; // local ram id
assign we = ( (mem_sel == mem_selected) && writePulse  );

// read memory addrss
assign mem_addr = (tmode == 1'b1) ? mem_vme_addr : const_addr;

//*************************
// Memory Instantiation ***
//*************************
assign din = ram_data_bus;

mem756 const_mem	(		.clka(clk),
								.dina(din),
								.addra(mem_addr),
								.wea(we),			// write enable
								.douta(dout)
);


//*****************************
//*** output of the memory ***
//***************************

assign const_data = dout;
assign ram_data_bus = ((mem_sel == mem_selected) && readPulse) ? dout : 756'bz;

endmodule			// end del modulo
