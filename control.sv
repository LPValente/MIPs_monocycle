module control (
    input logic [5:0] instruction,
    input logic Op5, Op4, Op3, Op2, Op1, Op0,
    output logic RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0,
    output logic [3:0] op
);

    main_control mct (Op5, Op4, Op3, Op2, Op1, Op0, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0);

    ALU_control ALUct (instruction, {ALUOp1, ALUOp0}, op);

endmodule