module wrap_P_mux(SW,HEX0);
	input [1:0]SW;
	output [6:0] HEX0;
	
	wire [7:0] result;
	
	
	
	Pointer_MUX P1(
	.data0x(8'd1),
	.data1x(8'd3),
	.data2x(8'd4),
	.data3x(8'd5),
	.sel(SW),
	.result(result));
	
char7 char79(result[3:0],HEX0);

endmodule

	