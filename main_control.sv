module main_control(
    input logic Op5, Op4, Op3, Op2, Op1, Op0,
    output logic RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0
    );

    logic [5:0] Op;
    logic [8:0] out;

    always_comb begin
        Op = {Op5, Op4, Op3, Op2, Op1, Op0};
        case (Op)
            6'b000000: out = 9'b100100010;
            6'b100011: out = 9'b011110000;
            6'b101011: out = 9'bx1x001000;
            6'b000100: out = 9'bx0x000101;
            6'b100000: out = 9'b010100000; // extra (inicializa dados da memoria de dados)
            default: out = 0;
        endcase
        {RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0} = out;
    end
    
endmodule