`include "define.v"
 

module Modified16(CLOCK_50,LEDG,LEDR,SW,HEX4,HEX5,HEX6,HEX7,HEX0,HEX1,HEX2,HEX3);

input CLOCK_50;
input  [17:0] SW;
output [8:0] LEDG;
output [17:0] LEDR;
output [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7;

wire CLK1,CLK,dramwren,iramwren,busy0,busy1,busy2,busy3,busy4,busy5,busy6,busy7,busy8,busy9,busy10,busy11,busy12,busy13,busy14,busy15;
wire [15:0] dramacq,iramacq;
wire [7:0] IAddress,IAddress0,IAddress1,IAddress2,IAddress3,IAddress4,IAddress5,IAddress6,IAddress7,IAddress8,IAddress9,IAddress10,IAddress11,
           IAddress12,IAddress13,IAddress14,IAddress15, Idin,Idin0,Idin1,Idin2,Idin3,Idin4,Idin5,Idin6,Idin7,Idin8,Idin9,Idin10,Idin11,Idin12,
			  Idin13,Idin14,Idin15,DAddress,DAddress0,DAddress1,DAddress2,DAddress3,DAddress4,DAddress5,DAddress6,DAddress7,DAddress8,DAddress9,
			  DAddress10,DAddress11,DAddress12,DAddress13,DAddress14,DAddress15;
wire [3:0] Mem_Ctrl0,Mem_Ctrl1,Mem_Ctrl2,Mem_Ctrl3,Mem_Ctrl4,Mem_Ctrl5,Mem_Ctrl6,Mem_Ctrl7,Mem_Ctrl8,Mem_Ctrl9,Mem_Ctrl10,Mem_Ctrl11,
           Mem_Ctrl12,Mem_Ctrl13,Mem_Ctrl14,Mem_Ctrl15;
wire [7:0] Ddin,Ddin15,Ddin14,Ddin13,Ddin12,Ddin11,Ddin10,Ddin9,Ddin8,Ddin7,Ddin6,Ddin5,Ddin4,Ddin3,Ddin2,Ddin1,Ddin0,Ddout,Ddout0,Ddout1,
           Ddout2,Ddout3,Ddout4,Ddout5,Ddout6,Ddout7,Ddout8,Ddout9,Ddout10,Ddout11,Ddout12,Ddout13,Ddout14,Ddout15,Idout;

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
	.busy(busy0||busy1||busy2||busy3||busy4||busy5||busy6||busy7||busy8||busy9||busy10||busy11||busy12||busy13||busy14||busy15),
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
	.rden({Mem_Ctrl15[0],Mem_Ctrl14[0],Mem_Ctrl13[0],Mem_Ctrl12[0],Mem_Ctrl11[0],Mem_Ctrl10[0],Mem_Ctrl9[0],Mem_Ctrl8[0],Mem_Ctrl7[0],Mem_Ctrl6[0],Mem_Ctrl5[0],Mem_Ctrl4[0],Mem_Ctrl3[0],Mem_Ctrl2[0],Mem_Ctrl1[0],Mem_Ctrl0[0]}),
	.wren({Mem_Ctrl15[1],Mem_Ctrl14[1],Mem_Ctrl13[1],Mem_Ctrl12[1],Mem_Ctrl11[1],Mem_Ctrl10[1],Mem_Ctrl9[1],Mem_Ctrl8[1],Mem_Ctrl7[1],Mem_Ctrl6[1],Mem_Ctrl5[1],Mem_Ctrl4[1],Mem_Ctrl3[1],Mem_Ctrl2[1],Mem_Ctrl1[1],Mem_Ctrl0[1]}),
	.Address({DAddress15,DAddress14,DAddress13,DAddress12,DAddress11,DAddress10,DAddress9,DAddress8,DAddress7,DAddress6,DAddress5,DAddress4,DAddress3,DAddress2,DAddress1,DAddress0}),
	.Din({Ddout15,Ddout14,Ddout13,Ddout12,Ddout11,Ddout10,Ddout9,Ddout8,Ddout7,Ddout6,Ddout5,Ddout4,Ddout3,Ddout2,Ddout1,Ddout0}),
	.RAMq(Ddin),
	.clk(CLK),
	.acq(dramacq),
	.Dq({Ddin15,Ddin14,Ddin13,Ddin12,Ddin11,Ddin10,Ddin9,Ddin8,Ddin7,Ddin6,Ddin5,Ddin4,Ddin3,Ddin2,Ddin1,Ddin0}),
	.RAMAddress(DAddress),
	.RAMDin(Ddout),
	.RAMwren(dramwren)
);


MemController8 irammemc(
	.rden({Mem_Ctrl15[2],Mem_Ctrl14[2],Mem_Ctrl13[2],Mem_Ctrl12[2],Mem_Ctrl11[2],Mem_Ctrl10[2],Mem_Ctrl9[2],Mem_Ctrl8[2],Mem_Ctrl7[2],Mem_Ctrl6[2],Mem_Ctrl5[2],Mem_Ctrl4[2],Mem_Ctrl3[2],Mem_Ctrl2[2],Mem_Ctrl1[2],Mem_Ctrl0[2]}),
	.wren({Mem_Ctrl15[3],Mem_Ctrl14[3],Mem_Ctrl13[3],Mem_Ctrl12[3],Mem_Ctrl11[3],Mem_Ctrl10[3],Mem_Ctrl9[3],Mem_Ctrl8[3],Mem_Ctrl7[3],Mem_Ctrl6[3],Mem_Ctrl5[3],Mem_Ctrl4[3],Mem_Ctrl3[3],Mem_Ctrl2[3],Mem_Ctrl1[3],Mem_Ctrl0[3]}),
	.Address({IAddress15,IAddress14,IAddress13,IAddress12,IAddress11,IAddress10,IAddress9,IAddress8,IAddress7,IAddress6,IAddress5,IAddress4,IAddress3,IAddress2,IAddress1,IAddress0}),
	.Din({32'd0}),
	.RAMq(Idin),
	.clk(CLK),
	.acq(iramacq),
	.Dq({Idin15,Idin14,Idin13,Idin12,Idin11,Idin10,Idin9,Idin8,Idin7,Idin6,Idin5,Idin4,Idin3,Idin2,Idin1,Idin0}),
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

core #(8'd8) core8
(
	.CLK(CLK),
	.Idin(Idin8),
	.Ddin(Ddin8),
	.Mem_Ctrl(Mem_Ctrl8),
	.IAddress(IAddress8),
	.DAddress(DAddress8), 
	.Ddout(Ddout8),
	.iacq(iramacq[8]),
	.dacq(dramacq[8]),
	.busy(busy8)
);
	

core #(8'd9) core9
(
	.CLK(CLK),
	.Idin(Idin9),
	.Ddin(Ddin9),
	.Mem_Ctrl(Mem_Ctrl9),
	.IAddress(IAddress9),
	.DAddress(DAddress9), 
	.Ddout(Ddout9),
	.iacq(iramacq[9]),
	.dacq(dramacq[9]),
	.busy(busy9)
);

core #(8'd10) core10
(
	.CLK(CLK),
	.Idin(Idin10),
	.Ddin(Ddin210),
	.Mem_Ctrl(Mem_Ctrl10),
	.IAddress(IAddress10),
	.DAddress(DAddress10), 
	.Ddout(Ddout10),
	.iacq(iramacq[10]),
	.dacq(dramacq[10]),
	.busy(busy10)
);	


core #(8'd11) core11
(
	.CLK(CLK),
	.Idin(Idin11),
	.Ddin(Ddin11),
	.Mem_Ctrl(Mem_Ctrl11),
	.IAddress(IAddress11),
	.DAddress(DAddress11), 
	.Ddout(Ddout11),
	.iacq(iramacq[11]),
	.dacq(dramacq[11]),
	.busy(busy11)
);

core #(8'd12) core12
(
	.CLK(CLK),
	.Idin(Idin12),
	.Ddin(Ddin12),
	.Mem_Ctrl(Mem_Ctrl12),
	.IAddress(IAddress12),
	.DAddress(DAddress12), 
	.Ddout(Ddout12),
	.iacq(iramacq[12]),
	.dacq(dramacq[12]),
	.busy(busy12)
);

core #(8'd13) core13
(
	.CLK(CLK),
	.Idin(Idin13),
	.Ddin(Ddin13),
	.Mem_Ctrl(Mem_Ctrl13),
	.IAddress(IAddress13),
	.DAddress(DAddress13), 
	.Ddout(Ddout13),
	.iacq(iramacq[13]),
	.dacq(dramacq[13]),
	.busy(busy13)
);

core #(8'd14) core14
(
	.CLK(CLK),
	.Idin(Idin14),
	.Ddin(Ddin14),
	.Mem_Ctrl(Mem_Ctrl14),
	.IAddress(IAddress14),
	.DAddress(DAddress14), 
	.Ddout(Ddout14),
	.iacq(iramacq[14]),
	.dacq(dramacq[14]),
	.busy(busy14)
);

core #(8'd15) core15
(
	.CLK(CLK),
	.Idin(Idin15),
	.Ddin(Ddin15),
	.Mem_Ctrl(Mem_Ctrl15),
	.IAddress(IAddress15),
	.DAddress(DAddress15), 
	.Ddout(Ddout15),
	.iacq(iramacq[15]),
	.dacq(dramacq[15]),
	.busy(busy15)
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
