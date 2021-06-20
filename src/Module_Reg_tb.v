module Module_Reg_tb();

    reg Wen,Clk,RST,INC;
    reg [7:0] BusOut;
    wire [7:0] dout;

    localparam CLK_P = 10;
	initial begin
        Clk <= 1'b0;
        BusOut <= 8'd12;
        Wen <= 1'b0;
        INC <= 1'b0;
        RST <= 1'b0;

		forever begin
			#(CLK_P/2);
			Clk <= ~Clk;
		end
	end

    Module_Reg dut(.*);


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
        BusOut <= 8'd32;
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


