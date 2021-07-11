module Module_RP_CP_tb();
  reg Wen, Clk, RST, INC;
  reg [7:0] BusOut;
  wire[7:0] dout;
  
  
 initial begin
  Wen<=1'd0;
  Clk<=1'd0;
  RST<=1'd0;
  INC<=1'd0;
  BusOut<=8'd15;
  
  
  forever begin
	#20
	Clk<= ~Clk;
  end
end
  
 
  



 Module_RP_CP dut(.Wen(Wen), .BusOut(BusOut), .Clk(Clk), .RST(RST), .INC(INC), .dout(dout));
 
 
 initial begin
 #(20);
 
 @(posedge Clk);
 Wen<=1'b1;
 
  
 @(posedge Clk);
 Wen<=1'b0;
 INC<=1'b1;
 BusOut<=8'd20;
 
  
 @(posedge Clk);
 INC<=1'b0;
 RST<=1'b1;
 
 
 repeat(20) @(posedge Clk) begin
  Wen<=$random; 
  RST<=$random;
  INC<=$random;
  BusOut<=$random;
 
 end
 
 $stop;
 
 
 end
 
 endmodule