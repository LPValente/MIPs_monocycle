module nALU_tb #(parameter N = 32) ();
    logic [3:0] op;
    logic [N-1:0] nA, nB;
    logic [N-1:0] result, resmult;
    logic Z, Co;
    
    
    typedef enum logic [3:0] {
    add = 4'b0010,
    sub = 4'b0110,
    shL = 4'b0000,
    shRl= 4'b0001,
    shRa= 4'b0011,
    And = 4'b0100,
    Or  = 4'b0101,
    Xor = 4'b0111
    } ops;

    ops opr;

    nALU #( .N(32)) nalut (op, nA, nB, result, resmult, Z, Co);

    initial begin
        for (int i = 0; i < 8; i++) begin
            op = i[3:0];
            //opr = i[3:0];
            nA = 32;
            nB = 16;
            #10;
            if (resmult == 0)
                $display("\t%d | %d | %d |           %d | %b | %b", op, nA, nB, result, Z, Co);
            else
                $display("\t%d | %d | %d | %d%010d | %b | %b", op, nA, nB, resmult, result, Z, Co);
        end
    end

endmodule
