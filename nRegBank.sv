module nRegBank #(parameter int N=8, parameter int M=8) (Wdata, Wreg, Rreg1, Rreg2, Rdata1, Rdata2, RegWrite, clk, rst);

    input logic clk, rst, RegWrite;
    input logic [N-1:0] Wdata;
    input logic [$clog2(M)-1:0] Wreg, Rreg1, Rreg2;
    output logic [N-1:0] Rdata1, Rdata2;

    logic [M-1:0] en;
    logic [M-1:0][N-1:0] out;

    generate
        for (genvar g = 0; g <= M-1; g++) begin
            if (g==0)
                nRegUnit #(.N(N)) nRt (Wdata, out[g], en[g], clk, 1'b1);
            else
                nRegUnit #(.N(N)) nRt (Wdata, out[g], en[g], clk, rst);
        end
    endgenerate

    always_comb begin
        Rdata1 = out[Rreg1];
        Rdata2 = out[Rreg2];
        for (int i = 0; i <= M-1; i++) begin
            if (RegWrite & i==Wreg)
                en[i] = 1;
            else
                en[i] = 0;
        end
    end

endmodule
