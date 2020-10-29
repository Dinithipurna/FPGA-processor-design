module assigned(clk,dout,busout);
	input clk;
	output [7:0] dout;
	output [7:0] busout;
	
	localparam constantNumber = 4
	
	always @ (posedge clk) begin
		dout<= constantNumber;
		busout<=constantNumber;
		
	end
	
endmodule  
		
	