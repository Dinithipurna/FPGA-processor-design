`include "define.v"

module Core1(CLK,IAddress,Idin,DAddress,Ddin,ADDRo,Mem_Ctrl,Iin,Din,Iout,Dout);
//LEDG,LEDR,SW,HEX4,HEX5,HEX6,HEX7,HEX0,HEX1,HEX2,HEX3);

input CLK;
inout Iin,Din,Iout,Dout;
//input [17:0] SW;
input [7:0] Ddin,Idin;
//output [8:0] LEDG;
output [7:0] IAddress,DAddress,ADDRo;
output Mem_Ctrl;//,Iout,Dout;

//output [17:0] LEDR;
//output [6:0] HEX4,HEX5,HEX6,HEX7,HEX0,HEX1,HEX2,HEX3;

wire [7:0] INS;
wire CLK;
wire [13:0] Wen,INC,RST;


wire Z1,Z2;
wire [7:0] IRo,GSPo,RPo,CPo,STPo,CIDo,EOPCo,MCo,MVo,WVo,MULRo,ACo,BUSo;
wire [2:0] ALU_OP;
wire [1:0] PCtrl;
wire [3:0] Bus_Select;
 

//assign LEDG[8] = CLK;
//assign LEDG[2:0]  = ALU_OP;
//assign LEDG[4:3]  = PCtrl;
//assign LEDG[5] = Mem_Ctrl;
//assign LEDR[3:0]  = Bus_Select;
//
//assign LEDR[10:4] = INC[6:0];
//assign LEDR[17:11] =  Wen[13:7];


Control_Unit  CU1
(
	.INS(INS),
	.Z1(Z1), 
	.Z2(Z2),
	.clk(CLK),
	.ALU_OP(ALU_OP),
	.Bus_Select(Bus_Select),
	.PCtrl(PCtrl),
	.WRT_en(Wen), 
	.INC_en(INC),
	.RST_en(RST),
	.MEMCtrl(Mem_Ctrl),
	.Iin(Iin),
	.Din(Din),
	.Dout(Dout),
	.Iout(Iout)
);



BUS_MUX 		BUS_MSelect(
						.data0x(Ddin),
						.data10x(RPo),
						.data11x(GSPo),
						.data12x(STPo),
						.data1x(ADDRo),
						.data2x(MULRo),
						.data3x(WVo),
						.data4x(MCo),
						.data5x(MVo),
						.data6x(CIDo),
						.data7x(EOPCo),
						.data8x(ACo),
						.data9x(CPo),
						.sel(Bus_Select),
						.result(BUSo)
						);
						
	
Pointer_MUX Pointer_MSelect(
						.data0x(GSPo),
						.data1x(RPo),
						.data2x(CPo),
						.data3x(STPo),
						.sel(PCtrl),
						.result(DAddress)
						);	

 Module_Reg	PCreg(
					.Wen(Wen[`RO_PC]),
					.BusOut(INS),
					.Clk(CLK),
					.RST(RST[`RO_PC]),   //Input from FPGA 
					.INC(INC[`RO_PC]),
					.dout(IAddress)
					);
		
 Module_Reg IRreg(
					.Wen(1'b1),
					.BusOut(Idin),
					.Clk(CLK),
					.RST(1'b0),
					.INC(1'b0),
					.dout(INS)
					);
					
 Module_Reg GSPreg(
					.Wen(Wen[`RO_GSP]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_GSP]),
					.INC(INC[`RO_GSP]),
					.dout(GSPo)
					);
					
 Module_RP_CP RPreg(
					.Wen(Wen[`RO_RP]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_RP]),
					.INC(INC[`RO_RP]),
					.dout(RPo)
					);
			
 Module_RP_CP CPreg(
					.Wen(Wen[`RO_CP]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_CP]),
					.INC(INC[`RO_CP]),
					.dout(CPo)
					);
					
					
 Module_Reg STPreg(
					.Wen(Wen[`RO_STP]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_STP]),
					.INC(INC[`RO_STP]),
					.dout(STPo)
					);
					
					
 
 Module_Reg EOPCreg(
					.Wen(Wen[`RO_EOPC]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_EOPC]),
					.INC(INC[`RO_EOPC]),
					.dout(EOPCo)
					);
					
					
 Module_RegF MCreg(
					.Wen(Wen[`RO_MC]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_MC]),
					.INC(INC[`RO_MC]),
					.din(MVo),
					.dout(MCo),
					.z(Z2)
					);
					
 Module_Reg MVreg(
					.Wen(Wen[`RO_MV]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_MV]),
					.INC(INC[`RO_MV]),
					.dout(MVo)
					);
					
 Module_Reg WVreg(
					.Wen(Wen[`RO_WV]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_WV]),
					.INC(INC[`RO_WV]),
					.dout(WVo)
					);
					
 Module_Reg MULRreg(
					.Wen(Wen[`RO_MULR]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_MULR]),
					.INC(INC[`RO_MULR]),
					.dout(MULRo)
					);
					
					
 Module_Reg ADDRreg(
					.Wen(Wen[`RO_ADDR]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_ADDR]),
					.INC(INC[`RO_ADDR]),
					.dout(ADDRo)
					);
					
					
 Module_RegCID CIDreg(
					.Wen(Wen[`RO_CID]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_CID]),
					.INC(INC[`RO_CID]),
					.din(EOPCo),
					.dout(CIDo),
					.z(Z1)
					);
					
 ALU 			ALUAC(
					.Wen(Wen[`RO_AC]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_AC]),
					.INC(INC[`RO_AC]),
					.dout(ACo),
					.alu_op(ALU_OP)
					);
					

	
						
//char7 char71(INS[3:0],HEX4);
//
//char7 char72(INS[7:4],HEX5);
//
//char7 char73(ADDRo[3:0],HEX6);
//
//char7 char74(MULRo[3:0],HEX7);
//
//char7 char75(ACo[3:0],HEX0);
//char7 char76(CPo[3:0],HEX1);
//
//char7 char77(RPo[3:0],HEX2);
//char7 char78(STPo[3:0],HEX3);






endmodule
	