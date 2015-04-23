


`timescale 1 ns / 100 ps	// mp 
module gf_vme_register		(	clk,
														init,
														address,
														DECODE_ADDRESS,
														writeRegister,
														readRegister,
														data,
														enableReadData,
														q
								
	       									);



// input/output declaration
input clk;
input init;
input [15:0] address;  // 16 bit
input [15:0] DECODE_ADDRESS;  // da controllare la dimensione !!!!!!!!!!!!!!!!!!!!!!!!
input writeRegister;		// INOUT	!!!
input readRegister;
inout [31:0] data;
output enableReadData;		// internal register address
output [31:0] q;

// wire/reg decalaration
wire AddressSelect;
wire writePulse_comb;
reg WriteVeto;
wire WriteVeto_comb;
reg writePulse_int;
wire ReadSelect_comb;
reg readData_int;
reg [31:0] q_int;


assign enableReadData = readData_int;



// logica
 
assign writePulse_comb = AddressSelect && writeRegister &&  (~writePulse_int) && (~WriteVeto);

   always @(posedge clk or posedge init)
      if (init) begin
        writePulse_int <= 1'b0;
      end
      else begin
        writePulse_int <= writePulse_comb;
      end 

assign WriteVeto_comb = writePulse_int || (WriteVeto && writeRegister);

   always @(posedge clk or posedge init)
      if (init) begin
        WriteVeto <= 1'b0;
      end
      else begin
        WriteVeto <= WriteVeto_comb;
      end 
      
 
  
assign ReadSelect_comb = AddressSelect && readRegister;

   always @(posedge clk or posedge init)
      if (init) begin
        readData_int <= 1'b0;
      end
      else begin
        readData_int <= ReadSelect_comb;
      end 


//comparator
assign AddressSelect = (address == DECODE_ADDRESS);		//va bene? come viene sintetizzato?

// registro il dato

   always @(posedge clk or posedge init)
      if (init) begin
         q_int <= 32'b0;
      end
      else begin
        if (writePulse_int) q_int <= data;
      end 

assign q = q_int;


// tri-state
assign data = (readData_int) ? q_int : 32'bz;

endmodule			// end del modulo
