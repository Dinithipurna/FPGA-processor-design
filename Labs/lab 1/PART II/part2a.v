//2-1 multiplexer
module part2a (s,x,y,m);
	input s,x,y;
	output m;
	assign m=(~s&x)|(s&y);
endmodule
	