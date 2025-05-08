module nRegBank_tb #(parameter N=32, M=32);

    logic clk, rst, RegWrite;
    logic [N-1:0] Wdata, Rdata1, Rdata2;
    logic [$clog2(M)-1:0] Wreg, Rreg1, Rreg2;

    nRegBank #(.N(N), .M(M)) nRBt (Wdata, Wreg, Rreg1, Rreg2, Rdata1, Rdata2, RegWrite, clk, rst);

    initial begin
        clk = 1;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        #10;
        for (int i = 0; i < 32; i++) begin
            Rreg1 = i;
            #10;
            $display("%0d || %0d", Rreg1, Rdata1);
        end
        #10;

        for (int i = 0; i < 32; i++) begin
            Rreg1 = i;
            Wreg = i;
            Wdata = (i+2)**2;
            RegWrite = 1;
            #10;
            RegWrite = 0;
            #10;
            $display("%0d || %0d", Rreg1, Rdata1);
        end
        $finish;
    end
endmodule