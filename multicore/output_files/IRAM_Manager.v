module IRAM_Manager(
	input [7:0] IAddress1,IAddress2,
	input Iin,Iout,
	output [7:0] IAddress,
	);
	
	always @(*)
	begin
	if (Iin==1)
		IAddress<=IAddress1;
	else if(Iout==1)
		IAddress<=IAddress2;
	end
	
endmodule

	