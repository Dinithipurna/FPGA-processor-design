module part4_2(clk,data_in, wren,rst,out,clk_div);
	input clk,wren,rst;
	input [3:0] data_in;
	//input [4:0] waddr;
	//output [6:0] display;
	output [3:0] out;
	output clk_div;
	
	wire clk_div;
	wire [4:0] raddr;
	
	
	clkdiv clkdiv1(clk,rst,clk_div);
	raddr_counter raddr_counter1(clk_div,raddr);
	ram2 RAM1(raddr,clk_div,data_in,wren,out);
	//char_7_seg char_7_seg1(out, display, clk_div);
	
endmodule
	
	