//Simple module for DE2-115 that commects the SW switches to the LEDR lights
module part1(SW,LEDR);
	input [17:0] SW;
	output [17:0] LEDR;
	
	assign LEDR=SW;
endmodule
	