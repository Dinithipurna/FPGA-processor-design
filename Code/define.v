//micro state definitions


`define ENDOP 8'b0




//ALU operations definitions
`define ALU_NONE 3'b0
`define ALU_ADD  3'b1
`define ALU_MUL  3'b2
`define ALU_DIV  3'b3
`define ALU_MOD  3'b4



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
`define BS_MOUT	4'b0000
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





 