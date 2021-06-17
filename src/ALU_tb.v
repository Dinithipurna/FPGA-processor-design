`timescale 1ns/1ps

module ALU_tb ();


    reg Clk;
	reg [7:0] BusOut;
	reg Wen,INC,RST;
	reg [2:0] alu_op;
	wire [7:0]  dout;
	
	
	localparam CLK_P = 10;
	
	initial begin
        Clk <= 1'b0;
        BusOut <= 8'd0;
        Wen <= 1'b0;
        INC <= 1'b0;
        RST <= 1'b0;
        alu_op <= 3'b000;

		forever begin
			#(CLK_P/2);
			Clk <= ~Clk;
		end
	end


	ALU dut ( .*);


	initial begin
		#(CLK_P*3);

        @(posedge Clk);
        Wen <= 1'b1;
        BusOut <= 8'd35;

        @(posedge Clk);
        Wen <= 1'b0;
        BusOut <= 8'd45;

        @(posedge Clk);
        INC <= 1'b1;
        BusOut <= 8'd35;

        @(posedge Clk);
        INC <= 1'b1;
        BusOut <= 8'd35;

        @(posedge Clk);
        RST <= 1'b1;
        INC <= 1'b0;
        BusOut <= 8'd35;


        @(posedge Clk);
        Wen <= 1'b1;
        RST <= 1'b0;
        BusOut <= 8'd12;

        @(posedge Clk);
        Wen <= 1'b0;
        BusOut <= 8'd13;
        alu_op <= 3'b001;

        @(posedge Clk);
        Wen <= 1'b0;
        BusOut <= 8'd03;
        alu_op <= 3'b010;

        @(posedge Clk);
        Wen <= 1'b0;
        BusOut <= 8'd03;
        alu_op <= 3'b010;

        @(posedge Clk);
        Wen <= 1'b0;
        BusOut <= 8'd05;
        alu_op <= 3'b011;

        @(posedge Clk);
        Wen <= 1'b0;
        BusOut <= 8'd06;
        alu_op <= 3'b100;

		
		repeat(20) @(posedge Clk) begin
			BusOut <=$random;
			INC <= $random;
			RST <= $random;
			Wen <= $random;
            alu_op <= $random;
		end
		
		

		
		$stop;

	end

    
endmodule