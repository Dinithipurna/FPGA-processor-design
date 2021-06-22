`timescale 1ns/10ps

`include "define.v"

module TestDram();
    input	[7:0]  address;
	input	  clock;
	input	[7:0]  data;
	input	  wren;
	wire	[7:0]  q=8'd0;

    initial begin
        address=8'd0, clock=1, data=8'd45, wren=0;
        #20
        address=address+1, clock=1, data=8'd45, wren=0;
        #20
        address=address+1, clock=1, data=8'd45, wren=0;
        #20
        address=address+1, clock=1, data=8'd45, wren=0;
        #20
        address=address+1, clock=1, data=8'd45, wren=0;
        #20
        address=address+1, clock=1, data=8'd45, wren=0;
        #20
        address=address+1, clock=1, data=8'd45, wren=0;
        #20
        address=address+1, clock=1, data=8'd45, wren=0;
        #20
        address=address+1, clock=1, data=8'd45, wren=0;
        #20
        address=address+1, clock=1, data=8'd45, wren=0;
        #20
        address=address+1, clock=1, data=8'd45, wren=0;
        #20
        address=8'd0, clock=1, data=8'd45, wren=1;
        #20
        forever begin
            #20
            clock=~clock
        end
    end

endmodule