module RP_CP(Wen, BusOut, Clk, RST, INC, dout, rbase);
  input Wen, Clk, RST, INC;
  input[7:0] BusOut;
  output reg[7:0] dout = 8'd0, rbase = 8'd0;
  always @(posedge Clk)
    begin
        if  ( (Wen) && (dout == 8'd0) )
            begin
                rbase <= BusOut;
                dout <= BusOut;
            end
        else if (RST) dout <= rbase;
        else if (INC) dout <= dout+1;
        else            dout <= dout;
      
    end
endmodule