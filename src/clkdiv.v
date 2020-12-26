module clkdiv(
    input clk,
    input rst,
    input en,
    input busy,
    output reg clk_div,
    output reg[31:0] clkcount
    ); 
	 
	 localparam constantNumber = 500;
	 reg [31:0] count;
 
always @ (posedge(clk), posedge(rst))
begin
    if (rst == 1'b1)
        count <= 32'b0;
    else if (count == constantNumber - 1)
        count <= 32'b0;
    else if(en)
        count <= count + 1;
end

always @ (posedge(clk), posedge(rst))
begin
    if (rst == 1'b1)
        clk_div <= 1'b0;
    else if (count == constantNumber - 1 && en)
	 
        clk_div <= ~clk_div;
    else
        clk_div <= clk_div;
end


always @(posedge(clk_div))
begin
    if(busy)
        clkcount <= clkcount + 1 ;
end
     
 
endmodule			
			
		
	