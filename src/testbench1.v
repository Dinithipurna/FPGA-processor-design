`timescale 1ns/10ps
 
`include "define.v"
 
module testbench1();

    reg clk = 0;
    reg rst =1'b0;
    reg en=1'b1;
    reg busy=1'b1;
    wire clk_div;
    wire[31:0] clkcount;


    initial begin
		rst=1'b1;
		en=1'b1;
		busy=1'b1;
		#20
		rst=1'b0;
		en=1'b1;
		busy=1'b1;
		#20
        forever begin
            #500
            clk <= ~clk ;
        end
    end

   clkdiv clkdiv1(
    .clk(clk),
    .rst(rst),
	 .en(en),
    .clk_div(clk_div),
	.busy(busy),
	.clkcount(clkcount)
);	



endmodule