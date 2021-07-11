module ALU_tb();

reg Clk,Wen,INC,RST;

reg [2:0] alu_op;
reg  [7:0] BusOut;

wire [7:0]  dout= 8'd0;


initial begin
Clk <= 1'b0;
Wen <= 1'b0;
INC <= 1'b0;
RST <= 1'b0;  
alu_op <= 3'b0;
BusOut <= 8'd20;

forever begin
    #(5);
    Clk <= ~Clk;
end
end

ALU alu1(.BusOut(BusOut), .Wen(Wen), .alu_op(alu_op), .Clk(Clk), .INC(INC), .RST(RST), .dout(dout));

initial begin

repeat(10) @(posedge Clk)begin
Wen <= $random;
INC <= $random;
RST <= $random;  
alu_op <= $random;
BusOut <= $random;   
end
$stop;
end

endmodule



