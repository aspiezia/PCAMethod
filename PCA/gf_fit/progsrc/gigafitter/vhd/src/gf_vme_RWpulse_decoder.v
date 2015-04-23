


`timescale 1 ns / 100 ps	// mp 
module gf_vme_RWpulse_decoder	(
																clk,
																init,
																address,
																DECODE_ADDRESS,
																writeAccess,
																readAccess,
																writePulse,
																readPulse
								
	       											);


// input/output declaration
input clk;
input init;
input [15:0] address;  // 16 bit
input [15:0] DECODE_ADDRESS;  // da controllare la dimensione !!!!!!!!!!!!!!!!!!!!!!!!
input writeAccess;	
input readAccess;
output writePulse;
output readPulse;




wire AddressSelect;
wire writePulse_comb;
reg WriteVeto;
wire WriteVeto_comb;
reg writePulse_int;
wire ReadPulse_comb;
reg ReadVeto;
wire ReadVeto_comb;
reg ReadPulse_int;
//wire ReadSelect_comb;
//wire WriteSelect_comb;




// logica

//comparator
assign AddressSelect = (address == DECODE_ADDRESS );		



// generazione impulso di scrittura                           
assign writePulse_comb = AddressSelect && writeAccess &&  (~writePulse_int) && (~WriteVeto);  //ok

   always @(posedge clk or posedge init)		//ok
      if (init) begin
        writePulse_int <= 1'b0;
      end
      else begin
        writePulse_int <= writePulse_comb;
      end 


assign WriteVeto_comb = writePulse_int || (WriteVeto && writeAccess);	//ok

   always @(posedge clk or posedge init)
      if (init) begin
        WriteVeto <= 1'b0;
      end
      else begin
        WriteVeto <= WriteVeto_comb;
      end 
      
assign writePulse = writePulse_int;
//-------------------------------------------------------

// generazione impulso di lettura 


                           
assign ReadPulse_comb = AddressSelect && readAccess &&  (~ReadPulse_int) && (~ReadVeto);	//ok

   always @(posedge clk or posedge init)	//ok
      if (init) begin
        ReadPulse_int <= 1'b0;
      end
      else begin
        ReadPulse_int <= ReadPulse_comb;
      end 


assign ReadVeto_comb = ReadPulse_int || (ReadVeto && readAccess);	//ok

   always @(posedge clk or posedge init)	//ok
      if (init) begin
        ReadVeto <= 1'b0;
      end
      else begin
        ReadVeto <= ReadVeto_comb;
      end 

assign readPulse = ReadPulse_int;




endmodule			// end del modulo
