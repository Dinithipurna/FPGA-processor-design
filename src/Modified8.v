`include "define.v"
 

module Modified8(CLOCK_50,LEDG,LEDR,SW,HEX4,HEX5,HEX6,HEX7,HEX0,HEX1,HEX2,HEX3);

input CLOCK_50;
input  [17:0] SW;
output [8:0] LEDG;
output [17:0] LEDR;
output [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7;

wire CLK1,CLK,dramwren,iramwren,busy0,busy1,busy2,busy3,busy4,busy5,busy6,busy7;
wire [7:0] dramacq,iramacq;
wire [7:0] IAddress,IAddress0,IAddress1,IAddress2,IAddress3,IAddress4,IAddress5,IAddress6,IAddress7,Idin,
			Idin0,Idin1,Idin2,Idin3,Idin4,Idin5,Idin6,Idin7,DAddress,DAddress0,DAddress1,DAddress2,DAddress3,DAddress4,DAddress5,DAddress6,DAddress7;
wire [3:0] Mem_Ctrl0,Mem_Ctrl1,Mem_Ctrl2,Mem_Ctrl3,Mem_Ctrl4,Mem_Ctrl5,Mem_Ctrl6,Mem_Ctrl7;
wire [7:0] Ddin,Ddin7,Ddin6,Ddin5,Ddin4,Ddin3,Ddin2,Ddin1,Ddin0,Ddout,Ddout0,Ddout1,Ddout2,Ddout3,Ddout4,Ddout5,Ddout6,Ddout7,Idout;

wire [31:0] clkcount;


 

assign LEDG[8] = CLK;
assign LEDG[0] = busy0;
assign LEDG[1] = busy1;
assign LEDG[2] = busy2;
assign LEDG[3] = busy3;
assign LEDG[4] = busy4;
assign LEDG[5] = busy5;
assign LEDG[6] = busy6;
assign LEDG[7] = busy7;


PLL PLL1(.inclk0(CLOCK_50),	.c0(CLK1));


clkdiv clkdiv1(
    .clk(CLK1),
    .rst(SW[17]),
	 .en(SW[16]),
    .clk_div(CLK),
	.busy(busy0||busy1||busy2||busy3||busy4||busy5||busy6||busy7),
	.clkcount(clkcount)
);	 

IRAM IRAM1(

	.address(IAddress),

	.clock(CLK),

	.data(8'd0),

	.wren(1'b0),

	.q(Idin)
);
	

DRAM DRAM1(

	.address(DAddress),

	.clock(CLK),

	.data(Ddout),

	.wren(dramwren),

	.q(Ddin)
);










MemController8 drammemc(
	.rden({Mem_Ctrl7[0],Mem_Ctrl6[0],Mem_Ctrl5[0],Mem_Ctrl4[0],Mem_Ctrl3[0],Mem_Ctrl2[0],Mem_Ctrl1[0],Mem_Ctrl0[0]}),
	.wren({Mem_Ctrl7[1],Mem_Ctrl6[1],Mem_Ctrl5[1],Mem_Ctrl4[1],Mem_Ctrl3[1],Mem_Ctrl2[1],Mem_Ctrl1[1],Mem_Ctrl0[1]}),
	.Address({DAddress7,DAddress6,DAddress5,DAddress4,DAddress3,DAddress2,DAddress1,DAddress0}),
	.Din({Ddout7,Ddout6,Ddout5,Ddout4,Ddout3,Ddout2,Ddout1,Ddout0}),
	.RAMq(Ddin),
	.clk(CLK),
	.acq(dramacq),
	.Dq({Ddin7,Ddin6,Ddin5,Ddin4,Ddin3,Ddin2,Ddin1,Ddin0}),
	.RAMAddress(DAddress),
	.RAMDin(Ddout),
	.RAMwren(dramwren)
);


MemController8 irammemc(
	.rden({Mem_Ctrl7[2],Mem_Ctrl6[2],Mem_Ctrl5[2],Mem_Ctrl4[2],Mem_Ctrl3[2],Mem_Ctrl2[2],Mem_Ctrl1[2],Mem_Ctrl0[2]}),
	.wren({Mem_Ctrl7[3],Mem_Ctrl6[3],Mem_Ctrl5[3],Mem_Ctrl4[3],Mem_Ctrl3[3],Mem_Ctrl2[3],Mem_Ctrl1[3],Mem_Ctrl0[3]}),
	.Address({IAddress7,IAddress6,IAddress5,IAddress4,IAddress3,IAddress2,IAddress1,IAddress0}),
	.Din({32'd0}),
	.RAMq(Idin),
	.clk(CLK),
	.acq(iramacq),
	.Dq({Idin7,Idin6,Idin5,Idin4,Idin3,Idin2,Idin1,Idin0}),
	.RAMAddress(IAddress),
	.RAMDin(Idout),
	.RAMwren(iramwren)
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
	.iacq(iramacq[0]),
	.dacq(dramacq[0]),
	.busy(busy0)
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
	.iacq(iramacq[1]),
	.dacq(dramacq[1]),
	.busy(busy1)
);

core #(8'd2) core2
(
	.CLK(CLK),
	.Idin(Idin2),
	.Ddin(Ddin2),
	.Mem_Ctrl(Mem_Ctrl2),
	.IAddress(IAddress2),
	.DAddress(DAddress2), 
	.Ddout(Ddout2),
	.iacq(iramacq[2]),
	.dacq(dramacq[2]),
	.busy(busy2)
);	


core #(8'd3) core3
(
	.CLK(CLK),
	.Idin(Idin3),
	.Ddin(Ddin3),
	.Mem_Ctrl(Mem_Ctrl3),
	.IAddress(IAddress3),
	.DAddress(DAddress3), 
	.Ddout(Ddout3),
	.iacq(iramacq[3]),
	.dacq(dramacq[3]),
	.busy(busy3)
);

core #(8'd4) core4
(
	.CLK(CLK),
	.Idin(Idin3),
	.Ddin(Ddin3),
	.Mem_Ctrl(Mem_Ctrl4),
	.IAddress(IAddress4),
	.DAddress(DAddress4), 
	.Ddout(Ddout4),
	.iacq(iramacq[4]),
	.dacq(dramacq[4]),
	.busy(busy4)
);

core #(8'd5) core5
(
	.CLK(CLK),
	.Idin(Idin5),
	.Ddin(Ddin5),
	.Mem_Ctrl(Mem_Ctrl5),
	.IAddress(IAddress5),
	.DAddress(DAddress5), 
	.Ddout(Ddout5),
	.iacq(iramacq[5]),
	.dacq(dramacq[5]),
	.busy(busy5)
);

core #(8'd6) core6
(
	.CLK(CLK),
	.Idin(Idin6),
	.Ddin(Ddin6),
	.Mem_Ctrl(Mem_Ctrl6),
	.IAddress(IAddress6),
	.DAddress(DAddress6), 
	.Ddout(Ddout6),
	.iacq(iramacq[6]),
	.dacq(dramacq[6]),
	.busy(busy6)
);

core #(8'd7) core7
(
	.CLK(CLK),
	.Idin(Idin7),
	.Ddin(Ddin7),
	.Mem_Ctrl(Mem_Ctrl7),
	.IAddress(IAddress7),
	.DAddress(DAddress7), 
	.Ddout(Ddout7),
	.iacq(iramacq[7]),
	.dacq(dramacq[7]),
	.busy(busy7)
);


char7 C1(clkcount[3:0],HEX0);
char7 C2(clkcount[7:4],HEX1);
char7 C3(clkcount[11:8],HEX2);
char7 C4(clkcount[15:12],HEX3);


char7 C11(clkcount[19:16],HEX4);
char7 C21(clkcount[23:20],HEX5);
char7 C31(clkcount[27:24],HEX6);
char7 C41(clkcount[31:28],HEX7);





	
	
endmodule
