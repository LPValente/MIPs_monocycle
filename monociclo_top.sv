module monociclo_top (
    input logic clk,
    input logic rst
);

    logic [31:0] read_add;
    logic [31:0] next_add;

    programcounter pc (next_add, clk, rst, read_add);

    logic [31:0] instruction;

    instr_memory imt (read_add, instruction);

    logic RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0;
    logic [3:0] ALU_op;

    control ctrlt (
        instruction [5:0],
        instruction [31], instruction [30], instruction [29], instruction [28], instruction [27], instruction [26],
        RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0,
        ALU_op);

    logic [31:0] WdataIn;
    logic [31:0] result;
    logic Z;
    logic [31:0] WdataOut;
    logic [31:0] out;

    datapath #(.N(32), .M(32)) dpt (clk, rst, RegDst, ALUSrc, RegWrite, ALU_op, instruction[25:0], WdataIn, result, Z, WdataOut, out);

    logic [31:0] Rdata;

    data_memory dmt (clk, rst, MemWrite, MemRead, result, WdataOut, Rdata);

    always_comb begin
        if (MemtoReg)
            WdataIn = Rdata;
        else
            WdataIn = result;
        
        if (Branch && Z)
            next_add = (read_add + 4) + (out << 2);
        else
            next_add = read_add + 4;
    end

endmodule