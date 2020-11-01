 `include "define.v"
 

module Modified(clock,ledgr,ledred,swi);

input clock;
input [17:0] swi;
output [8:0] ledgr;
output [17:0] ledred;

wire [7:0] INS;
wire divclk;
wire [7:0] IAddress,Idin;
wire [13:0] Wen,INC,RST;
wire [2:0] AP;
wire [1:0] PCT;
wire [3:0] BS;
wire MC;





assign ledgr[8] = divclk;
assign ledgr[2:0]  = AP;
assign ledgr[4:3]  = PCT;
assign ledgr[5] = MC;
assign ledred[3:0]  = BS;

assign ledred[10:4] = INC[6:0];
assign ledred[17:11] =  RST[6:0];





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
					.BusOut(IRo),
					.Clk(divclk),
					.RST(RST[`RO_PC]),   //Input from FPGA 
					.INC(INC[`RO_PC]),
					.dout(IAddress)
					);
	
	
	
	
clkdiv clkdiv1(
    .clk(clock),
    .rst(swi[17]),
	 .en(swi[16]),
    .clk_div(divclk)
    );







endmodule
