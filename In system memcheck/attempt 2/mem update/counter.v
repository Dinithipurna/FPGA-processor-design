module counter(clk,out1);
	input clk;
	output reg[7:0] out1;
	
	always @ (posedge clk) begin
			out1 <= out1 + 1;
		end
endmodule
		
			
	