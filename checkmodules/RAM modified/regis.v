module regis(Wen, BusOut, Clk, RST, INC, dout);
  input Wen, Clk, RST, INC;
  input[4:0] BusOut;
  output reg [4:0] dout = 5'd0;
  always @(BusOut)
    begin
        if      (Wen) dout <= BusOut;
        else if (RST) dout <= 5'd0;
        else if (INC) dout <= dout+1;
        else            dout <= dout;
      
    end
endmodule