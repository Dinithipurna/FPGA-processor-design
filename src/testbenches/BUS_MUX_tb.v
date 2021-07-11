module BUS_MUX_tb();

reg	[7:0]  data0x;
reg	[7:0]  data10x;
reg	[7:0]  data11x;
reg	[7:0]  data12x;
reg	[7:0]  data1x;
reg	[7:0]  data2x;
reg	[7:0]  data3x;
reg	[7:0]  data4x;
reg	[7:0]  data5x;
reg	[7:0]  data6x;
reg	[7:0]  data7x;
reg	[7:0]  data8x;
reg	[7:0]  data9x;
reg	[3:0]  sel;
wire	[7:0]  result;

initial begin
data0x <= 8'b0;
data10x <= 8'b0 ;
data11x <= 8'b0;
data12x <= 8'b0;
data1x <= 8'b0;
data2x <= 8'b0;
data3x <= 8'b0;
data4x <= 8'b0;
data5x <= 8'b0;
data6x <= 8'b0;
data7x <= 8'b0;
data8x <= 8'b0;
data9x <= 8'b0;
sel <= 8'b0;
end

initial begin

repeat(10)begin
data0x <= $random;
data10x <= $random ;
data11x <= $random;
data12x <= $random;
data1x <= $random;
data2x <= $random;
data3x <= $random;
data4x <= $random;
data5x <= $random;
data6x <= $random;
data7x <= $random;
data8x <= $random;
data9x <= $random;
sel <= $random; 
end

   
end
endmodule

