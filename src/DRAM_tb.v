`timescale 1 ns/10 ps
module DRAM_tb();

	
	
	reg clk = 0;
	reg [7:0] address = 0;
	reg wren = 0;
	reg [7:0] data = 0;
	wire [7:0] q;
	
	
	localparam CLK_P = 10;
	
	initial begin
		forever begin
			#(CLK_P/2);
			clk <= ~clk;
		end
	end


	DRAM dut ( .clock(clk),
					.address(address),
					.wren(wren),
					.data(data),
					.q(q)
					);


	initial begin
		#(CLK_P*3);
		

		repeat(20) @(posedge clk) begin
			address <= address + 8'd1;
		end
		
		$stop;

	end


endmodule






