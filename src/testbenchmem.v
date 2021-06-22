`include "define.v"
 

module testbenchmem(
);


   // Input Ports
	reg [1:0] rden;
	reg [1:0] wren;
	reg [15:0] Address;
	reg [15:0] Din;
	reg [7:0] Ramq;
	reg clk;
	

	// Output Ports
	wire [1:0] acq;
	wire [15:0] Dq;
	wire [7:0] RAMAddress;
	wire [7:0] RAMDin;
	wire RAMwren;


    initial begin
		rden=2'b0;
		wren=2'b0;
		Address=16'b1111000000001111;
		Din=16'b1111000000001111;
		Ramq=11111111;
		clk=1'b1;
		#10
		rden=2'b00;wren=2'b00;Address=16'b1111000000001111;Din=16'b1111000000001111;Ramq=11111111;clk<= ~clk;
		#10
		rden=2'b00;wren=2'b00;Address=16'b1111000000001111;Din=16'b1111000000001111;Ramq=11111111;clk<= ~clk;
		#10
		rden=2'b10;wren=2'b00;Address=16'b1111000000001111;Din=16'b1111000000001111;Ramq=11111111;clk<= ~clk;
		#10
		rden=2'b10;wren=2'b00;Address=16'b1111000000001111;Din=16'b1111000000001111;Ramq=11111111;clk<= ~clk;
		#10
		rden=2'b10;wren=2'b00;Address=16'b1111000000001111;Din=16'b1111000000001111;Ramq=11111111;clk<= ~clk;
		#10
		rden=2'b10;wren=2'b00;Address=16'b1111000000001111;Din=16'b1111000000001111;Ramq=11111111;clk<= ~clk;
		#10
		rden=2'b10;wren=2'b00;Address=16'b1111000000001111;Din=16'b1111000000001111;Ramq=11111111;clk<= ~clk;
		#10
		rden=2'b10;wren=2'b00;Address=16'b1111000000001111;Din=16'b1111000000001111;Ramq=11111111;clk<= ~clk;
		#10
        forever begin
            #500
            clk <= ~clk ;
        end
    end

    MemController drammemc(
	.rden(rden),
	.wren(wren),
	.Address(Address),
	.Din(Din),
	.RAMq(Ramq),
	.clk(clk),
	.acq(acq),
	.Dq(Dq),
	.RAMAddress(RAMAddress),
	.RAMDin(RAMDin),
	.RAMwren(RAMwren)
);



endmodule