`include "define.v"
 

module Modified2(CLOCK_50,LEDG,LEDR,SW,HEX4,HEX5,HEX6,HEX7,HEX0,HEX1,HEX2,HEX3);

input CLOCK_50;
input  [17:0] SW;
output [8:0] LEDG;
output [17:0] LEDR;
output [6:0] HEX4,HEX5,HEX6,HEX7,HEX0,HEX1,HEX2,HEX3;

wire CLK;
wire [7:0] IAddress,Idin,DAddress;
wire [3:0] Mem_Ctrl;
wire [7:0] Ddin,Ddout,ACo0,IRo0;


 

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

	.wren(Mem_Ctrl[1]),

	.q(Ddin));








core #(8'd0) core0
(
	.CLK(CLK),
	.Idin(Idin),
	.Ddin(Ddin),
	.Mem_Ctrl(Mem_Ctrl),
	.IAddress(IAddress),
	.DAddress(DAddress), 
	.Ddout(Ddout),
	.acq(1'b1),
	.iacq(1'b1),
	.ACo(ACo0),
	.INS(IRo0)
);	
	
char7 ch2(IRo0[3:0],HEX2);

char7 ch3(IRo0[7:4],HEX3);

char7 ch6(ACo0[3:0],HEX0);

char7 ch7(ACo0[7:4],HEX1);
	
endmodule
