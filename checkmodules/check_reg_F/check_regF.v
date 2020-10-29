module check_regF(Wen, BusOut, Clk, RST, INC, din, dout, z);
  input Wen, Clk, RST, INC;
  input[3:0] BusOut, din;
  output reg z=1;
  output reg [3:0] dout = 4'd0;
  always @(dout)
	begin
		if(din > dout) z <=1;         //For MC and MV we can use the negation of Z
		else z <=0;
	end
  always @(posedge Clk)
    begin
        if      (Wen) dout <= BusOut;
        else if (RST) dout <= 4'd0;
        else if (INC) dout <= dout+1;
        else            dout <= dout;
      
    end
endmodule