module check_EOPC(Wen,Reset, BusOut, Clk, dout);
  input Wen, Clk,Reset;
  input[3:0] BusOut;
  output reg[3:0] dout = 4'd0;
  always @(posedge Clk)
    begin
        if  (Wen) 			dout <= BusOut;
		  else if (Reset) 	dout <= 4'd0;
        else    				dout <= dout;
      
    end
endmodule