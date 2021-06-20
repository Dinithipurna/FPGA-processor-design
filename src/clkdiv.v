module clkdiv(
    input clk,
    input rst,
    input en,
    input busy,
    output reg clk_div = 1'b0,
    output reg[31:0] clkcount = 32'd0
    ); 
	 
	 localparam constantNumber = 4;
	 reg [31:0] count = 0;
 
 
always @ (posedge(clk), posedge(rst))
begin
    if (rst == 1'b1)
        count <= 32'b0;
    else if (count == constantNumber - 1)
        count <= 32'b0;
    else if(en)
        count <= count + 1;
    else count <= count;
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
    else clkcount <= clkcount;
end
     
 
endmodule			
			
		
	