module MemController3_tb();

reg [2:0]rden,wren;
reg [7:0] RAMq;
reg[23:0] Din, Address;
reg clk;

wire [7:0] Dout;
wire[2:0] acq;
wire [7:0] RAMAddress;
wire RAMwren;
wire [23:0] Dq;

initial begin
rden<=1'b0;
wren<=1'b0;
RAMq<=1'b0;
Din<=1'b0;
Address<=1'b0;
clk<=1'b0;

forever begin
    #(5);
    clk<=~clk;
end
end

MemController3 mc1(.rden(rden),.wren(wren),.Address(Address),.Din(Din),.RAMq(RAMq),.clk(clk),.acq(acq),.Dq(Dq),.RAMAddress(RAMAddress),.RAMDin(Dout),.RAMwren(RAMwren));

initial begin
    #(10);

repeat(10)@(posedge clk)begin
rden<=$random;
wren<=$random;
RAMq<=$random;
Din<=$random;
Address<=$random;
clk<=$random;  
end

$stop;

end

endmodule