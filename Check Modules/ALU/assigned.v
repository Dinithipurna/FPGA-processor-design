module assigned(dout,busout);
	//input clk;
	output reg[7:0] dout;
	output reg[7:0] busout;
	
	initial
	begin
		dout<=8'b00001000;
		busout<=8'b00001000;
		
	end
	
endmodule  
		
	