`include "define.v"
 

module singlecore(CLOCK_50,Ddin);

input CLOCK_50;

output [7:0] Ddin;

wire CLK,busy0;
wire [2:0] dramacq;
wire [7:0] IAddress,IAddress0,IAddress1,Idin,Idin0,Idin1,DAddress,DAddress0,DAddress1;
wire [3:0] Mem_Ctrl,Mem_Ctrl0,Mem_Ctrl1;
wire [7:0] Ddin1,Ddin0,Ddout,Ddout0,Ddout1;


wire [31:0] clkcount;


clkdiv clkdiv1(
    .clk(CLOCK_50),
    .rst(1'b0),
	 .en(1'b1),
    .clk_div(CLK),
	.busy(busy0),
	.clkcount(clkcount)
);	  	 

IRAM IRAM1(

	.address(IAddress),

	.clock(CLK),

	.data(8'd0),

	.wren(1'b0),

	.q(Idin));
	

DRAM DRAM1(

	.address(DAddress),

	.clock(CLK),

	.data(Ddout),

	.wren(Mem_Ctrl[1]),

	.q(Ddin));

core #(8'd0) core0
(
	.CLK(CLK),
	.Idin(Idin),
	.Ddin(Ddin),
	.Mem_Ctrl(Mem_Ctrl),
	.IAddress(IAddress),
	.DAddress(DAddress), 
	.Ddout(Ddout),
    .iacq(1'b1),
	.dacq(1'b1),
	.busy(busy0)
);	


	
	
endmodule