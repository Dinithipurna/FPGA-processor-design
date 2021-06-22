module MemController4

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
	output reg  [31:0] Dq = 32'd0,
	output reg [7:0] RAMAddress = 8'd0,
	output reg [7:0] RAMDin = 8'd0,
	output reg RAMwren = 1'd0
);

	// Module Item(s)
	
	// Declare states
	parameter free = 0, ac0 = 1, ac1 = 2, ac2=3, ac3 = 4;

	reg	[ncores-1:0]	state =  free ,next_state =  free;

	// assign Dq = {RAMq,RAMq,RAMq,RAMq};

	
	always @(*) begin
		case(state)
		ac0 : begin
			if(rden[0]==1 || wren[0]==1)
				next_state = ac0;
			else if (rden[1]==1 || wren[1]==1)
				next_state = ac1; 
			else if (rden[2]==1 || wren[2]==1)
				next_state = ac2;
			else if (rden[3]==1 || wren[3]==1)
				next_state = ac3;
			else
				next_state = free;
			
		end
		ac1 : begin
			if (rden[1]==1 || wren[1]==1)
				next_state = ac1;
			else if (rden[2]==1 || wren[2]==1)
				next_state = ac2; 
			else if (rden[3]==1 || wren[3]==1)
				next_state = ac3;
			else if(rden[0]==1 || wren[0]==1)
				next_state = ac0;
			
			else
				next_state = free;
			
		end
		ac2 : begin
			if (rden[2]==1 || wren[2]==1)
				next_state = ac2;
			else if (rden[3]==1 || wren[3]==1)
				next_state = ac3;
			else if(rden[0]==1 || wren[0]==1)
				next_state = ac0;
			else if (rden[1]==1 || wren[1]==1)
				next_state = ac1;
			else
				next_state = free;
		end
		ac3 : begin
			if (rden[3]==1 || wren[3]==1)
				next_state = ac3;
			else if(rden[0]==1 || wren[0]==1)
				next_state = ac0;
			else if (rden[1]==1 || wren[1]==1)
				next_state = ac1;
			else if (rden[2]==1 || wren[2]==1)
				next_state = ac2;
			
			else
				next_state = free;
		end
		free : begin
			if(rden[0]==1 || wren[0]==1)
				next_state = ac0;
			else if (rden[1]==1 || wren[1]==1)
				next_state = ac1;
			else if (rden[2]==1 || wren[2]==1)
				next_state = ac2;
			else if (rden[3]==1 || wren[3]==1)
				next_state = ac3;
			else
				next_state = free;
		end

		endcase	

		
	end

	// always @(posedge clk) begin
	// 	state <= next_state;
	// end


	always @ (posedge clk ) begin
			state = next_state;
			case (state)
				free:begin
					acq 		<= 0;

				end		
				ac0:begin
					RAMAddress 	<= Address[7:0];
					RAMDin		<= Din[7:0];
					RAMwren		<= wren[0];
					Dq[7:0]    	<= RAMq;
					acq[0] 		<= 1;
					acq[1] 		<= 0;
					acq[2] 		<= 0;
					acq[3] 		<= 0;
					
					
				end
				ac1:begin
					RAMAddress 	<= Address[15:8];
					RAMDin		<= Din[15:8];
					RAMwren		<= wren[1];
					Dq[15:8]   	<= RAMq;
					acq[0] 		<= 0;
					acq[1] 		<= 1;
					acq[2] 		<= 0;
					acq[3] 		<= 0;
					
				end
				ac2:begin
					RAMAddress 	<= Address[23:16];
					RAMDin		<= Din[23:16];
					RAMwren		<= wren[2];
					Dq[23:16]  	<= RAMq;
					acq[0] 		<= 0;
					acq[1] 		<= 0;
					acq[2] 		<= 1;
					acq[3] 		<= 0;
					
				end
				ac3:begin
					RAMAddress 	<= Address[31:24];
					RAMDin		<= Din[31:24];
					RAMwren		<= wren[3];
					Dq[31:24]   <= RAMq;
					acq[0] 		<= 0;
					acq[1] 		<= 0;
					acq[2] 		<= 0;
					acq[3] 		<= 1;
					
				end								
			endcase
	end

	
	
	

endmodule
