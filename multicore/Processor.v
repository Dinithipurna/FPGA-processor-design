`include "define.v"
 

module Processor(CLOCK2_50);


  wire  MEMCtrl;
  wire [7:0] DAddress,Ddout,IAddress;
  wire [7:0] Ddin,Idin;
  //wire clk_div;
  input CLOCK2_50;
  //output clk_div;
 
  //clkdiv clkdiv1(CLK,rst,en,clk_div);
  TopRegisterWrapper TRW1(MEMCtrl,DAddress,Ddout,Ddin,IAddress,Idin,CLOCK2_50);
 

  IRAM IRAM1(

	.address(IAddress),

	.clock(CLOCK2_50),

	.data(8'd0),

	.wren(1'b0),

	.q(Idin));

	

	DRAM DRAM1(

	.address(DAddress),

	.clock(CLOCK2_50),

	.data(Ddout),

	.wren(MEMCtrl),

	.q(Ddin));

  


  endmodule

