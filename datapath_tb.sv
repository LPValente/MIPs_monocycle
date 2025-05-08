module datapath_tb;

    logic clk;
    logic rst;
    logic RegDst;
    logic ALUSrc;
    logic RegWrite;
    logic [3:0] op;
    logic [25:0] instruction;
    logic [31:0] WdataIn;
    logic [31:0] result;
    logic Z;
    logic [31:0] WdataOut;
    logic [31:0] out;

    datapath dpt (clk, rst, RegDst, ALUSrc, RegWrite, op, instruction, WdataIn, result, Z, WdataOut, out);

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
        WdataIn = 40;
        RegDst = 1;
        instruction = {5'd1, 5'd2, 5'd1, 11'd0};
        RegWrite = 1;
        ALUSrc = 0;
        @(posedge clk);
        RegWrite = 0;
        @(posedge clk);
        WdataIn = 20;
        RegDst = 1;
        instruction = {5'd1, 5'd2, 5'd2, 11'd0};
        RegWrite = 1;
        @(posedge clk);
        RegWrite = 0;
        op = 4'd2;
        @(posedge clk);
        $display("%d, %d, %d", dpt.Rdata1, dpt.Rdata2, result);
        op = 4'd6;
        @(posedge clk);
        $display("%d, %d, %d", dpt.Rdata1, dpt.Rdata2, result);
        $finish;
    end

endmodule