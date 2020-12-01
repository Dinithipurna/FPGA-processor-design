`include "define.v"
 

module Modified(CLOCK_50,LEDG,LEDR,SW,HEX4,HEX5,HEX6,HEX7,HEX0,HEX1,HEX2,HEX3);

input CLOCK_50;
input  [17:0] SW;
output [8:0] LEDG;
output [17:0] LEDR;
output [6:0] HEX4,HEX5,HEX6,HEX7,HEX0,HEX1,HEX2,HEX3;

wire CLK,dramwren;
wire [2:0] dramacq;
wire [7:0] IAddress,IAddress0,IAddress1,Idin,Idin0,Idin1,DAddress,DAddress0,DAddress1;
wire [3:0] Mem_Ctrl,Mem_Ctrl0,Mem_Ctrl1;
wire [7:0] Ddin,Ddin1,Ddin0,Ddout,Ddout0,Ddout1;


 

assign LEDG[8] = CLK;


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
	.rden({Mem_Ctrl0[0],Mem_Ctrl1[0]}),
	.wren({Mem_Ctrl0[1],Mem_Ctrl1[1]}),
	.Address({DAddress0,DAddress1}),
	.Din({Ddout0,Ddout1}),
	.RAMq(Ddin),
	.clk(CLK),
	.acq(dramacq),
	.Dq({Ddin0,Ddin1}),
	.RAMAddress(DAddress),
	.RAMDin(Ddout),
	.RAMwren(dramwren)
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
	.acq(dramacq[0])
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
	.acq(dramacq[1])
);	
	
	
endmodule
