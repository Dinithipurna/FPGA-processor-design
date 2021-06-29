//micro state definitions


`define ENDOP 		8'd0		//0 
`define FETCH_1 	8'd4	    //4
`define FETCH_2 	8'd5		//5
`define FETCH_3 	8'd6	    //6
`define FETCH_4 	8'd7	    //7
`define NOP 		8'd8		//8
`define RSTALL 	    8'd12		//12
`define RSTAC 		8'd16		//16
`define RSTADDR 	8'd20		//20
`define RSTGSP 	    8'd24		//24
`define RSTMC 		8'd28		//28
`define RSTCP 		8'd32		//32
`define RSTRP 		8'd36		//36
`define INCGSP 	    8'd40		//40
`define INCAC 		8'd44		//44
`define INCCP 		8'd48		//48
`define INCRP 		8'd52		//52
`define INCMC 		8'd56		//56
`define LDADDR_1 	8'd60		//60
`define LDADDR_2 	8'd61		//61
`define LDADDR_3 	8'd62		//62
`define LDADDR_4 	8'd63		//63
`define LDAC_1 	    8'd64		//64
`define LDAC_2 	    8'd65		//65
`define LDAC_3 	    8'd66		//66
`define LDAC_4 	    8'd67		//67
`define LDMULR_1 	8'd68		//68
`define LDMULR_2 	8'd69		//69
`define LDMULR_3 	8'd70		//70
`define LDMULR_4 	8'd71		//71
`define LDRP_1 	    8'd72		//72
`define LDRP_2 	    8'd73		//73
`define LDRP_3 	    8'd74		//74
`define LDRP_4 	    8'd75		//75
`define LDCP_1 	    8'd76		//76
`define LDCP_2 	    8'd77		//77
`define LDCP_3 	    8'd78		//78
`define LDCP_4 	    8'd79		//79
`define STSP_1 	    8'd80		//80
`define STSP_2 	    8'd81		//81
`define ADD 		8'd84		//84
`define MUL1 		8'd88		//88
`define MUL2 		8'd92		//92
`define DIV 		8'd96		//96
`define MOD 		8'd100		//100
`define MSTP 		8'd104		//104
`define MRP 		8'd108		//108
`define MCP 		8'd112		//112
`define MWV 		8'd116		//116
`define MEOPC 		8'd120		//120
`define MADDR 		8'd124		//124
`define MCID 		8'd128		//128
`define MMV			8'd132		//132
`define MCIDAC		8'd136		//136
`define MRPAC		8'd140		//140
`define MCPAC		8'd144		//144
`define JMPZ1		8'd148		//148
`define JMPZ1Y_1 	8'd149		//149
`define JMPZ1Y_2	8'd150		//150
`define JMPZ1Y_3	8'd151		//151
`define JMPZ1N_1 	8'd152		//152
`define JMPZ1Y_4	8'd153		//153
`define JMPZ1N_2	8'd154		//154
`define JMPZ2    	8'd156		//156
`define JMPZ2Y_1 	8'd157		//157
`define JMPZ2Y_2	8'd158		//158
`define JMPZ2Y_3	8'd159		//159
`define JMPZ2N_1 	8'd160		//160
`define JMPZ2Y_4	8'd161		//161
`define JMPZ2N_2	8'd162		//162
`define JMP_1 		8'd164		//164
`define JMP_2		8'd165		//165
`define JMP_3		8'd166		//166
`define JMP_4		8'd167		//167
`define JMP_5		8'd176		//167
`define INCSTP      8'd168		//168
`define MSTPAC      8'd172		//172


//ALU operations definitions
`define ALU_NONE 3'b000
`define ALU_ADD  3'b001
`define ALU_MUL  3'b010
`define ALU_DIV  3'b011
`define ALU_MOD  3'b100



//Busy and DOne
`define BUSY 1'b1
`define DONE 1'b0



//Pointer Control definition
`define P_GSP	2'd0
`define P_RP	2'd1
`define P_CP 	2'd2
`define P_STP	2'd3



//Register Order 
`define RO_PC		0
`define RO_IR		1
`define RO_GSP		2
`define RO_RP 		3
`define RO_CP 		4
`define RO_STP		5
`define RO_CID 	    6
`define RO_EOPC	    7
`define RO_MC		8
`define RO_MV		9
`define RO_WV		10
`define RO_MULR	    11
`define RO_ADDR	    12
`define RO_AC		13


//BUS Select Definitions
`define BS_MEMOUT	4'b0000
`define BS_ADDR     4'b0001
`define BS_MULR	    4'b0010
`define BS_WV		4'b0011
`define BS_MC 		4'b0100
`define BS_MV 		4'b0101
`define BS_CID		4'b0110
`define BS_EOPC	    4'b0111
`define BS_AC		4'b1000
`define BS_CP		4'b1001
`define BS_RP		4'b1010
`define BS_GSP		4'b1011
`define BS_STP		4'b1100


//MEM Definition
`define MEM_IDLE		4'b0000
`define MEM_WRITE		4'b0010
`define MEM_READ		4'b0001
`define MEM_IWRITE	    4'b0000
`define MEM_IREAD		4'b0100




 