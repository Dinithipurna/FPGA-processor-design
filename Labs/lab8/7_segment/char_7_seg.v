module char_7_seg(c,HEX3 , clk);
	input [3:0] c;
	input clk;
	output [6:0] HEX3;
	reg [6:0] HEX3;
	
	always @(posedge clk)
	begin
	 case(c)
	 
	 
	 4'b0000: HEX3=7'b0000001;
	 4'b0001: HEX3=7'b1001111;
	 4'b0010: HEX3=7'b0010010;
	 4'b0011: HEX3=7'b0000110;
	 4'b0100: HEX3=7'b1001100;
	 4'b0101: HEX3=7'b0100100;
	 4'b0110: HEX3=7'b0100000;
	 4'b0111: HEX3=7'b0001111;
	 4'b1000: HEX3=7'b0000000;
	 4'b1001: HEX3=7'b0000100;
	 default: HEX3=7'b0000001;
	 endcase
	 
	 end

endmodule

