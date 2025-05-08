module datapath #(parameter N=32, M=32) (
    input logic clk,
    input logic rst,
    input logic RegDst,
    input logic ALUSrc,
    input logic RegWrite,
    input logic [3:0] op,
    input logic [25:0] instruction,
    input logic [31:0] WdataIn,
    output logic [31:0] result,
    output logic Z,
    output logic [31:0] WdataOut,
    output logic [31:0] out
);

    logic [$clog2(M)-1:0] Wreg, Rreg1, Rreg2;
    logic [N-1:0] Rdata1, Rdata2;

    nRegBank #(.N(N), .M(M)) nRBt (WdataIn, Wreg, Rreg1, Rreg2, Rdata1, Rdata2, RegWrite, clk, rst);

    logic [N-1:0] nA, nB;

    nALU #(.N(N)) nAt (op, nA, nB, result, Z);

    logic [(N/2)-1:0] in;

    sign_extend signEt (in, out);

    always_comb begin
        in = instruction[15:0];

        if (RegDst)
            Wreg = instruction[15:11];
        else
            Wreg = instruction[20:16];
        
        Rreg1 = instruction[25:21];
        Rreg2 = instruction[20:16];
        
        nA = Rdata1;

        if (ALUSrc)
            nB = out;
        else
            nB = Rdata2;

        WdataOut = Rdata2;
    end

endmodule