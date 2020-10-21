module raddr_counter(clk,address);
	input clk;
	output reg[4:0] address;
	
	reg [4:0] counter;
	
	initial begin
		counter<=0;
		end
	
	always @( posedge clk) begin
		counter<=counter+1;
		address<=counter;
		
		if (counter== 5'd31) begin
			counter<=0;
			end
	end
	
	endmodule
	
	