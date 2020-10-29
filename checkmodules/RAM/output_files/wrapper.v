module wrapper(
	rst,
	en,
	address,
	clock,
	data,
	wren,
	q);
	
	input reg[4:0] address;
	input reg[3:0] data;
	input clk,rst,en,wren;
	output reg[3:0] q;
	
	wire clk_div;
	
	clkdiv clkdiv1(clock,rst,en,clk_div);
	RAM1 RAM11(address,clk_div,data,wren,q);
	
endmodule
	