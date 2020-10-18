module Module_RP_CP(Wen, BusOut, Clk, RST, INC, dout);
  input Wen, Clk, RST, INC;
  input[7:0] BusOut;
  output reg[7:0] dout = 8'd0;
  reg rbase = 8'd0;
  always @(posedge Clk)
    begin
        if (Wen)
            begin
					if((dout == 8'd0))	rbase <= BusOut;           
					dout <= BusOut;
            end
        else if (RST) dout <= rbase;
        else if (INC) dout <= dout+1;
        else            dout <= dout;
      
    end
endmodule