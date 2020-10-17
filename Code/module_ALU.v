module ALU(bus_out,w_en,alu_op,clk,inc,rst,d_out);

input  clk,w_en,inc,rst;

input  [2:0] alu_op;
input  [7:0] bus_out;

output [7:0] reg d_out=8'd0;

always @(posedge clk)

	begin
	
		case(alu_op)
				begin
					3'b000:
						begin
							if (w_en==1)   d_out <= bus_out;
							else if (inc==1)  d_out <= d_out+1;
							else if (rst==1)   d_out <= 8'd0;
						end
					3'b001:
						d_out <= d_out + bus_out;
					3'b010:
						d_out <= d_out * bus_out;
					3'b011:
						d_out <= d_out / bus_out;
					3'b100:
						d_out <= d_out % bus_out;
						
						
					default:
						d_out<=d_out;
				end
			endcase
	end
	
endmodule



