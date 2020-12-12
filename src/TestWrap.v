
module TestWrap(CLOCK_50,LEDG,LEDR,SW,HEX4,HEX5,HEX6,HEX7,HEX0,HEX1,HEX2,HEX3);

input CLOCK_50;
input  [17:0] SW;
output [8:0] LEDG;
output [17:0] LEDR;
output [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7;


wire CLK,dramwren;
wire [1:0] dramacq;
wire [7:0] IAddress,IAddress0,IAddress1,Idin,Idin0,Idin1,DAddress,DAddress0,DAddress1;
wire [3:0] Mem_Ctrl,Mem_Ctrl0,Mem_Ctrl1;
wire [7:0] Ddin,Ddin1,Ddin0,Ddout,Ddout0,Ddout1;



clkdiv clkdiv1(
    .clk(CLOCK_50),
    .rst(SW[17]),
	 .en(SW[16]),
    .clk_div(CLK)
    );	 

assign LEDG[8] = CLK;

DRAM DRAM1(

	.address(DAddress),

	.clock(CLK),

	.data(Ddout),

	.wren(dramwren),

	.q(Ddin));



MemController drammemc(
	.rden({SW[2],SW[0]}),
	.wren({SW[3],SW[1]}),
	.Address({4'd0,SW[11:8],4'd0,SW[7:4]}),
	.Din({6'd0,SW[15:14],6'd0,SW[13:12]}),
	.RAMq(Ddin),
	.clk(CLK),
	.acq(dramacq),
	.Dq({Ddin1,Ddin0}),
	.RAMAddress(DAddress),
	.RAMDin(Ddout),
	.RAMwren(dramwren)
);


assign LEDG[1:0] = dramacq;
assign LEDG[2] = dramwren;


char7 C1(DAddress[3:0],HEX0);
char7 C2(DAddress[7:4],HEX1);
char7 C3(Ddin[3:0],HEX2);
char7 C4(Ddin[7:4],HEX3);


char7 C11(Ddin0[3:0],HEX4);
char7 C21(Ddin0[7:4],HEX5);
char7 C31(Ddin1[3:0],HEX6);
char7 C41(Ddin1[7:4],HEX7);




endmodule


