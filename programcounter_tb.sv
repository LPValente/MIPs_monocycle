module programcounter_tb;

    logic [31:0] addr_in, addr_out;
    logic clk, rst;

    programcounter pc (addr_in, clk, rst, addr_out);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        forever #5 addr_in = addr_out + 4;
    end

    initial begin
        forever #10 $display("%d", addr_out);
    end

    initial begin
        rst = 1;
        #10;
        rst = 0;

        #250;
        $finish;
    end


endmodule