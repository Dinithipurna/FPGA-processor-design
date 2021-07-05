module MemController8

#(
	// Parameter Declarations
	parameter ncores = 8
)

(
	// Input Ports
	input [ncores-1:0] rden,wren,
	input wire [63:0] Address,
	input wire [63:0] Din ,
	input [7:0] RAMq,
	input clk,
	

	// Output Ports
	output reg [ncores-1:0] acq,
	output reg [63:0] Dq ,
	output reg [7:0] RAMAddress,
	output reg [7:0] RAMDin,
	output reg RAMwren
);

	// Module Item(s)
	
	reg	[ncores-1:0]	state,next_state;

	// Declare states
	parameter free = 0, ac0 = 1, ac1 = 2, ac2=3, ac3 = 4, ac4 = 5, ac5 = 6, ac6 = 7, ac7 = 8;

	

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
					
					if(rden[0]==0 && wren[0]==0)begin
						acq 	<= 0;
						state 	<= next_state;
					end
					else
						state <= ac0;
				end
				ac1:begin
					RAMAddress 	<= Address[15:8];
					RAMDin		<= Din[15:8];
					RAMwren		<= wren[1];
					 Dq[15:8]   <= RAMq;
					acq[1] 		<= 1;
					
					if((rden[1]==0) && (wren[1]==0))begin
						acq 	<= 0;
						state 	<= next_state;
					end
					else
						state <= ac1;
				end
				ac2:begin
					RAMAddress 	<= Address[23:16];
					RAMDin		<= Din[23:16];
					RAMwren		<= wren[2];
					 Dq[23:16]   <= RAMq;
					acq[2] 		<= 1;
					
					if((rden[2]==0) && (wren[2]==0))begin
						acq 	<= 0;
						state 	<= next_state;
					end
					else
						state <= ac2;
				end
				ac3:begin
					RAMAddress 	<= Address[31:24];
					RAMDin		<= Din[31:24];
					RAMwren		<= wren[3];
					 Dq[31:24]   <= RAMq;
					acq[3] 		<= 1;
					
					if((rden[3]==0) && (wren[3]==0))begin
						acq 	<= 0;
						state 	<= next_state;
					end
					else
						state <= ac3;
				end
				ac4:begin
					RAMAddress 	<= Address[39:32];
					RAMDin		<= Din[39:32];
					RAMwren		<= wren[4];
					 Dq[39:32]    <= RAMq;
					acq[4] 		<= 1;
					
					if(rden[4]==0 && wren[4]==0)begin
						acq 	<= 0;
						state 	<= next_state;
					end
					else
						state <= ac4;
				end
				ac5:begin
					RAMAddress 	<= Address[47:40];
					RAMDin		<= Din[47:40];
					RAMwren		<= wren[5];
					 Dq[47:40]   <= RAMq;
					acq[5] 		<= 1;
					
					if((rden[5]==0) && (wren[5]==0))begin
						acq 	<= 0;
						state 	<= next_state;
					end
					else
						state <= ac5;
				end
				ac6:begin
					RAMAddress 	<= Address[55:48];
					RAMDin		<= Din[55:48];
					RAMwren		<= wren[6];
					 Dq[55:48]   <= RAMq;
					acq[6] 		<= 1;
					
					if((rden[6]==0) && (wren[6]==0))begin
						acq 	<= 0;
						state 	<= next_state;
					end
					else
						state <= ac6;
				end
				ac3:begin
					RAMAddress 	<= Address[63:56];
					RAMDin		<= Din[63:56];
					RAMwren		<= wren[7];
					 Dq[63:56]   <= RAMq;
					acq[7] 		<= 1;
					
					if((rden[7]==0) && (wren[7]==0))begin
						acq 	<= 0;
						state 	<= next_state;
					end
					else
						state <= ac7;
				end
				
			endcase
	end

	
	// Output depends only on the state
	// always @ (state) begin
	// 	if(rden[0]==1 || wren[0]==1)
	// 		next_state <= ac0;
	// 	else if (rden[1]==1 || wren[1]==1)
	// 		next_state <= ac1;
	// 	else if (rden[2]==1 || wren[2]==1)
	// 		next_state <= ac2;
	// 	else if (rden[3]==1 || wren[3]==1)
	// 		next_state <= ac3;
	// 	else
	// 		next_state <= free;
	// end


	always @ (state) begin
    if (state==ac0) begin
		if (rden[1]==1 || wren[1]==1)
			next_state <= ac1; 
        else if (rden[2]==1 || wren[2]==1)
			next_state <= ac2;
		  else if (rden[3]==1 || wren[3]==1)
			next_state <= ac3;
		  else if (rden[4]==1 || wren[4]==1)
			next_state <= ac4;
		  else if (rden[5]==1 || wren[5]==1)
			next_state <= ac5;
		  else if (rden[6]==1 || wren[6]==1)
			next_state <= ac6;
		  else if (rden[7]==1 || wren[7]==1)
			next_state <= ac7;
        else if(rden[0]==1 || wren[0]==1)
			next_state <= ac0;
        else
			next_state <= free;
		
	end
		
        
    else if (state==ac1) begin
		if (rden[2]==1 || wren[2]==1)
			next_state <= ac2; 
		else if (rden[3]==1 || wren[3]==1)
			next_state <= ac3;
		else if (rden[4]==1 || wren[4]==1)
			next_state <= ac4;
		  else if (rden[5]==1 || wren[5]==1)
			next_state <= ac5;
		  else if (rden[6]==1 || wren[6]==1)
			next_state <= ac6;
		  else if (rden[7]==1 || wren[7]==1)
			next_state <= ac7;
        else if(rden[0]==1 || wren[0]==1)
			next_state <= ac0;
		else if (rden[1]==1 || wren[1]==1)
			next_state <= ac1;
        else
			next_state <= free;
	end
        

    else if (state==ac2) begin
		if (rden[3]==1 || wren[3]==1)
			next_state <= ac3;
		  else if (rden[4]==1 || wren[4]==1)
			next_state <= ac4;
		  else if (rden[5]==1 || wren[5]==1)
			next_state <= ac5;
		  else if (rden[6]==1 || wren[6]==1)
			next_state <= ac6;
		  else if (rden[7]==1 || wren[7]==1)
			next_state <= ac7;
		else if(rden[0]==1 || wren[0]==1)
			next_state <= ac0;
        else if (rden[1]==1 || wren[1]==1)
			next_state <= ac1;
		else if (rden[2]==1 || wren[2]==1)
			next_state <= ac2;
		else
			next_state <= free;
	end
	
	
	else if (state==ac3) begin
		if (rden[4]==1 || wren[4]==1)
			next_state <= ac4;
		  else if (rden[5]==1 || wren[5]==1)
			next_state <= ac5;
		  else if (rden[6]==1 || wren[6]==1)
			next_state <= ac6;
		  else if (rden[7]==1 || wren[7]==1)
			next_state <= ac7;
		  else if (rden[0]==1 || wren[0]==1)
			next_state <= ac0;
			else if(rden[1]==1 || wren[1]==1)
			next_state <= ac1;
        else if (rden[2]==1 || wren[2]==1)
			next_state <= ac2;
		else if (rden[3]==1 || wren[3]==1)
			next_state <= ac3;
		else
			next_state <= free;
	end
	
	
	else if (state==ac4) begin
		if (rden[5]==1 || wren[5]==1)
			next_state <= ac5;
		  else if (rden[6]==1 || wren[6]==1)
			next_state <= ac6;
		  else if (rden[7]==1 || wren[7]==1)
			next_state <= ac7;
		  else if (rden[0]==1 || wren[0]==1)
			next_state <= ac0;
		  else if (rden[1]==1 || wren[1]==1)
			next_state <= ac1;
		else if(rden[2]==1 || wren[2]==1)
			next_state <= ac2;
        else if (rden[3]==1 || wren[3]==1)
			next_state <= ac3;
		else if (rden[4]==1 || wren[4]==1)
			next_state <= ac4;
		else
			next_state <= free;
	end
	
	
	else if (state==ac5) begin
		if (rden[6]==1 || wren[6]==1)
			next_state <= ac6;
		  else if (rden[7]==1 || wren[7]==1)
			next_state <= ac7;
		  else if (rden[0]==1 || wren[0]==1)
			next_state <= ac0;
		  else if (rden[1]==1 || wren[1]==1)
			next_state <= ac1;
		  else if (rden[2]==1 || wren[2]==1)
			next_state <= ac2;
		else if(rden[3]==1 || wren[3]==1)
			next_state <= ac3;
        else if (rden[4]==1 || wren[4]==1)
			next_state <= ac4;
		else if (rden[5]==1 || wren[5]==1)
			next_state <= ac5;
		else
			next_state <= free;
	end
	
   
   else if (state==ac6) begin
		if (rden[7]==1 || wren[7]==1)
			next_state <= ac7;
		  else if (rden[0]==1 || wren[0]==1)
			next_state <= ac0;
		  else if (rden[1]==1 || wren[1]==1)
			next_state <= ac1;
		  else if (rden[2]==1 || wren[2]==1)
			next_state <= ac2;
		  else if (rden[3]==1 || wren[3]==1)
			next_state <= ac3;
		else if(rden[4]==1 || wren[4]==1)
			next_state <= ac4;
        else if (rden[5]==1 || wren[5]==1)
			next_state <= ac5;
		else if (rden[6]==1 || wren[6]==1)
			next_state <= ac6;
		else
			next_state <= free;
	end
		

    else begin
		if(rden[0]==1 || wren[0]==1)
			next_state <= ac0;
        else if (rden[1]==1 || wren[1]==1)
			next_state <= ac1;
		else if (rden[2]==1 || wren[2]==1)
			next_state <= ac2;
		else if (rden[3]==1 || wren[3]==1)
			next_state <= ac3;
		else
			next_state <= free;
	end
        
	end





	
	
	
	
	

endmodule
