module addr_counter(address,clk,out);
	input [4:0] address;
	input clk;
	output reg[4:0] out;
	
	always @ (posedge clk) begin
		out<= address;
		end	
endmodule
	