module check_mem_con(
input CLOCK_50,
input [17:0] SW,
output [8:0]LEDG,
output[6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7
);


wire [7:0] IAddress,Idout;
wire [15:0] Idin;
wire CLK;

assign LEDG[8] = CLK;

clkdiv clkdiv1(
    .clk(CLOCK_50),
    .rst(SW[17]),
	 .en(SW[16]),
    .clk_div(CLK)
    );	 

	 
	MemController irammemc(
	.rden({SW[0],SW[1]}),
	.wren({SW[2],SW[3]}),
	.Address(16'b1111000000001111),
	.Din(16'b1111000000001111),
	.RAMq(SW[12:5]),
	.clk(CLK),
	.acq(LEDG[1:0]),
	.Dq(Idin),
	.RAMAddress(IAddress),
	.RAMDin(Idout),
	.RAMwren(LEDG[7])
);

	char7 ch0(IAddress[3:0],HEX0);
	char7 ch1(IAddress[7:4],HEX1);
	char7 ch2(Idout[3:0],HEX2);
	char7 ch3(Idout[7:4],HEX3);
	char7 ch4(Idin[3:0],HEX4);
	char7 ch5(Idin[7:4],HEX5);
	char7 ch6(Idin[11:8],HEX6);
	char7 ch7(Idin[15:12],HEX7);
	
	
endmodule
