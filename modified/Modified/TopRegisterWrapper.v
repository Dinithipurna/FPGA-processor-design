 `include "define.v"
 
 module TopRegisterWrapper(MEMCtrl,DAddress,Ddout,Ddin,IAddress,Idin,CLK);
 
 
 output wire MEMCtrl;
 output wire [7:0] DAddress,Ddout,IAddress;
 input [7:0] Ddin,Idin;
 input CLK;
 
 wire [15:0] INC,RST,Wen;
 wire Z1,Z2;
 wire [7:0] IRo,GSPo,RPo,CPo,STPo,CIDo,EOPCo,MCo,MVo,WVo,MULRo,ADDRo,ACo,BUSo;
 wire [2:0] ALU_OP;
 wire	[1:0] PCtrl;
 wire [3:0] Bus_Select;
 
 
 Module_Reg	PCreg(
					.Wen(Wen[`RO_PC]),
					.BusOut(IRo),
					.Clk(CLK),
					.RST(RST[`RO_PC]),
					.INC(INC[`RO_PC]),
					.dout(IAddress)
					);
					
 Module_Reg IRreg(
					.Wen(Wen[`RO_IR]),
					.BusOut(Idin),
					.Clk(CLK),
					.RST(RST[`RO_IR]),
					.INC(INC[`RO_IR]),
					.dout(IRo)
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
					
					
 Module_RegF CIDreg(
					.Wen(Wen[`RO_CID]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_CID]),
					.INC(INC[`RO_CID]),
					.din(EOPCo),
					.dout(CIDo),
					.z(Z1)
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
					
 ALU 			ALUAC(
					.Wen(Wen[`RO_AC]),
					.BusOut(BUSo),
					.Clk(CLK),
					.RST(RST[`RO_AC]),
					.INC(INC[`RO_AC]),
					.dout(ACo),
					.alu_op(ALU_OP)
					);
					
					
	assign	Ddout = ADDRo;
	
	
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
	
	
	Control_Unit	Control_Unit1(
								.INS(IRo),
								.Z1(Z1), 
								.Z2(Z2), 
								.clk(CLK),
								.ALU_OP(ALU_OP),
								.Bus_Select(Bus_Select),
								.PCtrl(PCtrl),
								.MEMCtrl(MEMCtrl),
								.INC_en(INC),
								.RST_en(RST),
								.WRT_en(Wen)
							);
					
					
					
					
				

					
	
					
 
 
 

 
 
 
 
 endmodule
 