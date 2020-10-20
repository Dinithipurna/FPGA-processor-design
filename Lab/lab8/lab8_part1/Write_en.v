module Write_en(en,clk,out2);
	input en;
	input clk;
	output reg out2;
	
	always @ (posedge clk) begin
		out2 <= en;
		end	
endmodule
	