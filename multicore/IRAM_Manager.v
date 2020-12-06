module IRAM_Manager(
	input [7:0] IAddress1,IAddress2,
	input Iin,Iout,
	output reg[7:0] IAddress,
	input CLK
	);
	
	always @(posedge CLK)
	begin
	if (Iin==1)
		IAddress<=IAddress1;
	else if(Iout==1)
		IAddress<=IAddress2;
	end
	
endmodule

	