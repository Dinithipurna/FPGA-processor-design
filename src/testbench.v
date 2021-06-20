`timescale 1ns/10ps
 
`include "define.v"
 


module testbench();

    reg clk = 0;

    initial begin
		//rst=1'b1;
		//en=1'b1;
		//#20
		//rst=1'b0;
		//en=1'b1;
		//#20
        forever begin
            #(500);
            clk <= ~clk ;
        end
    end


    Modified3 mod1(.CLOCK_50(clk));

    initial begin
        #(500000);
        $stop;
    end



endmodule