`timescale 1ns/10ps
 
`include "define.v"
 


module testbench();

    reg clk = 0;


    initial begin
        forever begin
            #(500);
            clk <= ~clk ;
        end
    end

    singlecore mod1(.CLOCK_50(clk));

    initial begin
        #(500000);
        $stop;
    end



endmodule