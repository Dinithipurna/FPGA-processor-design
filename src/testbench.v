`timescale 1ns/10ps
 
`include "define.v"
 


module testbench();

    reg clk = 0;
	 wire [7:0] Ddin =0;


    initial begin
        forever begin
            #500
            clk <= ~clk ;
        end
    end

    Modified mod1(.CLOCK_50(clk),.Ddin(Ddin));



endmodule