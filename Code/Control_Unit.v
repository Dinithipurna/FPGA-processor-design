`include "define.v"
 
module Control_Unit
(
	input [7:0] INS,
	input Z1, Z2, clk,
	output reg [2:0] ALU_OP,
	output reg [3:0] Bus_Select,
	output reg [1:0] PCtrl,MEMCtrl,
	output reg [15:0] INC_en,RST_en,WRT_en
);

	reg STATE = 8'd0;
	
	always @(posedge clk)
	begin
	// x and z values are NOT treated as don't-care's
	case(STATE)
	
	
		`ENDOP:
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 16'd0 ;
				RST_en  <= 16'd0 ;
				WRT_en  <= 16'd0 ;
			end
				
				
		default: 
			begin
				ALU_OP <= `ALU_NONE;
				Bus_Select <= `BS_AC;
				PCtrl  <= `P_GSP;
				MEMCtrl <= `MEM_IDLE;
				INC_en  <= 16'd0 ;
				RST_en  <= 16'd0 ;
				WRT_en  <= 16'd0 ;
			end
	
	
	endcase
	
	end
	






	
	
endmodule

