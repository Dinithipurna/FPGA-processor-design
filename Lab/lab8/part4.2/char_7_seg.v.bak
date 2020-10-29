module char_7_seg(c,display,clk);
	input [3:0] c;
	output [6:0] display;
	reg [6:0] display;
	input clk;
	
	always @(posedge clk)
	begin
	 case(c)
	 
	 
	 4'b0000: display=7'b0000001;
	 4'b0001: display=7'b1001111;
	 4'b0010: display=7'b0010010;
	 4'b0011: display=7'b0000110;
	 4'b0100: display=7'b1001100;
	 4'b0101: display=7'b0100100;
	 4'b0101: display=7'b0100000;
	 4'b0111: display=7'b0001111;
	 4'b1000: display=7'b0000000;
	 4'b1001: display=7'b0000100;
	 default: display=7'b0000001;
	 endcase
	 
	 end

endmodule

