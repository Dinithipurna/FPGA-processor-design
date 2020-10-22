//micro state definitions


`define ENDOP 8'b000000 00
`define FETCH_1 8'b000001 00
`define FETCH_2 8'b000001 01
`define NOP 8'b000010 00
`define RSTALL 8'b000011 00
`define RSTAC 8'b000100 00
`define RSTADDR 8'b000101 00
`define RSTGSP 8'b000110 00
`define RSTMC 8'b000111 00
`define RSTCP 8'b001000 00
`define RSTRP 8'b001001 00
`define INGSP 8'b001010 00
`define INCAC 8'b001011 00
`define INCCP 8'b001100 00
`define INCRP 8'b001101 00
`define INCMC 8'b001110 00
`define LDADDR_1 8'b001111 00
`define LDADDR_2 8'b001111 01
`define LDAC_1 8'b010000 00
`define LDAC_2 8'b010000 01
`define LDMULR_1 8'b010001 00
`define LDMULR_2 8'b010001 01
`define LDRP_1 8'b010010 00
`define LDRP_2 8'b010010 01
`define LDCP_1 8'b010011 00
`define LDCP_2 8'b010011 01
`define STSP_1 8'b010100 00
`define STSP_2 8'b010100 01









//ALU operations definitions
`define ALU_NONE 3'b000
`define ALU_ADD  3'b001
`define ALU_MUL  3'b010
`define ALU_DIV  3'b011
`define ALU_MOD  3'b100



//Pointer Control definition
`define P_GSP	2'b0
`define P_RP	2'b1
`define P_CP 	2'b2
`define P_STP	2'b3



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
`define MEM_IDLE		2'b00
`define MEM_WRITE		2'b01
`define MEM_READ		2'b10




 