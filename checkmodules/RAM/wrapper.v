module wrapper(
	rst,
	en,
	address,
	clock,
	data,
	wren,
	rden,
	q,
	clk_div);
	
	input [4:0] address;
	input [3:0] data;
	input clock,rst,en,wren,rden;
	output [3:0] q;
	output clk_div;
	
	wire clk_div;
	
	clkdiv clkdiv1(clock,rst,en,clk_div);
	ram2 ram21(address,clk_div,data,rden,wren,q);
	
endmodule
	