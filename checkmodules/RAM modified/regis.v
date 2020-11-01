module regis(Wen, BusOut, Clk, RST, INC, dout);
  input Wen, Clk, RST, INC;
  input[3:0] BusOut;
  output reg [3:0] dout = 4'd0;
  always @(BusOut)
    begin
        if      (Wen) dout <= BusOut;
        else if (RST) dout <= 4'd0;
        else if (INC) dout <= dout+1;
        else            dout <= dout;
      
    end
endmodule