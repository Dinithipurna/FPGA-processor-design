module mux(X,Y,S,M);
	input S,X,Y;
	output M;
	
	assign m=(~S & X)|(S & Y);
	
endmodule
