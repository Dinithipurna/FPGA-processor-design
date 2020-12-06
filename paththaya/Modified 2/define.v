//micro state definitions


`define ENDOP 		8'b00000000		//0 
`define FETCH_1 	8'b00000100		//4
`define FETCH_2 	8'b00000101		//5
`define NOP 		8'b00001000		//8
`define RSTALL 	8'b00001100		//12
`define RSTAC 		8'b00010000		//16
`define RSTADDR 	8'b00010100		//20
`define RSTGSP 	8'b00011000		//24
`define RSTMC 		8'b00011100		//28
`define RSTCP 		8'b00100000		//32
`define RSTRP 		8'b00100100		//36
`define INCGSP 	8'b00101000		//40
`define INCAC 		8'b00101100		//44
`define INCCP 		8'b00110000		//48
`define INCRP 		8'b00110100		//52
`define INCMC 		8'b00111000		//56
`define LDADDR_1 	8'b00111100		//60
`define LDADDR_2 	8'b00111101		//61
`define LDAC_1 	8'b01000000		//64
`define LDAC_2 	8'b01000001		//65
`define LDMULR_1 	8'b01000100		//68
`define LDMULR_2 	8'b01000101		//69
`define LDRP_1 	8'b01001000		//72
`define LDRP_2 	8'b01001001		//73
`define LDCP_1 	8'b01001100		//76
`define LDCP_2 	8'b01001101		//77
`define STSP_1 	8'b01010000		//80
//`define STSP_2 	8'b01010001		//81
`define ADD 		8'b01010100		//84
`define MUL1 		8'b01011000		//88
`define MUL2 		8'b01011100		//92
`define DIV 		8'b01100000		//96
`define MOD 		8'b01100100		//100
`define MSTP 		8'b01101000		//104
`define MRP 		8'b01101100		//108
`define MCP 		8'b01110000		//112
`define MWV 		8'b01110100		//116
`define MEOPC 		8'b01111000		//120
`define MADDR 		8'b01111100		//124
`define MCID 		8'b10000000		//128
`define MMV			8'b10000100		//132
`define MCIDAC		8'b10001000		//136
`define MRPAC		8'b10001100		//140
`define MCPAC		8'b10010000		//144
`define JMPZ1		8'b10010100		//148
`define JMPZ1Y_1 	8'b10010101		//149
`define JMPZ1Y_2	8'b10010110		//150
`define JMPZ1Y_3	8'b10010111		//151
`define JMPZ1N_1 	8'b10011000		//152
`define JMPZ1N_2	8'b10011001		//153
`define JMPZ2    	8'b10011100		//156
`define JMPZ2Y_1 	8'b10011101		//157
`define JMPZ2Y_2	8'b10011110		//158
`define JMPZ2Y_3	8'b10011111		//159
`define JMPZ2N_1 	8'b10100000		//160
`define JMPZ2N_2	8'b10100001		//161
`define JMP_1 		8'b10100100		//164
`define JMP_2		8'b10100101		//165
`define JMP_3		8'b10100110		//166
`define JMP_4		8'b10100111		//167
`define INCSTP    8'b10101000		//168
`define MSTPAC    8'b10101100		//172


//ALU operations definitions
`define ALU_NONE 3'b000
`define ALU_ADD  3'b001
`define ALU_MUL  3'b010
`define ALU_DIV  3'b011
`define ALU_MOD  3'b100



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
`define RO_CID 	6
`define RO_EOPC	7
`define RO_MC		8
`define RO_MV		9
`define RO_WV		10
`define RO_MULR	11
`define RO_ADDR	12
`define RO_AC		13


//BUS Select Definitions
`define BS_MEMOUT	4'b0000
`define BS_ADDR   4'b0001
`define BS_MULR	4'b0010
`define BS_WV		4'b0011
`define BS_MC 		4'b0100
`define BS_MV 		4'b0101
`define BS_CID		4'b0110
`define BS_EOPC	4'b0111
`define BS_AC		4'b1000
`define BS_CP		4'b1001
`define BS_RP		4'b1010
`define BS_GSP		4'b1011
`define BS_STP		4'b1100


//MEM Definition
`define MEM_IDLE		4'b0000
`define MEM_WRITE		4'b0010
`define MEM_READ		4'b0001
`define MEM_IWRITE	4'b0000
`define MEM_IREAD		4'b0100




 