module Control_Unit_tb();

	reg [7:0] INS;
	reg Z1, Z2, clk;
	reg iacq,dacq;
	wire busy;
	wire [2:0] ALU_OP;
	wire [3:0] Bus_Select;
	wire [1:0] PCtrl ;
	wire [13:0] WRT_en,INC_en,RST_en;
	wire [3:0] MEMCtrl ;

	
initial begin
	INS <= 8'd0;
	Z1 <= 0;
	Z2 <= 0;
	clk <= 1'b0;
	iacq <= 1;
	dacq <= 0;

	forever begin
		#(5);
		clk <= ~clk;
	end

end

Control_Unit CU1(.INS(INS), .Z1(Z1), .Z2(Z2), .clk(clk), .iacq(iacq), .dacq(dacq), .busy(busy), .ALU_OP(ALU_OP), .Bus_Select(Bus_Select), .PCtrl(PCtrl), .WRT_en(WRT_en), .INC_en(INC_en), .RST_en(RST_en), .MEMCtrl(MEMCtrl));

initial begin

repeat(50)@(negedge clk)begin
#(30)
	INS <= $random;
	Z1 <= $random;
	Z2 <= $random;
	iacq <= $random;
	dacq <= $random;	
end


$stop;

end

endmodule