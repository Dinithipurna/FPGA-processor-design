`include "define.v"

module check(CLOCK2_50,LEDG,LEDR,SW,HEX4,HEX5,HEX6,HEX7,HEX0,HEX1,HEX2,HEX3);

input CLOCK2_50;
input  [17:0] SW;
output [8:0] LEDG;
output [17:0] LEDR;
output [6:0] HEX4,HEX5,HEX6,HEX7,HEX0,HEX1,HEX2,HEX3;

//wire [2:0] ALU_OP;
wire [1:0] PCtrl;
wire [3:0] Bus_Select;
wire [7:0] INS;
//wire Mem_Ctrl;
wire [13:0] Wen,INC,RST;
//wire [7:0] INS;
reg Iout,Dout,Iin,Din;
wire [7:0] IAddress,Idin,DAddress,Ddin,ADDRo;
wire [7:0] IAddress1,Idin1,DAddress1,Ddin1,ADDRo1,IAddress2,Idin2,DAddress2,Ddin2,ADDRo2;
wire Mem_Ctrl, Mem_Ctrl1,MemCtrl2;

assign LEDG[8] = CLK;
//assign LEDG[0]= Iout;
//assign LEDG[1]= Dout;
//assign LEDG[4:3]  = PCtrl;
//assign LEDG[5] = Mem_Ctrl;
//assign LEDR[3:0]  = Bus_Select;
//assign LEDR[5]=Iin;
//assign LEDR[6]=Din;
//assign LEDR[17:11] =  Wen[13:7];
//assign SW[7:0] =INS;
//assign SW[9]=Iin;
//assign SW[10]=Din;
assign INS=Idin;
//reg IID,DID,IID2,DID2;

clkdiv clkdiv1(
    .clk(CLOCK2_50),
    .rst(SW[17]),
	 .en(SW[16]),
    .clk_div(CLK)
    );	 
//assign IID1=Iin;
//assign IID2=Iout;
//assign DID1=Din;
//assign DID2=Dout;
	 
	Core1 RW1(CLK,IAddress1,Idin,DAddress1,Ddin,ADDRo1,Mem_Ctrl1,Iin,Din,Iout,Dout1);
	Core2 RW2(CLK,IAddress2,Idin,DAddress2,Ddin,ADDRo2,Mem_Ctrl2,Iout,Dout,Iin,Din);
	
	IRAM_Manager IRAM_MAN(
		.IAddress1(IAddress1),
		.IAddress2(IAddress2),
		.Iin(IID1),
		.Iout(IID2),
		.IAddress(IAddress),
		.CLK(CLK)
		);
		
	IRAM_Manager DRAM_MAN(
		.IAddress1(DAddress1),
		.IAddress2(DAddress2),
		.Iin(DID1),
		.Iout(DID2),
		.IAddress(DAddress),
		.CLK(CLK)
		);
		
//	IRAM_Manager DRAM_IN(
//		.IAddress1(Ddin1),
//		.IAddress2(Ddin2),
//		.Iin(Din),
//		.Iout(Dout),
//		.IAddress(Ddin),
//		.CLK(CLK)
//		);
//	IRAM_Manager IRAM_IN(
//		.IAddress1(Idin1),
//		.IAddress2(Idin2),
//		.Iin(Iin),
//		.Iout(Iout),
//		.IAddress(Idin),
//		.CLK(CLK)
//		);
	IRAM_Manager DRAM_in(
		.IAddress1(ADDRo1),
		.IAddress2(ADDRo2),
		.Iin(DID1),
		.Iout(DID2),
		.IAddress(ADDRo),
		.CLK(CLK)
		);
		
	IRAM_Manager Mem(
		.IAddress1(Mem_Ctrl1),
		.IAddress2(Mem_Ctrl2),
		.Iin(DID1),
		.Iout(DID2),
		.IAddress(Mem_Ctrl),
		.CLK(CLK)
		);

 
	IRAM IRAM1(

		.address(IAddress),

		.clock(CLK),

		.data(8'd0),

		.wren(1'b0),

		.q(Idin));
	

	DRAM DRAM1(

		.address(DAddress),

		.clock(CLK),

		.data(ADDRo),

		.wren(Mem_Ctrl),

		.q(Ddin));

//	Control_Unit  CU1
//	(
//		.INS(SW[7:0]),
//		.Z1(1'b0), 
//		.Z2(1'b1),
//		.clk(CLK),
//		.ALU_OP(ALU_OP),
//		.Bus_Select(Bus_Select),
//		.PCtrl(PCtrl),
//		.WRT_en(Wen), 
//		.INC_en(INC),
//		.RST_en(RST),
//		.MEMCtrl(Mem_Ctrl),
//		.IIn(Iin),
//		.DIn(Din),
//		.DOut(Dout),
//		.IOut(Iout)
//	);
	
char7 char71(INS[3:0],HEX4);

char7 char72(INS[7:4],HEX5);

char7 char73(Ddin[3:0],HEX0);

char7 char74(Ddin[7:4],HEX1);
	
endmodule
