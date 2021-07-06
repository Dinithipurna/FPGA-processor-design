`include "define.v"
 

module singlecore(CLOCK_50,LEDG,LEDR,SW,HEX4,HEX5,HEX6,HEX7,HEX0,HEX1,HEX2,HEX3);

input CLOCK_50;
input  [17:0] SW;
output [8:0] LEDG;
output [17:0] LEDR;
output [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7;

wire CLK,busy0;
wire [2:0] dramacq;
wire [7:0] IAddress,IAddress0,IAddress1,Idin,Idin0,Idin1,DAddress,DAddress0,DAddress1;
wire [3:0] Mem_Ctrl,Mem_Ctrl0,Mem_Ctrl1;
wire [7:0] Ddin,Ddin1,Ddin0,Ddout,Ddout0,Ddout1;


wire [31:0] clkcount;

assign LEDG[8] = CLK;
assign LEDG[0] = busy0;

clkdiv clkdiv1(
    .clk(CLOCK_50),
    .rst(SW[17]),
	 .en(SW[16]),
    .clk_div(CLK),
	.busy(busy0||busy1),
	.clkcount(clkcount)
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
    .iacq(1'b1),
	.dacq(1'b1),
	.busy(busy0)
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