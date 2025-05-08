module monociclo_top_tb;

    logic clk, rst;

    monociclo_top mono (clk, rst);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        #10;
        rst = 0;
    end

    initial begin
        @(negedge rst);
        @(posedge clk);
        @(posedge clk);
        $display("--------------------------------------");
        $display("--------   Register [31:0]  ----------");
        $display("--------   init operation   ----------");
        for (int i = 0; i < 32; i++)
            $display ("reg [%2d]: %4d", i, mono.dpt.nRBt.out[i]);
        @(posedge clk);
        $display("--------------------------------------");
        $display("--------   Register [31:0]  ----------");
        $display("--------   init operation   ----------");
        for (int i = 0; i < 32; i++)
            $display ("reg [%2d]: %4d", i, mono.dpt.nRBt.out[i]);
        @(posedge clk);
        $display("--------------------------------------");
        $display("--------   Register [31:0]  ----------");
        $display("--------   init operation   ----------");
        for (int i = 0; i < 32; i++)
            $display ("reg [%2d]: %4d", i, mono.dpt.nRBt.out[i]);
        @(posedge clk);
        $display("--------------------------------------");
        $display("-------- Data Memory [31:0] ----------");
        $display("--------    SW operation    ----------");
        for (int i = 0; i < 32; i++)
            $display ("mem add [%2d]: %d", i, mono.dmt.data[i]);
        @(posedge clk);
        $display("--------------------------------------");
        $display("--------   Register [31:0]  ----------");
        $display("--------    LW operation    ----------");
        for (int i = 0; i < 32; i++)
            $display ("reg [%2d]: %4d", i, mono.dpt.nRBt.out[i]);
        @(posedge clk);
        $display("--------------------------------------");
        $display("--------   Register [31:0]  ----------");
        $display("--------   ADD operation    ----------");
        for (int i = 0; i < 32; i++)
            $display ("reg [%2d]: %4d", i, mono.dpt.nRBt.out[i]);
        @(posedge clk);
        $display("--------------------------------------");
        $display("--------   Register [31:0]  ----------");
        $display("--------   SUB operation    ----------");
        for (int i = 0; i < 32; i++)
            $display ("reg [%2d]: %4d", i, mono.dpt.nRBt.out[i]);
        @(posedge clk);
        $display("--------------------------------------");
        $display("--------   Register [31:0]  ----------");
        $display("--------   ADD operation    ----------");
        for (int i = 0; i < 32; i++)
            $display ("reg [%2d]: %4d", i, mono.dpt.nRBt.out[i]);
        @(posedge clk);
        $display("--------------------------------------");
        $display("--------   Register [31:0]  ----------");
        $display("--------   BEQ operation    ----------");
        for (int i = 0; i < 32; i++)
            $display ("reg [%2d]: %4d", i, mono.dpt.nRBt.out[i]);
        @(posedge clk);
        $display("--------------------------------------");
        $display("--------   Register [31:0]  ----------");
        $display("--------       Post-BEQ     ----------");
        for (int i = 0; i < 32; i++)
            $display ("reg [%2d]: %4d", i, mono.dpt.nRBt.out[i]);
        $finish;
    end

endmodule