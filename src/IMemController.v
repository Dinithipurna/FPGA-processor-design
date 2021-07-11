module IMemController

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
	output reg [ncores-1:0] acq = 0,
	output [15:0] Dq,
	output reg [7:0] RAMAddress = 8'd0,
	output reg [7:0] RAMDin = 8'd0,
	output reg RAMwren = 1'd0
);

	// Module Item(s)
	
	// Declare states
	parameter free = 0, ac = 1 , ac1 = 2;

	reg	[ncores-1:0]	state =  free ,next_state =  free;

	assign Dq = {RAMq,RAMq};

	
	always @(*) begin
		if(rden!=0 || wren!=0)
			next_state = free;
		// else if(Address[7:0] == Address[31:24])
		// 	next_state = ac;
		// else if(Address[7:0] == Address[23:16])
		// 	next_state = ac;
		else if(Address[7:0] == Address[15:8])
			next_state = ac;
		else
			next_state = ac1;

		
	end


	always @ (posedge clk ) begin
			state <= next_state;
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
					//acq[2] 		<= 1;
					//acq[3] 		<= 1;		
				end
				ac1:begin
					RAMAddress 	<= Address[7:0];
					RAMDin		<= Din[7:0];
					RAMwren		<= wren[0];
					// Dq[7:0]    	<= RAMq;
					acq[0] 		<= 1;
					acq[1] 		<= 0;
					//acq[2] 		<= 0;
					//acq[3] 		<= 0;		
				end	
				// ac2:begin
				// 	RAMAddress 	<= Address[7:0];
				// 	RAMDin		<= Din[7:0];
				// 	RAMwren		<= wren[0];
				// 	// Dq[7:0]    	<= RAMq;
				// 	acq[0] 		<= 1;
				// 	acq[1] 		<= 0;
				// 	acq[2] 		<= 0;
				// 	//acq[3] 		<= 0;		
				// end	
				// ac3:begin
				// 	RAMAddress 	<= Address[7:0];
				// 	RAMDin		<= Din[7:0];
				// 	RAMwren		<= wren[0];
				// 	// Dq[7:0]    	<= RAMq;
				// 	acq[0] 		<= 1;
				// 	acq[1] 		<= 0;
				// 	acq[2] 		<= 0;
				// 	acq[3] 		<= 0;		
				// end								
			endcase
	end

	
	
	

endmodule
