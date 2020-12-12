`include "define.v"
 

module Modified3(CLOCK_50,LEDG,LEDR,SW,HEX4,HEX5,HEX6,HEX7,HEX0,HEX1,HEX2,HEX3);

input CLOCK_50;
input  [17:0] SW;
output [8:0] LEDG;
output [17:0] LEDR;
output [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7;

wire CLK,dramwren,iramwren;
wire [2:0] dramacq,iramacq;
wire [7:0] IAddress,IAddress0,IAddress1,IAddress2,Idin,Idin0,Idin1,Idin2,DAddress,DAddress0,DAddress1,DAddress2;
wire [3:0] Mem_Ctrl0,Mem_Ctrl1,Mem_Ctrl2;
wire [7:0] Ddin,Ddin2,Ddin1,Ddin0,Ddout,Ddout0,Ddout1,Ddout2,Idout;


 

assign LEDG[8] = CLK;
assign LEDG[2:0] = Mem_Ctrl0[2:0];
assign LEDG[5:3] = Mem_Ctrl1[2:0];
assign LEDG[7:6] = dramacq[1:0];
assign LEDR[1:0] = iramacq[1:0];


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

	.q(Idin)
);
	

DRAM DRAM1(

	.address(DAddress),

	.clock(CLK),

	.data(Ddout),

	.wren(dramwren),

	.q(Ddin)
);










MemController3 drammemc(
	.rden({Mem_Ctrl2[0],Mem_Ctrl1[0],Mem_Ctrl0[0]}),
	.wren({Mem_Ctrl2[1],Mem_Ctrl1[1],Mem_Ctrl0[1]}),
	.Address({DAddress2,DAddress1,DAddress0}),
	.Din({Ddout2,Ddout1,Ddout0}),
	.RAMq(Ddin),
	.clk(CLK),
	.acq(dramacq),
	.Dq({Ddin2,Ddin1,Ddin0}),
	.RAMAddress(DAddress),
	.RAMDin(Ddout),
	.RAMwren(dramwren)
);


MemController3 irammemc(
	.rden({Mem_Ctrl2[2],Mem_Ctrl1[2],Mem_Ctrl0[2]}),
	.wren({Mem_Ctrl2[3],Mem_Ctrl1[3],Mem_Ctrl0[3]}),
	.Address({IAddress2,IAddress1,IAddress0}),
	.Din({8'd0,8'd0,8'd0}),
	.RAMq(Idin),
	.clk(CLK),
	.acq(iramacq),
	.Dq({Idin2,Idin1,Idin0}),
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
	.dacq(dramacq[0])
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
	.dacq(dramacq[1])
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
	.dacq(dramacq[2])
);	


char7 C1(IAddress[3:0],HEX0);
char7 C2(IAddress[7:4],HEX1);
char7 C3(Idin[3:0],HEX2);
char7 C4(Idin[7:4],HEX3);


char7 C11(DAddress[3:0],HEX4);
char7 C21(DAddress[7:4],HEX5);
char7 C31(Ddin[3:0],HEX6);
char7 C41(Ddin[7:4],HEX7);





	
	
endmodule
