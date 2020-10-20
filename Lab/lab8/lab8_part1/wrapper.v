module wrapper(address,datain,en,clk,dataout);
	input [4:0] address;
	input [3:0] datain;
	input en,clk;
	output [3:0] dataout;
	
	wire [4:0] addr;
	wire [3:0] data_in;
	wire wr_en;
	
	addr_counter addr_Counter1(address, clk, addr);
	Data_counter Data_counter1(datain,clk, data_in);
	Write_en Write_en1(en,clk,wr_en);
	ram32x4 ram32x4_1(addr,clk, data_in, wr_en , dataout);
	
endmodule
	