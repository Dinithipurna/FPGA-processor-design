module read_write(address,clock,data,wren,q);
	input	[4:0]  address;
	input	  clock;
	input	[3:0]  data;
	input	  wren;
	output	[3:0]  q;
	
	RAM RAM1(address,clock,data,wren,q);

endmodule
