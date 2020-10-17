module Reg(Wen, BusOut, Clk, RST, INC, dout);
  input Wen, Clk, RST, INC;
  input[7:0] BusOut;
  output reg [7:0] dout = 8'd0;
  always @(posedge Clk)
    begin
        if      (Wen) dout <= BusOut;
        else if (RST) dout <= 8'd0;
        else if (INC) dout <= dout+1;
        else            dout <= dout;
      
    end
endmodule