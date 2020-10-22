`include "define.v"
 
module Control_Unit
(
	input [7:0] INS,
	input Z1, Z2, clk,
	output reg [2:0] ALU_OP,
	output reg [3:0] Bus_Select,
	output reg [1:0] PCtrl,MEMCtrl,
	output reg [13:0] WRT_en, INC_en,RST_en
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
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'd0 ;
			end
				
				
		default: 
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'd0 ;
			end
			
		`FETCH_1:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'd0 ;
			end		
		`FETCH_2:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'b00000000000001 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b00000000000010 ;
			end			
		
		`RSTALL:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'b11111111111111 ;
				WRT_en  <= 14'd0 ;
			end
		`RSTAC:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'b10000000000000 ;
				WRT_en  <= 14'd0 ;
			end		
		`RSTADDR:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'b01000000000000 ;
				WRT_en  <= 14'd0 ;
			end		
		`RSTGSP:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'b00000000001000 ;
				WRT_en  <= 14'd0 ;
			end		
		`RSTMC:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'b00000100000000 ;
				WRT_en  <= 14'd0 ;
			end		
		`RSTCP:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'b00000000010000 ;
				WRT_en  <= 14'd0 ;
			end		
		`RSTRP:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'b00000000001000 ;
				WRT_en  <= 14'd0 ;
			end		
		`INCGSP:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'b00000000000100 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'd0 ;
			end	
		`INCAC:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'b10000000000000 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'd0 ;
			end	
		`INCCP:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'b00000000010000 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'd0 ;
			end	
		`INCRP:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'b00000000001000 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'd0 ;
			end	
		`INCMC:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'b00000100000000 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'd0 ;
			end	
		`LDADDR_1:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_READ;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'd0 ;
			end		
		`LDADDR_2:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_MEMOUT;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b01000000000000 ;
			end			
		`LDAC_1:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_READ;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'd0 ;
			end		
		`LDAC_2:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_MEMOUT;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b10000000000000 ;
			end		
		`LDMULR_1:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_READ;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'd0 ;
			end		
		`LDMULR_2:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_MEMOUT;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b00100000000000 ;
			end		
		`LDRP_1:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_RP;
				MEMCtrl <= `MEM_READ;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'd0 ;
			end		
		`LDRP_2:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_MEMOUT;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b00000000001000 ;
			end	
		`LDCP_1:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_CP;
				MEMCtrl <= `MEM_READ;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'd0 ;
			end		
		`LDCP_2:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_MEMOUT;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b00000000010000 ;
			end	
####	`STSP:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_STP;
				MEMCtrl <= `MEM_WRITE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'd0 ;
			end	
	   `ADD:
			begin
				ALU_OP <= `ALU_ADD;
				Bus_Select <= `BS_MULR;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'd0 ;
			end	
	   `MUL1:
			begin
				ALU_OP <= `ALU_MUL;
				Bus_Select <= `BS_MULR;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'd0 ;
			end	
	   `MUL2:
			begin
				ALU_OP <= `ALU_MUL;
				Bus_Select <= `BS_MV;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'd0 ;
			end	
	   `DIV:
			begin
				ALU_OP <= `ALU_DIV;
				Bus_Select <= `BS_WV;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'd0 ;
			end	
	   `MOD:
			begin
				ALU_OP <= `ALU_MOD;
				Bus_Select <= `BS_WV;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'd0 ;
			end	
	   `MSTP:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b00000000100000 ;
			end	
	   `MRP:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b00000000001000 ;
			end	
	   `MCP:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b00000000010000 ;
			end	
	   `MWV:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b00010000000000 ;
			end	
	   `MEOPC:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b00000010000000 ;
			end	
	   `MADDR:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b01000000000000 ;
			end	
	   `MCID:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b00000001000000 ;
			end			
	   `MMV:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b00001000000000 ;
			end

		`MCIDAC:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_CID;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b10000000000000 ;
			end	
		`MRPAC:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_RP;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b10000000000000 ;
			end	
		`MCPAC:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_CP;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b10000000000000 ;
			end	
	
   	`JMPZ1Y_1:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b00000000000010 ;
			end
		`JMPZ1Y_2:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b00000000000001 ;
			end		
		`JMPZ1N_1:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b00000000000010 ;
			end
		`JMPZ1N_2:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'b00000000000001 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'd0 ;
			end	
		`JMPZ2Y_1:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b00000000000010 ;
			end
		`JMPZ2Y_2:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b00000000000001 ;
			end		
		`JMPZ2N_1:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b00000000000010 ;
			end
		`JMPZ2N_2:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'b00000000000001 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'd0 ;
			end
		`JMP_1:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b00000000000010 ;
			end
		`JMP_2:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 14'd0 ;
				RST_en  <= 14'd0 ;
				WRT_en  <= 14'b00000000000001 ;	
	
	endcase
	
	end

	
endmodule

