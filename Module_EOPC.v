module EOPC(Wen, BusOut, Clk, dout);
  input Wen, Clk;
  input[7:0] BusOut;
  output reg[7:0] dout = 8'd0;
  always @(posedge Clk)
    begin
        if  (Wen) dout <= BusOut;
        else    dout <= dout;
      
    end
endmodule