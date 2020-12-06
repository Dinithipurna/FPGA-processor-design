module check_ram(CLOCK2_50,SW,HEX0,HEX1,LEDG);
	input [17:0] SW;
	input CLOCK2_50;
	output [6:0] HEX0,HEX1;
	output [8:0] LEDG;
	
	
	
	wire CLK;
	wire [7:0] q;
	
	assign LEDG[8]=CLK;
	
	DRAM DRAM1(
	.address(SW[7:0]),
	.clock(CLK),
	.data(SW[15:8]),
	.wren(SW[16]),
	.q(q));
	
	
	clkdiv clkdiv1(
    .clk(CLOCK2_50),
    .rst(1'b0),
	 .en(SW[17]),
    .clk_div(CLK)
    );	
	 
char7 char712(q[3:0],HEX0);
char7 char713(q[7:4],HEX1);

endmodule
