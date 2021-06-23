`timescale 1ns/10ps
 
`include "define.v"
 


module testbench();
    reg [4-1:0] rden,wren,
	reg wire [31:0] Address,
	reg [31:0] Din ,
	reg [7:0] RAMq,
	reg clk,
    reg [4-1:0] dramacq,
	

	// Output Ports
	wire  [4-1:0] acq = 0,
	wire [31:0] Dq,
	wire  [7:0] RAMAddress = 8'd0,
	wire  [7:0] RAMDin = 8'd0,
	wire  RAMwren = 1'd0


    initial begin
        rden=4'd0, wren=4'd0, Address=32'b1111000011110000111100001111000011110000,Ddin=32'd0,RAMq=10101010,clk=1'b0,dramacq=4'd0;
        #20
        rden=4'd0, wren=4'd0, Address=32'b1111000011110000111100001111000011110000,Ddin=32'd0,RAMq=10101010,clk=~clk,dramacq=4'd0;
        #20
        rden=4'd0, wren=4'd0, Address=32'b1111000011110000111100001111000011110000,Ddin=32'd0,RAMq=10101010,clk=~clk,dramacq=4'd0;
        #20
        rden=4'd0, wren=4'd0, Address=32'b1111000011110000111100001111000011110000,Ddin=32'd0,RAMq=10101010,clk=~clk,dramacq=4'd0;
        #20
        rden=4'd0, wren=4'd0, Address=32'b1111000011110000111100001111000011110000,Ddin=32'd0,RAMq=10101010,clk=~clk,dramacq=4'd0;
        #20
        rden=4'd1, wren=4'd0, Address=32'b1111000011110000111100001111000011110000,Ddin=32'd0,RAMq=10101010,clk=~clk,dramacq=4'd0;
        #20
        rden=4'd1, wren=4'd0, Address=32'b1111000011110000111100001111000011110000,Ddin=32'd0,RAMq=10101010,clk=~clk,dramacq=4'd0;
        #20
        rden=4'd1, wren=4'd0, Address=32'b1111000011110000111100001111000011110000,Ddin=32'd0,RAMq=10101010,clk=~clk,dramacq=4'd0;
        #20
        rden=4'd1, wren=4'd0, Address=32'b1111000011110000111100001111000011110000,Ddin=32'd0,RAMq=10101010,clk=~clk,dramacq=4'd0;
        #20
        rden=4'd1, wren=4'd0, Address=32'b1111000011110000111100001111000011110000,Ddin=32'd0,RAMq=10101010,clk=~clk,dramacq=4'd0;
        #20
        rden=4'd1, wren=4'd0, Address=32'b1111000011110000111100001111000011110000,Ddin=32'd0,RAMq=10101010,clk=~clk,dramacq=4'd1;
        #20
        rden=4'd0, wren=4'd0, Address=32'b1111000011110000111100001111000011110000,Ddin=32'd0,RAMq=10101010,clk=~clk,dramacq=4'd1;
        #20
        rden=4'd0, wren=4'd0, Address=32'b1111000011110000111100001111000011110000,Ddin=32'd0,RAMq=10101010,clk=~clk,dramacq=4'd1;
        #20
        rden=4'd0, wren=4'd0, Address=32'b1111000011110000111100001111000011110000,Ddin=32'd0,RAMq=10101010,clk=~clk,dramacq=4'd1;
        #20
        rden=4'd0, wren=4'd0, Address=32'b1111000011110000111100001111000011110000,Ddin=32'd0,RAMq=10101010,clk=~clk,dramacq=4'd1;
        #20
           
    end



endmodule