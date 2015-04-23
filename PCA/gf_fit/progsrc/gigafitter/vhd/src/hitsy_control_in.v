`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:28:40 02/14/2009 
// Design Name: 
// Module Name:    hitsy_control_in 
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
module hitspy_control_in(DV, hitmap, reset, clock, CE_R1, CE_R2, CE_R3, CE_R4, CE_R5, CE_R6, CE_COPY, CE_COPY2, MH1, MH2, MH3, MH4, MH5);
    parameter WAIT = 3'b000;
	 parameter WRITE1 = 3'b001;
	 parameter WRITE2 = 3'b010;
	 parameter WRITE3 = 3'b011;
	 parameter WRITE4 = 3'b100;
	 parameter WRITE5 = 3'b101;
	 parameter WRITE6 = 3'b110;
	 parameter WRITE7 = 3'b111;
	
	 
    input [4:0] hitmap;
	 input DV;
    input clock;
    input reset;
	 output CE_R1, CE_R2, CE_R3, CE_R4, CE_R5, CE_R6, CE_COPY, CE_COPY2;
	 output MH1, MH2, MH3, MH4, MH5;
	 reg [2:0] current_state = WAIT;
	 reg [2:0] next_state;
    reg [2:0] count;
	 wire reset_count;
	 
	 // two clock hitmap shift
	 reg [4:0] hitmap_buf1;
	 reg [4:0] hitmap_buf2;
	 always @(posedge clock)
	 begin
		if(reset) begin
			hitmap_buf1 <= 5'b00000;
			hitmap_buf2 <= 5'b00000;
		end else begin
			hitmap_buf1 <= hitmap;
			hitmap_buf2 <= hitmap_buf1;
		end
	 end
	  
	 assign CE_R1 = (current_state == WRITE1);
	 assign CE_R2 = (current_state == WRITE2);
	 assign CE_R3 = (current_state == WRITE3);
	 assign CE_R4 = (current_state == WRITE4);
	 assign CE_R5 = (current_state == WRITE5);
	 assign CE_R6 = (current_state == WRITE6);
	 assign CE_COPY = (current_state == WRITE7);
	 assign CE_COPY2 = (count == 3'b110);
	 assign reset_count = (current_state == WRITE7);
	 
	 assign MH1 = (~hitmap_buf2[0]);
	 assign MH2 = (~hitmap_buf2[1]);
	 assign MH3 = (~hitmap_buf2[2]);
	 assign MH4 = (~hitmap_buf2[3]);
	 assign MH5 = (~hitmap_buf2[4]);
	 
	 
	 always @(posedge clock)
	  begin
	    if(reset) 
		    current_state <= WAIT;
		  else
         current_state <= next_state; 		  	   
		 end
    
	 
	 /*always @(posedge clock)
	 begin
		if(reset | reset_count) count <= 3'b000;
		else if (count != 3'b110) count <= count + 1;
		else count <= count;
	 end*/
	 
	  
	 always @(posedge clock)
	 begin
		if(reset) count <= 3'b000;
	   else if (reset_count) count <= 3'b001;
		else if (count != 3'b111) count <= count + 1;
		else count <= count;
	 end
	 
	
	 
	 
	 always @(current_state or DV or hitmap_buf2)
      begin
       case(current_state)
		  WAIT: begin
		         if(DV)
					 begin
		           if(hitmap_buf2[0]) next_state = WRITE1;
					  else next_state = WRITE2;
					 end
               else next_state = WAIT;					 
		        end  
		  WRITE1 : begin 
		            if(hitmap_buf2[1]) next_state = WRITE2;
						else next_state = WRITE3;
                 end
		  WRITE2 : begin
		            if(hitmap_buf2[2]) next_state = WRITE3;
						else next_state = WRITE4;
                 end
        WRITE3 : begin
		            if(hitmap_buf2[3]) next_state = WRITE4;
						else next_state = WRITE5;
                 end
        WRITE4 : begin
		            if(hitmap_buf2[4]) next_state = WRITE5;
						else next_state = WRITE6;
                 end
        WRITE5 : begin
		            next_state = WRITE6;
                 end
		  WRITE6: next_state = WRITE7;
        WRITE7: begin
		            if(~DV) next_state = WAIT;
						else 
						 begin
						  if(hitmap_buf2[0]) next_state = WRITE1;
						  else next_state = WRITE2;
						 end
                 end
        default: next_state = WAIT;					  
       endcase
		end
		
		

endmodule
