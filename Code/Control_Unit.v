 
module Control_Unit
(
	input [7:0] INS,
	input Z1, Z2, clk, start,
	output reg [1:0] ALU_OP,
	output reg [3:0] Bus_Ctrl,
	output reg [1:0] PCtrl,MEMCtrl,
	output reg [15:0] INC_en,RST_en,WRT_en
);

	reg STATE = 8'b0;
	

	always @(posedge clk)
	begin
	// x and z values are NOT treated as don't-care's
	case(STATE)
		'ENDOP: 
			begin
				ALU_OP
				
				
			end
			
	<case_item_exprs>: <sequential statement>
	<case_item_exprs>: <sequential statement>
	default: <statement> 
	endcase
	
	end
	






	
	
endmodule

