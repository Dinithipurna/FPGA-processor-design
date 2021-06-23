module IMemController4

#(
	// Parameter Declarations
	parameter ncores = 4
)

(
	// Input Ports
	input [ncores-1:0] rden,wren,
	input wire [31:0] Address,
	input wire [31:0] Din ,
	input [7:0] RAMq,
	input clk,
	

	// Output Ports
	output reg [ncores-1:0] acq = 0,
	output [31:0] Dq,
	output reg [7:0] RAMAddress = 8'd0,
	output reg [7:0] RAMDin = 8'd0,
	output reg RAMwren = 1'd0
);

	// Module Item(s)
	
	// Declare states
	parameter free = 0, ac = 1;

	reg	[ncores-1:0]	state =  free ,next_state =  free;

	assign Dq = {RAMq,RAMq,RAMq,RAMq};

	
	always @(*) begin
		case(state)
		ac : begin
			if(rden[0]==1 && rden[1]==1 && rden[2]==1 && rden[3]==1 )
				next_state = ac;
			else
				next_state = free;
			
		end
	

		free : begin
			if(rden[0]==1 && rden[1]==1 && rden[2]==1 && rden[3]==1 )
				next_state = ac;
			else
				next_state = free;
		end

		endcase	

		
	end


	always @ (posedge clk ) begin
			state = next_state;
			case (state)
				free:begin
					acq 		<= 0;

				end		
				ac:begin
					RAMAddress 	<= Address[7:0];
					RAMDin		<= Din[7:0];
					RAMwren		<= wren[0];
					// Dq[7:0]    	<= RAMq;
					acq[0] 		<= 1;
					acq[1] 		<= 1;
					acq[2] 		<= 1;
					acq[3] 		<= 1;
					
					
				end							
			endcase
	end

	
	
	

endmodule
