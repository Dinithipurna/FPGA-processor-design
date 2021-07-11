`include "define.v"
 

module core
#(
	// Parameter Declarations
	parameter [7:0] CIDval = 8'd0
)
(
	input wire CLK,
	input [7:0] Idin,Ddin,
	input iacq,dacq,
	
	output busy,
	output [3:0] Mem_Ctrl,
	output [7:0] IAddress,DAddress, Ddout
	

);


	wire [7:0] INS,RPo,GSPo,STPo,ADDRo,MULRo,WVo,MVo,CIDo,EOPCo,ACo,CPo,BUSo,MCo;
	wire Z1,Z2;
	wire [2:0] ALU_OP;
	wire [1:0] PCtrl;
	wire [3:0] Bus_Select;
	wire [13:0] Wen,INC,RST;



 

	assign Ddout = ADDRo;

 	Control_Unit  		CU1(
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
		.iacq(iacq),
		.dacq(dacq),
		.busy(busy)
		);
 	BUS_MUX 			BUS_MSelect(
						.data0x(Ddin),
						.data1x(ADDRo),
						.data2x(MULRo),
						.data3x(WVo),
						.data4x(MCo),
						.data5x(MVo),
						.data6x(CIDo),
						.data7x(EOPCo),
						.data8x(ACo),
						.data9x(CPo),
						.data10x(RPo),
						.data11x(GSPo),
						.data12x(STPo),
						
						.sel(Bus_Select),
						.result(BUSo)
						);


						
	
 	Pointer_MUX 		Pointer_MSelect(
						.data0x(GSPo),
						.data1x(RPo),
						.data2x(CPo),
						.data3x(STPo),
						.sel(PCtrl),
						.result(DAddress)
						);	

 	Module_Reg			PCreg(
					.Wen(Wen[`RO_PC]),
					.BusOut(INS),
					.Clk(CLK),
					.RST(RST[`RO_PC]),   //Input from FPGA 
					.INC(INC[`RO_PC]),
					.dout(IAddress)
					);
		
 	Module_Reg 		IRreg(
					.Wen(1'b1),
					.BusOut(Idin),
					.Clk(CLK),
					.RST(1'b0),
					.INC(1'b0),
					.dout(INS)
					);
					
 	Module_Reg 		GSPreg(
					.Wen(Wen[`RO_GSP]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_GSP]),
					.INC(INC[`RO_GSP]),
					.dout(GSPo)
					);
					
 	Module_RP_CP 		RPreg(
					.Wen(Wen[`RO_RP]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_RP]),
					.INC(INC[`RO_RP]),
					.dout(RPo)
					);
			
 	Module_RP_CP 		CPreg(
					.Wen(Wen[`RO_CP]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_CP]),
					.INC(INC[`RO_CP]),
					.dout(CPo)
					);
					
					
 	Module_Reg 		STPreg(
					.Wen(Wen[`RO_STP]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_STP]),
					.INC(INC[`RO_STP]),
					.dout(STPo)
					);
					
					
 	Module_RegF #(CIDval) CIDreg(
					.Wen(Wen[`RO_CID]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_CID]),
					.INC(INC[`RO_CID]),
					.din(EOPCo),
					.dout(CIDo),
					.z(Z1)
					);
					
 	Module_Reg 		EOPCreg(
					.Wen(Wen[`RO_EOPC]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_EOPC]),
					.INC(INC[`RO_EOPC]),
					.dout(EOPCo)
					);
					
					
 	Module_RegF 		MCreg(
					.Wen(Wen[`RO_MC]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_MC]),
					.INC(INC[`RO_MC]),
					.din(MVo),
					.dout(MCo),
					.z(Z2)
					);
					
 	Module_Reg 		MVreg(
					.Wen(Wen[`RO_MV]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_MV]),
					.INC(INC[`RO_MV]),
					.dout(MVo)
					);
					
 	Module_Reg 		WVreg(
					.Wen(Wen[`RO_WV]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_WV]),
					.INC(INC[`RO_WV]),
					.dout(WVo)
					);
					
 	Module_Reg 		MULRreg(
					.Wen(Wen[`RO_MULR]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_MULR]),
					.INC(INC[`RO_MULR]),
					.dout(MULRo)
					);
					
					
 	Module_Reg 		ADDRreg(
					.Wen(Wen[`RO_ADDR]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_ADDR]),
					.INC(INC[`RO_ADDR]),
					.dout(ADDRo)
					);
					
 	ALU 				ALUAC(
					.Wen(Wen[`RO_AC]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_AC]),
					.INC(INC[`RO_AC]),
					.dout(ACo),
					.alu_op(ALU_OP)
					);
					

					
endmodule
					