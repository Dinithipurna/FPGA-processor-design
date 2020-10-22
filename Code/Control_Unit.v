`include "define.v"
 
module Control_Unit
(
	input [7:0] INS,
	input Z1, Z2, clk,
	output reg [2:0] ALU_OP,
	output reg [3:0] Bus_Select,
	output reg [1:0] PCtrl,MEMCtrl,
	output reg [13:0] WRT_en,
	output reg [12:0] INC_en,RST_en
);

	reg STATE = 8'd0;
	
	always @(posedge clk)
	begin
	// x and z values are NOT treated as don't-care's
	case(STATE)
	
	
		`ENDOP:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 13'd0 ;
				RST_en  <= 13'd0 ;
				WRT_en  <= 14'd0 ;
			end
				
				
		default: 
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 13'd0 ;
				RST_en  <= 13'd0 ;
				WRT_en  <= 14'd0 ;
			end
			
		`FETCH_1:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 13'd0 ;
				RST_en  <= 13'd0 ;
				WRT_en  <= 14'd0 ;
			end		
		`FETCH_2:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 13'b1000000000000 ;
				RST_en  <= 13'd0 ;
				WRT_en  <= 14'b01000000000000 ;
			end			
		
		`RSTALL:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 13'd0 ;
				RST_en  <= 13'b1111111111111 ;
				WRT_en  <= 14'd0 ;
			end
		`RSTAC:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 13'd0 ;
				RST_en  <= 13'b0000000000001 ;
				WRT_en  <= 14'd0 ;
			end		
		`RSTADDR:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 13'd0 ;
				RST_en  <= 13'b0000000000010 ;
				WRT_en  <= 14'd0 ;
			end		
		`RSTGSP:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 13'd0 ;
				RST_en  <= 13'b0100000000000 ;
				WRT_en  <= 14'd0 ;
			end		
		`RSTMC:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 13'd0 ;
				RST_en  <= 13'b0000000100000 ;
				WRT_en  <= 14'd0 ;
			end		
		`RSTCP:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 13'd0 ;
				RST_en  <= 13'b0001000000000 ;
				WRT_en  <= 14'd0 ;
			end		
		`RSTRP:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 13'd0 ;
				RST_en  <= 13'b0010000000000 ;
				WRT_en  <= 14'd0 ;
			end		
		`INCGSP:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 13'b0100000000000 ;
				RST_en  <= 13'd0 ;
				WRT_en  <= 14'd0 ;
			end	
		`INCAC:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 13'b0000000000001 ;
				RST_en  <= 13'd0 ;
				WRT_en  <= 14'd0 ;
			end	
		`INCCP:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 13'b0001000000000 ;
				RST_en  <= 13'd0 ;
				WRT_en  <= 14'd0 ;
			end	
		`INCRP:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 13'b0010000000000 ;
				RST_en  <= 13'd0 ;
				WRT_en  <= 14'd0 ;
			end	
		`INCMC:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 13'b0000000100000 ;
				RST_en  <= 13'd0 ;
				WRT_en  <= 14'd0 ;
			end	
	
	
	
	
	
	endcase
	
	end
	






	
	
endmodule

