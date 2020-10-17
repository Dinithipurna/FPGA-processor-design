module EOPC(Wen,Reset, BusOut, Clk, dout);
  input Wen, Clk,Reset;
  input[7:0] BusOut;
  output reg[7:0] dout = 8'd0;
  always @(posedge Clk)
    begin
        if  (Wen) 			dout <= BusOut;
		  else if (Reset) 	dout <= 8'd0;
        else    				dout <= dout;
      
    end
endmodule