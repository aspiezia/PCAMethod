
// 756 bits vme register (read back)
// mp 09.01.09

`timescale 1 ns / 100 ps	// mp 
module gf_vme_register756_readonly		(	clk,
															init,
															address,
															DECODE_ADDRESS,
															local_add_reg,
															readPulse,
															readRegister,
															mem_data,
															data_to_vme
								
	       									);



// input/output declaration
input clk;
input init;
input [15:0] address;  // 16 bit
input [15:0] DECODE_ADDRESS;
input [31:0] local_add_reg;
input readPulse;
input readRegister;
input [755:0] mem_data;
//output enableReadData;		// internal register address
output [31:0] data_to_vme;		// 756 bits register

// wire/reg decalaration
reg [755:0] mem_data_reg;
wire mem_data_reg_ena;
wire [7:0] mem_sel;
//wire [31:0] data;
reg [31:0] data_tmp;
wire AddressSelect;
//wire writePulse_comb;
//reg WriteVeto;
//wire WriteVeto_comb;
//reg writePulse_int;
wire ReadSelect_comb;
reg readData_int;
reg [755:0] q_int;


// signals for 756 bits register
wire [4:0] nibble;	// address of a part of 756 bits memory data

assign enableReadData = readData_int;


// menomonical
assign mem_sel = local_add_reg[7:0];
assign nibble = local_add_reg[12:8];



// logica
 
//assign writePulse_comb = AddressSelect && writeRegister &&  (~writePulse_int) && (~WriteVeto);
//
//   always @(posedge clk or posedge init)
//      if (init) begin
//        writePulse_int <= 1'b0;
//      end
//      else begin
//        writePulse_int <= writePulse_comb;
//      end 
//
//assign WriteVeto_comb = writePulse_int || (WriteVeto && writeRegister);
//
//   always @(posedge clk or posedge init)
//      if (init) begin
//        WriteVeto <= 1'b0;
//      end
//      else begin
//        WriteVeto <= WriteVeto_comb;
//      end 
      
 
  
assign ReadSelect_comb = AddressSelect && readRegister;

   always @(posedge clk or posedge init)
      if (init) begin
        readData_int <= 1'b0;
      end
      else begin
        readData_int <= ReadSelect_comb;
      end 


//comparator
assign AddressSelect = (address == DECODE_ADDRESS);




// SCRITTURA
// registro il dato che e' stato letto dalla memoria (756 bits)
assign mem_data_reg_ena = ( readPulse );

   always @(posedge clk or posedge init)
      if (init)
         mem_data_reg <= 756'b0;
      else
        if (mem_data_reg_ena)			// q_int <= data;
          mem_data_reg <= mem_data;




// LETTURA
always @ (nibble or readData_int or mem_data_reg)
				if (readData_int)			// q_int <= data;
        	case (nibble)
        		5'b00000: begin	data_tmp <= mem_data_reg[31:0];    end
        		5'b00001: begin	data_tmp <= mem_data_reg[63:32];   end
        		5'b00010: begin	data_tmp <= mem_data_reg[95:64];   end
        		5'b00011: begin	data_tmp <= mem_data_reg[127:96];  end
        		5'b00100: begin	data_tmp <= mem_data_reg[159:128]; end
        		5'b00101: begin	data_tmp <= mem_data_reg[191:160]; end
        		5'b00110: begin	data_tmp <= mem_data_reg[223:192]; end
        		5'b00111: begin	data_tmp <= mem_data_reg[255:224]; end
        		5'b01000: begin	data_tmp <= mem_data_reg[287:256]; end
        		5'b01001: begin	data_tmp <= mem_data_reg[319:288]; end
        		5'b01010: begin	data_tmp <= mem_data_reg[351:320]; end
        		5'b01011: begin	data_tmp <= mem_data_reg[383:352]; end
        		5'b01100: begin	data_tmp <= mem_data_reg[415:384]; end
        		5'b01101: begin	data_tmp <= mem_data_reg[447:416]; end
        		5'b01110: begin	data_tmp <= mem_data_reg[479:448]; end
        		5'b01111: begin	data_tmp <= mem_data_reg[511:480]; end
        		5'b10000: begin	data_tmp <= mem_data_reg[543:512]; end
        		5'b10001: begin 	data_tmp <= mem_data_reg[575:544]; end
        		5'b10010: begin 	data_tmp <= mem_data_reg[607:576]; end
        		5'b10011: begin 	data_tmp <= mem_data_reg[639:608]; end
        		5'b10100: begin 	data_tmp <= mem_data_reg[671:640]; end
        		5'b10101: begin 	data_tmp <= mem_data_reg[703:672]; end
        		5'b10110: begin 	data_tmp <= mem_data_reg[735:704]; end
        		5'b10111: begin 	data_tmp <= {13'b0000000000000, mem_data_reg[755:736]}; end
	   		default:	begin	data_tmp <= 32'bz; end
		endcase
				else data_tmp <= 32'bz;

// 3-state di lettura
assign data_to_vme = (readData_int) ? data_tmp : 32'bz;

endmodule			// end del modulo
