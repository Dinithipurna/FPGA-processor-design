module wrapper(
	address,
	clock,
	data,
	q);
	
	input	[4:0]  address;
	input	  clock;
	input	[3:0]  data;
	//input	  wren;
	output	[3:0]  q;
	
	wire [3:0] out;
	
	
	ram2 ram(address,clock,data,1'b0,out);
	regis reg1(1'b1, out, clock, 1'b0, 1'b0, q);
	
	endmodule
	