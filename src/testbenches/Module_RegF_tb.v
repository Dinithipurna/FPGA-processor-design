module Module_RegF_tb();
reg Wen, Clk, RST, INC;
reg[7:0] BusOut, din;
wire z;
wire [7:0] dout;

initial begin
    Wen <= 1'b0;
    Clk <= 1'b0;
    RST <= 1'b0;
    INC <= 1'b0;
    BusOut <= 8'd0;
    din <= 8'd0;

    forever begin
        #(5);
        Clk <= ~Clk;
    end
end


Module_RegF #(8'd20) dut(.Wen(Wen), .BusOut(BusOut), .Clk(Clk), .RST(RST), .INC(INC), .din(din), .dout(dout), .z(z));

initial begin
    #(20);
    @(posedge Clk);
    Wen <= 1'b1;
    RST <= 1'b0;
    INC <= 1'b0;
    BusOut <= 8'd24;
    din <= 8'd23;

    @(posedge Clk);
    Wen <= 1'b0;
    RST <= 1'b0;
    INC <= 1'b1;
    BusOut <= 8'd12;
    din <= 8'd30;

    @(posedge Clk);
    Wen <= 1'b0;
    RST <= 1'b1;
    INC <= 1'b0;
    BusOut <= 8'd27;
    din <= 8'd22;

    repeat(10)@(posedge Clk)begin
    Wen <= $random;
    RST <= $random;
    INC <= $random;
    BusOut <= $random;
    din <= $random;
    end
	 
    $stop ;

end
endmodule