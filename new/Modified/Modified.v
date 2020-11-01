`include "define.v"
 

module Modified(CLOCK2_50,LEDG,LEDR,SW,HEX4,HEX5,HEX6,HEX7,HEX0,HEX1,HEX2,HEX3);

input CLOCK2_50;
input [17:0] SW;
output [8:0] LEDG;
output [17:0] LEDR;
output [6:0] HEX4,HEX5,HEX6,HEX7,HEX0,HEX1,HEX2,HEX3;

wire [7:0] INS;
wire divclk;
wire [7:0] IAddress,Idin;
wire [13:0] Wen,INC,RST;
wire [2:0] AP;
wire [1:0] PCT;
wire [3:0] BS;
wire MC;

wire [7:0] ACo;
wire [7:0] Ddin;

wire [7:0] WVo;



assign LEDG[8] = divclk;
assign LEDG[2:0]  = AP;
assign LEDG[4:3]  = PCT;
assign LEDG[5] = MC;
assign LEDR[3:0]  = BS;

assign LEDR[10:4] = INC[6:0];
assign LEDR[17:11] =  Wen[13:7];



Control_Unit  CU1
(
	.INS(INS),
	.Z1(1'b0), 
	.Z2(1'b0),
	.clk(divclk),
	.ALU_OP(AP),
	.Bus_Select(BS),
	.PCtrl(PCT),
	.WRT_en(Wen), 
	.INC_en(INC),
	.RST_en(RST),
	.MEMCtrl(MC)
);


IRAM IRAM1(

	.address(IAddress),

	.clock(divclk),

	.data(8'd0),

	.wren(1'b0),

	.q(Idin));
	

DRAM DRAM1(

	.address(8'd0),

	.clock(divclk),

	.data(8'd5),

	.wren(MC),

	.q(Ddin));

	
	
	
 Module_Reg IRreg(
					.Wen(1'b1),
					.BusOut(Idin),
					.Clk(divclk),
					.RST(1'b0),
					.INC(1'b0),
					.dout(INS)
					);
					
					
 Module_Reg	PCreg(
					.Wen(Wen[`RO_PC]),
					.BusOut(INS),
					.Clk(divclk),
					.RST(RST[`RO_PC]),   //Input from FPGA 
					.INC(INC[`RO_PC]),
					.dout(IAddress)
					);
	
	
Module_Reg WVreg(
					.Wen(Wen[`RO_WV]),
					.BusOut(ACo),
					.Clk(divclk),
					.RST(RST[`RO_WV]),
					.INC(INC[`RO_WV]),
					.dout(WVo)
					);	
	
clkdiv clkdiv1(
    .clk(CLOCK2_50),
    .rst(SW[17]),
	 .en(SW[16]),
    .clk_div(divclk)
    );	 

	 
 ALU 			ALUAC(
					.Wen(Wen[`RO_AC]),
					.BusOut(WVo),
					.Clk(divclk),
					.RST(RST[`RO_AC]),
					.INC(INC[`RO_AC]),
					.dout(ACo),
					.alu_op(AP)
					);
					

char7 char71(INS[3:0],HEX4);

char7 char72(INS[7:4],HEX5);

char7 char73(IAddress[3:0],HEX6);

char7 char74(IAddress[7:4],HEX7);

char7 char75(ACo[3:0],HEX0);
char7 char76(ACo[7:4],HEX1);

char7 char77(WVo[3:0],HEX2);
char7 char78(WVo[7:4],HEX3);






endmodule
