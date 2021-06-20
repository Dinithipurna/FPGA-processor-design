module clkdiv_tb();

    reg clk;
    reg rst;
    reg en;
    reg busy;
    wire clk_div;
    wire [31:0] clkcount;


    initial begin
        clk <= 1'b0;
        rst <= 1'b0;
        en  <= 1'b0;
        busy <= 1'b1;
        forever begin
            #(5);
            clk <= ~clk;
        end
    end

    clkdiv dut(.*);



    initial begin
        #(30);


        @(posedge clk);
        rst <= 1'b0;
        en <= 1'b1;

        #(500);

        @(posedge clk);
        busy <= 1'b0;

        #(50);

        $stop;




    end


endmodule