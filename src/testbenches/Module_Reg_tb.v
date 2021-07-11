module Module_Reg_tb(); 

   reg Wen, Clk, RST, INC;
   reg[7:0] BusOut;
   wire [7:0] dout;


   initial begin
      Clk<=1'b0;
      Wen <=1'b0;
      RST <= 1'b0;
      INC <= 1'b0;
      BusOut<= 8'd34;
      
      forever begin
         #(5);
         Clk <= ~Clk;
     end

end

Module_Reg dut(.Wen(Wen), .BusOut(BusOut), .Clk(Clk), .RST(RST), .INC(INC), .dout(dout));


initial 
	begin
      #(10);
            // values for a and b
      @(posedge Clk);
      BusOut <= 8'd12;
      Wen <= 1'b1;
      INC <= 1'b0;
      RST <= 1'b0;
            

      @(posedge Clk);
		BusOut <= 8'd8;
      Wen <= 1'b0;
      INC <= 1'b0;
      RST <= 1'b1;
            

      @(posedge Clk);
		BusOut <= 8'd5;
      Wen <= 1'b0;
      INC <= 1'b1;
      RST <= 1'b0;
            

      @(posedge Clk);
		BusOut <= 8'd34;
      Wen <= 1'b0;
      INC <= 1'b1;
      RST <= 1'b0;

      @(posedge Clk);
		BusOut <= 8'd34;
      Wen <= 1'b0;
      INC <= 1'b0;
      RST <= 1'b1;

      #(10);
            
				
		$stop;
	end

	

endmodule