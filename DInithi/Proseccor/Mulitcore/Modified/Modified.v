`include "define.v"
 

module Modified(CLOCK_50,LEDG,LEDR,SW,HEX4,HEX5,HEX6,HEX7,HEX0,HEX1,HEX2,HEX3);

input CLOCK_50;
input  [17:0] SW;
output [8:0] LEDG;
output [17:0] LEDR;
output [6:0] HEX4,HEX5,HEX6,HEX7,HEX0,HEX1,HEX2,HEX3;

wire CLK,dramwren,z1,z2;
wire [1:0] dramacq,iramacq;
wire [7:0] IAddress,IAddress0,IAddress1,Idin,Idin0,Idin1,DAddress,DAddress0,DAddress1;
wire [3:0] Mem_Ctrl,Mem_Ctrl0,Mem_Ctrl1;
wire [7:0] Ddin,Ddin1,Ddin0,Ddout,Ddout0,Ddout1;
wire [7:0] ACo0,ACo1,IRo0,IRo1,STATE0,STATE1;
 

assign LEDG[8] = CLK;
assign LEDR[17:16]=dramacq;
assign LEDR[1:0]=iramacq;
assign LEDG[0]=z10;
assign LEDG[1]=z11;

clkdiv clkdiv1(
    .clk(CLOCK_50),
    .rst(SW[17]),
	 .en(SW[16]),
    .clk_div(CLK)
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

	.data(Ddout),

	.wren(dramwren),

	.q(Ddin));


MemController drammemc(
	.rden({Mem_Ctrl1[0],Mem_Ctrl0[0]}),
	.wren({Mem_Ctrl1[1],Mem_Ctrl0[1]}),
	.Address({DAddress1,DAddress0}),
	.Din({Ddout1,Ddout0}),
	.RAMq(Ddin),
	.clk(CLK),
	.acq(dramacq),
	.Dq({Ddin1,Ddin0}),
	.RAMAddress(DAddress),
	.RAMDin(Ddout),
	.RAMwren(dramwren)
);


MemController irammemc(
	.rden({Mem_Ctrl1[2],Mem_Ctrl0[2]}),
	.wren({Mem_Ctrl1[3],Mem_Ctrl0[3]}),
	.Address({IAddress1,IAddress0}),
	.Din(16'd0),
	.RAMq(Idin),
	.clk(CLK),
	.acq(iramacq),
	.Dq({Idin1,Idin0}),
	.RAMAddress(IAddress),
	.RAMDin(Idout),
	.RAMwren(Iramwren)
);


core #(8'd0) core0
(
	.CLK(CLK),
	.Idin(Idin0),
	.Ddin(Ddin0),
	.Mem_Ctrl(Mem_Ctrl0),
	.IAddress(IAddress0),
	.DAddress(DAddress0), 
	.Ddout(Ddout0),
	.acq(dramacq[0]),
	.iacq(iramacq[0]),
	.ACo(ACo0),
	.INS(IRo0),
	.Z1(z10),
	.STATE(STATE0),
);	

core #(8'd1) core1
(
	.CLK(CLK),
	.Idin(Idin1),
	.Ddin(Ddin1),
	.Mem_Ctrl(Mem_Ctrl1),
	.IAddress(IAddress1),
	.DAddress(DAddress1), 
	.Ddout(Ddout1),
	.acq(dramacq[1]),
	.iacq(iramacq[1]),
	.ACo(ACo1),
	.INS(IRo1),
	.Z1(z11),
	.STATE(STATE1)
);	

//char7 char0(dramacq,HEX0);	

//char7 char1(iramacq,HEX1);

char7 char2(IRo0[3:0],HEX2);

char7 char3(IRo0[7:4],HEX3);

char7 char4(IAddress0[3:0],HEX6);

char7 char5(IAddress0[7:4],HEX7);

char7 cha6(ACo0[3:0],HEX0);

char7 cha7(ACo0[7:4],HEX1);

char7 cha1(STATE0[3:0],HEX4);

char7 cha0(STATE0[7:4],HEX5);


endmodule
