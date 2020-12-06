module proc(SW,LEDG,CLOCK2_50);
	input [17:0] SW;
	output [8:0] LEDG;
	input CLOCK2_50;
	
	wire CLK;
	wire [7:0] IAddress,Idin,DAddress,Ddin,ADDRo;
	wire [7:0] IAddress1,Idin1,DAddress1,Ddin1,ADDRo1,IAddress2,Idin2,DAddress2,Ddin2,ADDRo2;
	wire Mem_Ctrl, Mem_Ctrl1,MemCtrl2;
	assign LEDG[8] = CLK;
	
	wire Iin,Din,Dout,Iout;
	
	
	Core1 RW1(CLK,IAddress1,Idin1,DAddress1,Ddin1,ADDRo1,Mem_Ctrl1,Iin,Din,Iout,Dout);
	Core2 RW2(CLK,IAddress2,Idin2,DAddress2,Ddin2,ADDRo2,Mem_Ctrl2,Iout,Dout,Iin,Din);

	
	IRAM_Manager IRAM_MAN(
		.IAddress1(IAddress1),
		.IAddress2(IAddress2),
		.Iin(Iin),
		.Iout(Iout),
		.IAddress(IAddress),
		.CLK(CLK)
		);
		
	IRAM_Manager DRAM_MAN(
		.IAddress1(DAddress1),
		.IAddress2(DAddress2),
		.Iin(Din),
		.Iout(Dout),
		.IAddress(DAddress),
		.CLK(CLK)
		);
		
	IRAM_Manager DRAM_IN(
		.IAddress1(Ddin1),
		.IAddress2(Ddin2),
		.Iin(Din),
		.Iout(Dout),
		.IAddress(Ddin),
		.CLK(CLK)
		);
	IRAM_Manager IRAM_IN(
		.IAddress1(Idin1),
		.IAddress2(Idin2),
		.Iin(Iin),
		.Iout(Iout),
		.IAddress(Idin),
		.CLK(CLK)
		);
	IRAM_Manager DRAM_in(
		.IAddress1(ADDRo1),
		.IAddress2(ADDRo2),
		.Iin(Din),
		.Iout(Dout),
		.IAddress(ADDRo),
		.CLK(CLK)
		);
		
	IRAM_Manager Mem(
		.IAddress1(Mem_Ctrl1),
		.IAddress2(Mem_Ctrl2),
		.Iin(Din),
		.Iout(Dout),
		.IAddress(Mem_Ctrl),
		.CLK(CLK)
		);
	
//	buffer_iobuf_out_k5t buf1
//	( 
//	.datain(DAddress1),
//	.dataout(DAddress),
//	.oe(Din)) ;
//	
//	buffer_iobuf_out_k5t buf2
//	( 
//	.datain(DAddress2),
//	.dataout(DAddress),
//	.oe(Dout)) ;
//	
//	buffer_iobuf_out_k5t buf3
//	( 
//	.datain(IAddress1),
//	.dataout(IAddress),
//	.oe(Iin)) ;
//	
//	buffer_iobuf_out_k5t buf4
//	( 
//	.datain(IAddress2),
//	.dataout(IAddress),
//	.oe(Iout)) ;
	
	clkdiv clkdiv1(
		.clk(CLOCK2_50),
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

		.data(ADDRo),

		.wren(Mem_Ctrl),

		.q(Ddin));

endmodule 
