`timescale 1ns/10ps

module singlecore_tb();
reg Clk=1'd0;
wire Dout=8'd0;

initial begin
//Clk<=1'b0;
forever begin
	#500
	Clk<= ~Clk;
end
end

singlecore sc1(.CLOCK_50(Clk), .Dout(Dout));

endmodule