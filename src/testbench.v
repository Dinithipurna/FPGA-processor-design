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

    Modified3 mod1(.CLOCK_50(clk));

    initial begin
        #(20000000);
        $stop;
    end



endmodule