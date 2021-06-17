module MemController_tb();

    reg [1:0] rden,wren;
    reg [15:0] Address, Din;
    reg clk;
    reg [7:0] RAMq;

    wire [1:0] acq;
    wire [15:0] Dq;
    wire [7:0] RAMAddress,RAMDin;
    wire RAMwren;

    initial begin
        clk <= 1'b0;
        rden <= 2'b01;
        wren <= 2'b00;
        Address <= 16'h0309;
        Din <= 16'h0508;
        RAMq <= 8'd10;
        forever begin
            #(5);
            clk <= ~clk;
        end
    end

    MemController dut (.*);


    initial begin
        #(30);


        @(posedge clk);
        rden <= 2'b01;

        #(10);
        @(posedge clk);
        rden <= 2'b11;

        #(10);
        @(posedge clk);
        rden <= 2'd0;

        #(10);
        @(posedge clk);
        wren <= 2'b11;

        #(10);
        @(posedge clk);
        rden <= 2'b11;

        #(10);
        @(posedge clk);
        rden <= 2'd0;

        #(10);
        @(posedge clk);
        wren <= 2'b11;

        #(10);
        @(posedge clk);
        rden <= 2'b11;

        #(10);
        @(posedge clk);
        rden <= 2'd0;

        #(10);
        @(posedge clk);
        wren <= 2'b11;

        #(10);
        @(posedge clk);
        rden <= 2'b11;

        #(10);
        @(posedge clk);
        rden <= 2'd0;


        $stop;










    end

endmodule