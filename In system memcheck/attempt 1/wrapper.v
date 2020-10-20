module wrapper(clock,out);
	input clock;
	output [7:0] out;
	
	wire [4:0] out1;
	
	counter counter1(clock,out1);
	ROM ROM1(out1,clock,out);
	
	endmodule
	