module nALU #(parameter N = 32) (op, nA, nB, result, Z);

input logic [3:0] op;
input logic [N-1:0] nA, nB;
output logic [N-1:0] result;
output logic Z;

typedef enum logic [3:0] {
    add = 4'b0010,
    sub = 4'b0110,
    shL = 4'b0001,
    shRl= 4'b0011,
    shRa= 4'b0100,
    And = 4'b0101,
    Or  = 4'b0111,
    Xor = 4'b1000
    } ops;

logic [N-1:0] tempA, tempB;

always_comb begin
    case (op)
        add:  result = nA + nB;
        sub:  result = nA - nB;
        shL:  result = nA << nB;
        shRl: result = nA >> nB;
        shRa: result = nA >>> nB;
        And:  result = nA & nB;
        Or:   result = nA | nB;
        Xor:  result = nA ^ nB;
        default: result = 0;
    endcase

    Z = (result == 0);
end

endmodule
