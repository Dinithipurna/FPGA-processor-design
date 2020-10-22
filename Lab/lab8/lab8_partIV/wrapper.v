module wrapper(clk,data_in, wren, waddr, display,rst);
	input clk,wren,rst;
	input [3:0] data_in;
	input [4:0] waddr;
	output [6:0] display;
	
	wire clk_div;
	wire [4:0] raddr;
	wire [3:0] out;
	
	clkdiv clkdiv1(clk,rst,clk_div);
	raddr_counter raddr_counter1(clk_div,raddr);
	RAM1 RAM11(clk_div,data_in,raddr,waddr,wren,out);
	char_7_seg char_7_seg1(out, display);
	
endmodule
	
	