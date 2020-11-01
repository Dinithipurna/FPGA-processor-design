`include "define.v"
 
module Control_Unit
(
	input [7:0] INS,
	input Z1, Z2, clk,
	output reg [2:0] ALU_OP = `ALU_NONE,
	output reg [3:0] Bus_Select = `BS_MEMOUT,
	output reg [1:0] PCtrl = `P_GSP,
	output reg [13:0] WRT_en = 14'd0, INC_en=14'd0,RST_en=14'd0,
	output reg MEMCtrl = 1'd0
);

	reg [7:0] STATE    = `FETCH_1;
	reg [7:0] NXTSTATE = `FETCH_1;
	
	
	
	always@(negedge clk)
	begin
	STATE<=NXTSTATE;
	case(STATE)
	
	
		`ENDOP:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`ENDOP;			
			end
				
			
		`FETCH_1:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_EOPC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`FETCH_2;
			end
			
		`FETCH_2:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'b00000000000001 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b00000000000010 ;
				NXTSTATE		<=		INS;
			end			
		
		`RSTALL:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'b11111111111100 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
		`RSTAC:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'b10000000000000 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
		`RSTADDR:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'b01000000000000 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
		`RSTGSP:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'b00000000001000 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
		`RSTMC:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'b00000100000000 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
		`RSTCP:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'b00000000010000 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
		`RSTRP:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'b00000000001000 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
		`INCGSP:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'b00000000000100 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
		`INCAC:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'b10000000000000 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
		`INCCP:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'b00000000010000 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
		`INCRP:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'b00000000001000 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`FETCH_1;
			end	
		`INCMC:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'b00000100000000 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
		`LDADDR_1:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_READ;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`LDADDR_2;
			end
			
		`LDADDR_2:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_MEMOUT;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b01000000000000 ;
				NXTSTATE		<=		`FETCH_1;	
			end
			
		`LDAC_1:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_READ;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`LDAC_2;
			end
			
		`LDAC_2:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_MEMOUT;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b10000000000000 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
		`LDMULR_1:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_READ;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`LDMULR_2;
				end
				
		`LDMULR_2:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_MEMOUT;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b00100000000000 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
		`LDRP_1:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_RP;
				MEMCtrl 		<= 	`MEM_READ;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`LDRP_2;
			end
			
		`LDRP_2:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_MEMOUT;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b00000000001000 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
		`LDCP_1:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_CP;
				MEMCtrl 		<= 	`MEM_READ;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`LDCP_2;
			end
			
		`LDCP_2:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_MEMOUT;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b00000000010000 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
		`STSP:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_STP;
				MEMCtrl 		<= 	`MEM_WRITE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
	   `ADD:begin
				ALU_OP 		<= 	`ALU_ADD;
				Bus_Select 	<= 	`BS_ADDR;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
	   `MUL1:begin
				ALU_OP 		<= 	`ALU_MUL;
				Bus_Select 	<= 	`BS_MULR;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
	   `MUL2:begin
				ALU_OP 		<= 	`ALU_MUL;
				Bus_Select 	<= 	`BS_MV;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
	   `DIV:begin
				ALU_OP 		<= 	`ALU_DIV;
				Bus_Select 	<= 	`BS_WV;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
	   `MOD:begin
				ALU_OP 		<= 	`ALU_MOD;
				Bus_Select 	<= 	`BS_WV;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
	   `MSTP:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b00000000100000 ;
				NXTSTATE		<=		`FETCH_1;
			end	
			
	   `MRP:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b00000000001000 ;
				NXTSTATE		<=		`FETCH_1;
			end	
			
	   `MCP:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b00000000010000 ;
				NXTSTATE		<=		`FETCH_1;
			end	
			
	   `MWV:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b00010000000000 ;
				NXTSTATE		<=		`FETCH_1;
			end	
			
	   `MEOPC:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b00000010000000 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
	   `MADDR:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b01000000000000 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
	   `MCID:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b00000001000000 ;
				NXTSTATE		<=		`FETCH_1;
			end	
			
	   `MMV:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b00001000000000 ;
				NXTSTATE		<=		`FETCH_1;
			end

		`MCIDAC:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_CID;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b10000000000000 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
		`MRPAC:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_RP;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b10000000000000 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
		`MCPAC:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_CP;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b10000000000000 ;
				NXTSTATE		<=		`FETCH_1;
			end
		
		`JMPZ1 : begin
				if(Z1==1)
					NXTSTATE		<=		`JMPZ1Y_1;
				else
					NXTSTATE		<=		`JMPZ1N_1;
				end
				
	
   	`JMPZ1Y_1:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b00000000000010 ;
				NXTSTATE		<=		`JMPZ1Y_2;
			end
			
		`JMPZ1Y_2:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b00000000000001 ;
//				WRT_en  		<= 	(14'd1 << `RO_PC) ;
				NXTSTATE		<=		`FETCH_1;
			end
			
		`JMPZ1N_1:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b00000000000010 ;
				NXTSTATE		<=		`JMPZ1N_2;	
			end
			
			
		`JMPZ1N_2:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'b00000000000001 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
		`JMPZ2 : begin
				if(Z2==1)
					NXTSTATE		<=		`JMPZ2Y_1;
				else
					NXTSTATE		<=		`JMPZ2N_1;
				end
			
		`JMPZ2Y_1:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b00000000000010 ;
				NXTSTATE		<=		`JMPZ2Y_2;
			end
			
		`JMPZ2Y_2:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b00000000000001 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
		`JMPZ2N_1:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b00000000000010 ;
				NXTSTATE		<=		`JMPZ2N_2;
			end
			
		`JMPZ2N_2:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'b00000000000001 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'd0 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
		`JMP_1:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b00000000000010 ;
				NXTSTATE		<=		`JMP_2;
			end
			
		`JMP_2:begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'b00000000000001 ;
				NXTSTATE		<=		`FETCH_1;
			end
			
		default: begin
				ALU_OP 		<= 	`ALU_NONE;
				Bus_Select 	<= 	`BS_AC;
				PCtrl  		<= 	`P_GSP;
				MEMCtrl 		<= 	`MEM_IDLE;
				INC_en  		<= 	14'd0 ;
				RST_en  		<= 	14'd0 ;
				WRT_en  		<= 	14'd0 ;
			end
	
	endcase
	end

	
endmodule

