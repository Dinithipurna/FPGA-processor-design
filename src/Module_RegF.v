module Module_RegF
#(
	// Parameter Declarations
	parameter [7:0] Sval = 8'd0
)



(Wen, BusOut, Clk, RST, INC, din, dout, z);
  input Wen, Clk, RST, INC;
  input[7:0] BusOut, din;
  output reg z=1;
  output reg [7:0] dout = Sval;
  always @(dout or din)
	begin
		if(din <= dout) z <=1;         //For MC and MV we can use the negation of Z
		else z <=0;
	end
  always @(posedge Clk)
    begin
        if      (Wen) dout <= BusOut;
        else if (RST) dout <= 8'd0;
        else if (INC) dout <= dout+8'd1;
        else            dout <= dout;
      
    end
endmodule


