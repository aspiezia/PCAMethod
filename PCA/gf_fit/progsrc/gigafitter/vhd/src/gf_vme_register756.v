
// 600 bits vme register
// mp 09.01.09

`timescale 1 ns / 100 ps	// mp 
module gf_vme_register756		(	
	clk,
	init,
	address,
	DECODE_ADDRESS,
	local_add_reg,
	writeRegister,
	readRegister,
	ram_writePulse,
	data,
	enableReadData,
	ram_data_bus,
	reset_crc,
	crc_out
);



// input/output declaration
input clk;
input init;
input [15:0] address;  // 16 bit
input [15:0] DECODE_ADDRESS;
input [31:0] local_add_reg;
input writeRegister;		// INOUT	!!!
input readRegister;
input ram_writePulse;
inout [31:0] data;
output enableReadData;		// internal register address
inout [755:0] ram_data_bus;		// 600 bits register
input reset_crc;
output [31:0] crc_out;

// wire/reg decalaration
wire [31:0] data;
reg [31:0] data_tmp;
wire AddressSelect;
wire writePulse_comb;
reg WriteVeto;
wire WriteVeto_comb;
reg writePulse_int;
wire ReadSelect_comb;
reg readData_int;
reg [755:0] q_int;


// signals for 600 nits register
wire [4:0] nibble;	// address of a part of 600 bits memory data

assign enableReadData = readData_int;
assign nibble = local_add_reg[12:8];



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


//// crc32
//CRC32 #(.CRCINIT(32'hFFFFFFFF))
//	u_crc32(
//	.CRCCLK(clk),
//	.CRCRESET(reset_crc),
//	.CRCDATAVALID(writePulse_int),
//	.CRCIN(data),
//	.CRCDATAWIDTH(3'b111),
//	.CRCOUT(crc_out)
//);

// SCRITTURA
// registro il dato
   always @(posedge clk or posedge init)
      if (init) begin
         q_int <= 756'b0;
      end
      else begin
        if (writePulse_int)			// q_int <= data;
        	case (nibble)
        		5'b00000: begin	q_int <= {q_int[755:32],  data[31:0]}; end
        		5'b00001: begin	q_int <= {q_int[755:64],  data[31:0], q_int[31:0]};  end
        		5'b00010: begin	q_int <= {q_int[755:96],  data[31:0], q_int[63:0]};  end
        		5'b00011: begin	q_int <= {q_int[755:128], data[31:0], q_int[95:0]};  end
        		5'b00100: begin	q_int <= {q_int[755:160], data[31:0], q_int[127:0]}; end
        		5'b00101: begin	q_int <= {q_int[755:192], data[31:0], q_int[159:0]}; end
        		5'b00110: begin	q_int <= {q_int[755:224], data[31:0], q_int[191:0]}; end
        		5'b00111: begin	q_int <= {q_int[755:256], data[31:0], q_int[223:0]}; end
        		5'b01000: begin	q_int <= {q_int[755:288], data[31:0], q_int[255:0]}; end
        		5'b01001: begin	q_int <= {q_int[755:320], data[31:0], q_int[287:0]}; end
        		5'b01010: begin	q_int <= {q_int[755:352], data[31:0], q_int[319:0]}; end
        		5'b01011: begin	q_int <= {q_int[755:384], data[31:0], q_int[351:0]}; end
        		5'b01100: begin	q_int <= {q_int[755:416], data[31:0], q_int[383:0]}; end
        		5'b01101: begin	q_int <= {q_int[755:448], data[31:0], q_int[415:0]}; end
        		5'b01110: begin	q_int <= {q_int[755:480], data[31:0], q_int[447:0]}; end
        		5'b01111: begin	q_int <= {q_int[755:512], data[31:0], q_int[479:0]}; end
        		5'b10000: begin	q_int <= {q_int[755:544], data[31:0], q_int[511:0]}; end
        		5'b10001: begin	q_int <= {q_int[755:576], data[31:0], q_int[543:0]}; end
        		5'b10010: begin	q_int <= {q_int[755:608], data[31:0], q_int[575:0]}; end
        		5'b10011: begin	q_int <= {q_int[755:640], data[31:0], q_int[607:0]}; end
        		5'b10100: begin	q_int <= {q_int[755:672], data[31:0], q_int[639:0]}; end
        		5'b10101: begin	q_int <= {q_int[755:704], data[31:0], q_int[671:0]}; end
        		5'b10110: begin	q_int <= {q_int[755:736], data[31:0], q_int[703:0]}; end
        		5'b10111: begin	q_int <= {data[19:0], q_int[735:0]}; end
	   				default:	begin	q_int <= q_int; end
					endcase
			end


// dato completo in uscita
assign ram_data_bus = (ram_writePulse) ? q_int : 756'bz;

// LETTURA

always @ (nibble or readData_int or q_int)
				if (readData_int)			// q_int <= data;
        	case (nibble)
				5'b00000: begin	data_tmp <= q_int[31:0];    end
        		5'b00001: begin	data_tmp <= q_int[63:32];   end
        		5'b00010: begin	data_tmp <= q_int[95:64];   end
        		5'b00011: begin	data_tmp <= q_int[127:96];  end
        		5'b00100: begin	data_tmp <= q_int[159:128]; end
        		5'b00101: begin	data_tmp <= q_int[191:160]; end
        		5'b00110: begin	data_tmp <= q_int[223:192]; end
        		5'b00111: begin	data_tmp <= q_int[255:224]; end
        		5'b01000: begin	data_tmp <= q_int[287:256]; end
        		5'b01001: begin	data_tmp <= q_int[319:288]; end
        		5'b01010: begin	data_tmp <= q_int[351:320]; end
        		5'b01011: begin	data_tmp <= q_int[383:352]; end
        		5'b01100: begin	data_tmp <= q_int[415:384]; end
        		5'b01101: begin	data_tmp <= q_int[447:416]; end
        		5'b01110: begin	data_tmp <= q_int[479:448]; end
        		5'b01111: begin	data_tmp <= q_int[511:480]; end
        		5'b10000: begin	data_tmp <= q_int[543:512]; end
        		5'b10001: begin 	data_tmp <= q_int[575:544]; end
        		5'b10010: begin 	data_tmp <= q_int[607:576]; end
        		5'b10011: begin 	data_tmp <= q_int[639:608]; end
        		5'b10100: begin 	data_tmp <= q_int[671:640]; end
        		5'b10101: begin 	data_tmp <= q_int[703:672]; end
        		5'b10110: begin 	data_tmp <= q_int[735:704]; end
        		5'b10111: begin 	data_tmp <= {13'b0000000000000, q_int[755:736]}; end
	   		default:	begin	data_tmp <= 32'bz; end
					endcase
				else data_tmp <= 32'bz;

// 3-state di lettura
assign data = (readData_int) ? data_tmp : 32'bz;

endmodule			// end del modulo
