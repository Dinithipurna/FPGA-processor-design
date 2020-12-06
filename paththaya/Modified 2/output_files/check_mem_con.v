module check_mem_con()




	MemController irammemc(
	.rden(SW[0],SW[1]}),
	.wren(Sw[2],SW[3]}),
	.Address(16'b1111000000001111),
	.Din(16'd0),
	.RAMq(Idin),
	.clk(CLK),
	.acq(LEDG[1:0]),
	.Dq(),
	.RAMAddress(IAddress),
	.RAMDin(Idout),
	.RAMwren(Iramwren)
);

	char7 ch0(IAddress[3:0],HEX0);
	char7 ch1(Iaddress[7:4],HEX1);