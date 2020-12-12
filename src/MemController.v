module MemController

#(
	// Parameter Declarations
	parameter ncores = 2
)

(
	// Input Ports
	input [ncores-1:0] rden,wren,
	input wire [15:0] Address,
	input wire [15:0] Din ,
	input [7:0] RAMq,
	input clk,
	

	// Output Ports
	output reg [ncores-1:0] acq,
	output reg [15:0] Dq ,
	output reg [7:0] RAMAddress,
	output reg [7:0] RAMDin,
	output reg RAMwren
);

	// Module Item(s)
	
	reg	[ncores-1:0]	state,next_state;

	// Declare states
	parameter free = 0, ac0 = 1, ac1 = 2;

	

	// Determine the next state
	always @ (posedge clk ) begin
			case (state)
				free:begin
					acq 		<= 0;
					if(rden==0 && wren==0)
						state <= free;
					else
						state <= next_state;
				end		
				ac0:begin
					RAMAddress 	<= Address[7:0];
					RAMDin		<= Din[7:0];
					RAMwren		<= wren[0];
					 Dq[7:0]    <= RAMq;
					acq[0] 		<= 1;
					
					if(rden[0]==0 && wren[0]==0)
						state <= free;
					else
						state <= ac0;
				end
				ac1:begin
					RAMAddress 	<= Address[15:8];
					RAMDin		<= Din[15:8];
					RAMwren		<= wren[1];
					 Dq[15:8]   <= RAMq;
					acq[1] 		<= 1;
					
					if((rden[1]==0) && (wren[1]==0))
						state <= free;
					else
						state <= ac1;
				end						
			endcase
	end

	
	// Output depends only on the state
	always @ (state) begin
		if(rden[0]==1 || wren[0]==1)
			next_state <= ac0;
		else if (rden[1]==1 || wren[1]==1)
			next_state <= ac1;
		else
			next_state <= free;
	end
	
	
	
	
	

endmodule
