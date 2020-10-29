module check_reg(clk,w_en,inc,rst,alu_op,d_out);

	input  clk,w_en,inc,rst;
	input  [2:0] alu_op;
	output [7:0] d_out;
	
	wire [7:0] busout;
	
	assigned assigned1(d_out,busout);
	ALU ALU1(busout,w_en,alu_op,clk,inc,rst,d_out);
	
endmodule
