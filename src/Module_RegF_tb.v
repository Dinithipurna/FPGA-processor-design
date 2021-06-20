module Module_RegF_tb();

    reg Wen,Clk,RST,INC;
    reg [7:0] BusOut,din;
    wire [7:0] dout;
    wire z;

    localparam CLK_P = 10;
	initial begin
        Clk <= 1'b0;
        BusOut <= 8'd12;
        din <= 8'd52;
        Wen <= 1'b0;
        INC <= 1'b0;
        RST <= 1'b0;

		forever begin
			#(CLK_P/2);
			Clk <= ~Clk;
		end
	end

    Module_RegF #(.Sval(8'd34)) dut(.*);


    initial begin
        #(30);

        @(posedge Clk);
        Wen <= 1'b1;

        @(posedge Clk);
        Wen <= 1'b0;
        INC <= 1'b1;

        @(posedge Clk);
        INC <= 1'b0;
        RST <= 1'b1;

        @(posedge Clk);
        BusOut <= 8'd62;
        Wen <= 1'b1;

        repeat(10) @(posedge Clk) begin
            BusOut <= $random;
            Wen <= $random;
            INC <= $random;
            RST <= $random;
        end

        $stop;

    end


endmodule


