`include "define.v"
 

  module Processor(CLK,rst,en,clk_div);


  wire [1:0] MEMCtrl;

  wire [7:0] DAddress,Ddout,IAddress;

  wire [7:0] Ddin,Idin;
  wire clk_div;

  input CLK,rst,en;
  output clk_div;
 
  clkdiv clkdiv1(CLK,rst,en,clk_div);
  TopRegisterWrapper TRW1(MEMCtrl,DAddress,Ddout,Ddin,IAddress,Idin,clk_div);
 

  IRAM IRAM1(

	.address(IAddress),

	.clock(clk_div),

	.data(),

	.rden(),

	.wren(),

	.q(Idin));

	

	DRAM DRAM1(

	.address(DAddress),

	.clock(clk_div),

	.data(Ddout),

	.wren(MEMCtrl[0]),

	.q(Ddin));

  


  endmodule

