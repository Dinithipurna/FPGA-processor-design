`include "define.v"

module ALU(bus_out,w_en,alu_op,clk,inc,rst,d_out);

input  clk,w_en,inc,rst;

input  [2:0] alu_op;
input  [7:0] bus_out;

output reg [7:0]  d_out;

always @(posedge clk)

	begin
	
		case(alu_op) 
					`ALU_NONE:
						begin
							if (w_en==1)   d_out <= bus_out;
							else if (inc==1)  d_out <= d_out+1;
							else if (rst==1)   d_out <= 8'd0;
						end
					`ALU_ADD:
						d_out <= d_out + bus_out;
					`ALU_MUL:
						d_out <= d_out * bus_out;
					`ALU_DIV:
						d_out <= d_out / bus_out;
					`ALU_MOD:
						d_out <= d_out % bus_out;
						
						
					default:
						d_out<=d_out;
				
		endcase
	end
	
endmodule