module testbench_reg();
	 reg wen = 1'b0;
	 reg rst = 1'b0;
	 reg inc = 1'b0;
    reg clk = 0;
    reg[7:0] busout = 8'd67;
	 wire[7:0] dout;
	
	 initial begin
	     forever begin
            #(500);
            clk <= ~clk ;
        end
	 end



	
    initial begin
	   #25;
		@(posedge clk)
		
			inc<=1'b1;
			rst<=1'b0;
			wen<=1'b0;

			
		@(posedge clk)
		
			inc<=1'b0;
			rst<=1'b0;
			wen<=1'b1;

		@(posedge clk)
		
			inc<=1'b0;
			rst<=1'b1;
			wen<=1'b0;
      
		@(posedge clk)
		
			inc<=1'b0;
			rst<=1'b0;
			wen<=1'b0;

    end


    Module_Reg mod_reg(.Clk(clk),.Wen(wen),.RST(rst),.INC(inc),.BusOut(busout),.dout(dout));





endmodule