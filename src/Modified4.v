`include "define.v"
 

module Modified4(CLOCK_50,LEDG,LEDR,SW,HEX4,HEX5,HEX6,HEX7,HEX0,HEX1,HEX2,HEX3);

input CLOCK_50;
input  [17:0] SW;
output [8:0] LEDG;
output [17:0] LEDR;
output [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7;

wire CLK1,CLK,dramwren,iramwren,busy0,busy1,busy2,busy3;
wire [3:0] dramacq,iramacq;
wire [7:0] IAddress,IAddress0,IAddress1,IAddress2,IAddress3,Idin,
			Idin0,Idin1,Idin3,Idin2,DAddress,DAddress0,DAddress1,DAddress2,DAddress3;
wire [3:0] Mem_Ctrl0,Mem_Ctrl1,Mem_Ctrl2,Mem_Ctrl3;
wire [7:0] Ddin,Ddin3,Ddin2,Ddin1,Ddin0,Ddout,Ddout0,Ddout1,Ddout2,Ddout3,Idout;

wire [31:0] clkcount;


 

assign LEDG[8] = CLK;
assign LEDG[0] = busy0;
assign LEDG[1] = busy1;
assign LEDG[2] = busy2;
assign LEDG[3] = busy3;


PLL PLL1(.inclk0(CLOCK_50),	.c0(CLK1));


clkdiv clkdiv1(
    .clk(CLK1),
    .rst(SW[17]),
	 .en(SW[16]),
    .clk_div(CLK),
	.busy(busy0||busy1||busy2||busy3),
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










MemController4 drammemc(
	.rden({Mem_Ctrl3[0],Mem_Ctrl2[0],Mem_Ctrl1[0],Mem_Ctrl0[0]}),
	.wren({Mem_Ctrl3[1],Mem_Ctrl2[1],Mem_Ctrl1[1],Mem_Ctrl0[1]}),
	.Address({DAddress3,DAddress2,DAddress1,DAddress0}),
	.Din({Ddout3,Ddout2,Ddout1,Ddout0}),
	.RAMq(Ddin),
	.clk(CLK),
	.acq(dramacq),
	.Dq({Ddin3,Ddin2,Ddin1,Ddin0}),
	.RAMAddress(DAddress),
	.RAMDin(Ddout),
	.RAMwren(dramwren)
);


MemController4 irammemc(
	.rden({Mem_Ctrl3[2],Mem_Ctrl2[2],Mem_Ctrl1[2],Mem_Ctrl0[2]}),
	.wren({Mem_Ctrl3[3],Mem_Ctrl2[3],Mem_Ctrl1[3],Mem_Ctrl0[3]}),
	.Address({IAddress3,IAddress2,IAddress1,IAddress0}),
	.Din({32'd0}),
	.RAMq(Idin),
	.clk(CLK),
	.acq(iramacq),
	.Dq({Idin3,Idin2,Idin1,Idin0}),
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


char7 C1(clkcount[3:0],HEX0);
char7 C2(clkcount[7:4],HEX1);
char7 C3(clkcount[11:8],HEX2);
char7 C4(clkcount[15:12],HEX3);


char7 C11(clkcount[19:16],HEX4);
char7 C21(clkcount[23:20],HEX5);
char7 C31(clkcount[27:24],HEX6);
char7 C41(clkcount[31:28],HEX7);





	
	
endmodule