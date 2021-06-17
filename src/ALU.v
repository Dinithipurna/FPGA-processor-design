`include "define.v"


module ALU(BusOut,Wen,alu_op,Clk,INC,RST,dout);

input  Clk,Wen,INC,RST;

input  [2:0] alu_op;
input  [7:0] BusOut;

output reg [7:0]  dout= 8'd0;

always @(posedge Clk)

	begin
	
		case(alu_op)
					`ALU_NONE:
						begin
							if (Wen==1)   dout <= BusOut;
							else if (INC==1)  dout <= dout+8'd1;
							else if (RST==1)   dout <= 8'd0;
							else dout <= dout ;
						end
					`ALU_ADD:
						dout <= dout + BusOut;
					`ALU_MUL:
						dout <= dout * BusOut;
					`ALU_DIV:
						dout <= dout / BusOut;
					`ALU_MOD:
						dout <= dout % BusOut;
						
						
					default:
						dout<=dout;
		endcase
	end
	
endmodule



