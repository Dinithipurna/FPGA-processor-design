module wrapper(clk,out);
	input clk;
	output [7:0] out;
	
	wire [7:0] out2;
	
	counter counter1(clk,out2);
	Rom Rom1(out2,clk,out);
	 
endmodule35

