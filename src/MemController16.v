module MemController16

#(
	// Parameter Declarations
	parameter ncores = 16
)

(
	// Input Ports
	input [ncores-1:0] rden,wren,
	input wire [127:0] Address,
	input wire [127:0] Din ,
	input [7:0] RAMq,
	input clk,
	

	// Output Ports
	output reg [ncores-1:0] acq,
	output reg [127:0] Dq ,
	output reg [7:0] RAMAddress,
	output reg [7:0] RAMDin,
	output reg RAMwren
);

	// Module Item(s)
	
	reg	[ncores-1:0]	state,next_state;

	// Declare states
	parameter free = 0, ac0 = 1, ac1 = 2, ac2=3, ac3 = 4, ac4 = 5, ac5 = 6, ac6 = 7, ac7 = 8, ac8 = 9, ac9 = 10, ac10 = 11, ac11 = 12, ac12 = 13, ac13 = 14, ac14 = 15, ac15 = 16;

	

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
				ac7:begin
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
				ac8:begin
					RAMAddress 	<= Address[71:64];
					RAMDin		<= Din[71:64];
					RAMwren		<= wren[8];
					 Dq[71:64]   <= RAMq;
					acq[8] 		<= 1;
					
					if((rden[8]==0) && (wren[8]==0))begin
						acq 	<= 0;
						state 	<= next_state;
					end
					else
						state <= ac8;
				end
				ac9:begin
					RAMAddress 	<= Address[79:72];
					RAMDin		<= Din[79:72];
					RAMwren		<= wren[9];
					Dq[79:72]   <= RAMq;
					acq[9] 		<= 1;
					
					if((rden[9]==0) && (wren[9]==0))begin
						acq 	<= 0;
						state 	<= next_state;
					end
					else
						state <= ac9;
				end
				ac10:begin
					RAMAddress 	<= Address[87:80];
					RAMDin		<= Din[87:80];
					RAMwren		<= wren[10];
					 Dq[87:80]   <= RAMq;
					acq[10] 		<= 1;
					
					if((rden[10]==0) && (wren[10]==0))begin
						acq 	<= 0;
						state 	<= next_state;
					end
					else
						state <= ac10;
				end
				ac11:begin
					RAMAddress 	<= Address[95:88];
					RAMDin		<= Din[95:88];
					RAMwren		<= wren[11];
					 Dq[95:88]   <= RAMq;
					acq[11] 		<= 1;
					
					if((rden[11]==0) && (wren[11]==0))begin
						acq 	<= 0;
						state 	<= next_state;
					end
					else
						state <= ac11;
				end
				ac12:begin
					RAMAddress 	<= Address[103:96];
					RAMDin		<= Din[103:96];
					RAMwren		<= wren[12];
					 Dq[103:96]   <= RAMq;
					acq[12] 		<= 1;
					
					if((rden[12]==0) && (wren[12]==0))begin
						acq 	<= 0;
						state 	<= next_state;
					end
					else
						state <= ac12;
				end
				ac13:begin
					RAMAddress 	<= Address[111:104];
					RAMDin		<= Din[111:104];
					RAMwren		<= wren[13];
					 Dq[111:104]   <= RAMq;
					acq[13] 		<= 1;
					
					if((rden[13]==0) && (wren[13]==0))begin
						acq 	<= 0;
						state 	<= next_state;
					end
					else
						state <= ac13;
				end
				ac14:begin
					RAMAddress 	<= Address[119:112];
					RAMDin		<= Din[119:112];
					RAMwren		<= wren[14];
					 Dq[119:112]   <= RAMq;
					acq[14] 		<= 1;
					
					if((rden[14]==0) && (wren[14]==0))begin
						acq 	<= 0;
						state 	<= next_state;
					end
					else
						state <= ac14;
				end
				ac15:begin
					RAMAddress 	<= Address[127:120];
					RAMDin		<= Din[127:120];
					RAMwren		<= wren[15];
					 Dq[127:120]   <= RAMq;
					acq[15] 		<= 1;
					
					if((rden[15]==0) && (wren[15]==0))begin
						acq 	<= 0;
						state 	<= next_state;
					end
					else
						state <= ac15;
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
		  else if (rden[8]==1 || wren[8]==1)
			next_state <= ac8;
		  else if (rden[9]==1 || wren[9]==1)
			next_state <= ac9;
		  else if (rden[10]==1 || wren[10]==1)
			next_state <= ac10;
		  else if (rden[11]==1 || wren[11]==1)
			next_state <= ac11;
		  else if (rden[12]==1 || wren[12]==1)
			next_state <= ac12;
		  else if (rden[13]==1 || wren[13]==1)
			next_state <= ac13;
        else if(rden[14]==1 || wren[14]==1)
			next_state <= ac14;
		  else if(rden[15]==1 || wren[15]==1)
			next_state <= ac15;
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
		  else if (rden[8]==1 || wren[8]==1)
			next_state <= ac8;
		  else if (rden[9]==1 || wren[9]==1)
			next_state <= ac9;
		  else if (rden[10]==1 || wren[10]==1)
			next_state <= ac10;
		  else if (rden[11]==1 || wren[11]==1)
			next_state <= ac11;
		  else if (rden[12]==1 || wren[12]==1)
			next_state <= ac12;
		  else if (rden[13]==1 || wren[13]==1)
			next_state <= ac13;
        else if(rden[14]==1 || wren[14]==1)
			next_state <= ac14;
		  else if(rden[15]==1 || wren[15]==1)
			next_state <= ac15;
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
		  else if (rden[8]==1 || wren[8]==1)
			next_state <= ac8;
		  else if (rden[9]==1 || wren[9]==1)
			next_state <= ac9;
		  else if (rden[10]==1 || wren[10]==1)
			next_state <= ac10;
		  else if (rden[11]==1 || wren[11]==1)
			next_state <= ac11;
		  else if (rden[12]==1 || wren[12]==1)
			next_state <= ac12;
		  else if (rden[13]==1 || wren[13]==1)
			next_state <= ac13;
        else if(rden[14]==1 || wren[14]==1)
			next_state <= ac14;
		  else if(rden[15]==1 || wren[15]==1)
			next_state <= ac15;
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
		  else if (rden[8]==1 || wren[8]==1)
			next_state <= ac8;
		  else if (rden[9]==1 || wren[9]==1)
			next_state <= ac9;
		  else if (rden[10]==1 || wren[10]==1)
			next_state <= ac10;
		  else if (rden[11]==1 || wren[11]==1)
			next_state <= ac11;
		  else if (rden[12]==1 || wren[12]==1)
			next_state <= ac12;
		  else if (rden[13]==1 || wren[13]==1)
			next_state <= ac13;
        else if(rden[14]==1 || wren[14]==1)
			next_state <= ac14;
		  else if(rden[15]==1 || wren[15]==1)
			next_state <= ac15;
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
		  else if (rden[8]==1 || wren[8]==1)
			next_state <= ac8;
		  else if (rden[9]==1 || wren[9]==1)
			next_state <= ac9;
		  else if (rden[10]==1 || wren[10]==1)
			next_state <= ac10;
		  else if (rden[11]==1 || wren[11]==1)
			next_state <= ac11;
		  else if (rden[12]==1 || wren[12]==1)
			next_state <= ac12;
		  else if (rden[13]==1 || wren[13]==1)
			next_state <= ac13;
        else if(rden[14]==1 || wren[14]==1)
			next_state <= ac14;
		  else if(rden[15]==1 || wren[15]==1)
			next_state <= ac15;
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
		  else if (rden[8]==1 || wren[8]==1)
			next_state <= ac8;
		  else if (rden[9]==1 || wren[9]==1)
			next_state <= ac9;
		  else if (rden[10]==1 || wren[10]==1)
			next_state <= ac10;
		  else if (rden[11]==1 || wren[11]==1)
			next_state <= ac11;
		  else if (rden[12]==1 || wren[12]==1)
			next_state <= ac12;
		  else if (rden[13]==1 || wren[13]==1)
			next_state <= ac13;
        else if(rden[14]==1 || wren[14]==1)
			next_state <= ac14;
		  else if(rden[15]==1 || wren[15]==1)
			next_state <= ac15;
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
		  else if (rden[8]==1 || wren[8]==1)
			next_state <= ac8;
		  else if (rden[9]==1 || wren[9]==1)
			next_state <= ac9;
		  else if (rden[10]==1 || wren[10]==1)
			next_state <= ac10;
		  else if (rden[11]==1 || wren[11]==1)
			next_state <= ac11;
		  else if (rden[12]==1 || wren[12]==1)
			next_state <= ac12;
		  else if (rden[13]==1 || wren[13]==1)
			next_state <= ac13;
        else if(rden[14]==1 || wren[14]==1)
			next_state <= ac14;
		  else if(rden[15]==1 || wren[15]==1)
			next_state <= ac15;
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
	
	else if (state==ac7) begin
		 if (rden[8]==1 || wren[8]==1)
			next_state <= ac8;
		  else if (rden[9]==1 || wren[9]==1)
			next_state <= ac9;
		  else if (rden[10]==1 || wren[10]==1)
			next_state <= ac10;
		  else if (rden[11]==1 || wren[11]==1)
			next_state <= ac11;
		  else if (rden[12]==1 || wren[12]==1)
			next_state <= ac12;
		  else if (rden[13]==1 || wren[13]==1)
			next_state <= ac13;
        else if(rden[14]==1 || wren[14]==1)
			next_state <= ac14;
		  else if(rden[15]==1 || wren[15]==1)
			next_state <= ac15;
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
		else if (rden[7]==1 || wren[7]==1)
			next_state <= ac7;
		else
			next_state <= free;
	end
	
	else if (state==ac8) begin
		if (rden[9]==1 || wren[9]==1)
			next_state <= ac9;
		  else if (rden[10]==1 || wren[10]==1)
			next_state <= ac10;
		  else if (rden[11]==1 || wren[11]==1)
			next_state <= ac11;
		  else if (rden[12]==1 || wren[12]==1)
			next_state <= ac12;
		  else if (rden[13]==1 || wren[13]==1)
			next_state <= ac13;
        else if(rden[14]==1 || wren[14]==1)
			next_state <= ac14;
		  else if(rden[15]==1 || wren[15]==1)
			next_state <= ac15;
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
		else if (rden[7]==1 || wren[7]==1)
			next_state <= ac7;
		  else if (rden[8]==1 || wren[8]==1)
			next_state <= ac8;
		  else 
			next_state <= free;
	end
	
	else if (state==ac9) begin
		if (rden[10]==1 || wren[10]==1)
			next_state <= ac10;
		  else if (rden[11]==1 || wren[11]==1)
			next_state <= ac11;
		  else if (rden[12]==1 || wren[12]==1)
			next_state <= ac12;
		  else if (rden[13]==1 || wren[13]==1)
			next_state <= ac13;
        else if(rden[14]==1 || wren[14]==1)
			next_state <= ac14;
		  else if(rden[15]==1 || wren[15]==1)
			next_state <= ac15;
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
		else if (rden[7]==1 || wren[7]==1)
			next_state <= ac7;
		  else if (rden[8]==1 || wren[8]==1)
			next_state <= ac8;
		  else if (rden[9]==1 || wren[9]==1)
			next_state <= ac9;
		  else 
			next_state <= free;
	end
	
	else if (state==ac10) begin
		if (rden[11]==1 || wren[11]==1)
			next_state <= ac11;
		  else if (rden[12]==1 || wren[12]==1)
			next_state <= ac12;
		  else if (rden[13]==1 || wren[13]==1)
			next_state <= ac13;
        else if(rden[14]==1 || wren[14]==1)
			next_state <= ac14;
		  else if(rden[15]==1 || wren[15]==1)
			next_state <= ac15;
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
		else if (rden[7]==1 || wren[7]==1)
			next_state <= ac7;
		  else if (rden[8]==1 || wren[8]==1)
			next_state <= ac8;
		  else if (rden[9]==1 || wren[9]==1)
			next_state <= ac9;
		  else if (rden[10]==1 || wren[10]==1)
			next_state <= ac10;
		  else 
			next_state <= free;
	end
	
	else if (state==ac11) begin
		if (rden[12]==1 || wren[12]==1)
			next_state <= ac12;
		  else if (rden[13]==1 || wren[13]==1)
			next_state <= ac13;
        else if(rden[14]==1 || wren[14]==1)
			next_state <= ac14;
		  else if(rden[15]==1 || wren[15]==1)
			next_state <= ac15;
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
		else if (rden[7]==1 || wren[7]==1)
			next_state <= ac7;
		  else if (rden[8]==1 || wren[8]==1)
			next_state <= ac8;
		  else if (rden[9]==1 || wren[9]==1)
			next_state <= ac9;
		  else if (rden[10]==1 || wren[10]==1)
			next_state <= ac10;
		  else if (rden[11]==1 || wren[11]==1)
			next_state <= ac11;
		  else 
			next_state <= free;
	end
	
	else if (state==ac12) begin
		if (rden[13]==1 || wren[13]==1)
			next_state <= ac13;
        else if(rden[14]==1 || wren[14]==1)
			next_state <= ac14;
		  else if(rden[15]==1 || wren[15]==1)
			next_state <= ac15;
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
		else if (rden[7]==1 || wren[7]==1)
			next_state <= ac7;
		  else if (rden[8]==1 || wren[8]==1)
			next_state <= ac8;
		  else if (rden[9]==1 || wren[9]==1)
			next_state <= ac9;
		  else if (rden[10]==1 || wren[10]==1)
			next_state <= ac10;
		  else if (rden[11]==1 || wren[11]==1)
			next_state <= ac11;
		  else if (rden[12]==1 || wren[12]==1)
			next_state <= ac12;
		  else 
			next_state <= free;
	end
	
	else if (state==ac13) begin
		if(rden[14]==1 || wren[14]==1)
			next_state <= ac14;
		else if(rden[15]==1 || wren[15]==1)
			next_state <= ac15;
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
		else if (rden[7]==1 || wren[7]==1)
			next_state <= ac7;
		  else if (rden[8]==1 || wren[8]==1)
			next_state <= ac8;
		  else if (rden[9]==1 || wren[9]==1)
			next_state <= ac9;
		  else if (rden[10]==1 || wren[10]==1)
			next_state <= ac10;
		  else if (rden[11]==1 || wren[11]==1)
			next_state <= ac11;
		  else if (rden[12]==1 || wren[12]==1)
			next_state <= ac12;
		  else if (rden[13]==1 || wren[13]==1)
			next_state <= ac13;
        else 
			next_state <= free;
	end
	
	   else if (state==ac14) begin
		if(rden[15]==1 || wren[15]==1)
			next_state <= ac15;
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
		else if (rden[7]==1 || wren[7]==1)
			next_state <= ac7;
		  else if (rden[8]==1 || wren[8]==1)
			next_state <= ac8;
		  else if (rden[9]==1 || wren[9]==1)
			next_state <= ac9;
		  else if (rden[10]==1 || wren[10]==1)
			next_state <= ac10;
		  else if (rden[11]==1 || wren[11]==1)
			next_state <= ac11;
		  else if (rden[12]==1 || wren[12]==1)
			next_state <= ac12;
		  else if (rden[13]==1 || wren[13]==1)
			next_state <= ac13;
        else if(rden[14]==1 || wren[14]==1)
			next_state <= ac14;
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
