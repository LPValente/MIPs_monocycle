module instr_memory #(parameter N=8, M=32) (read_add, instruction);

    input logic [M-1:0] read_add;
    output logic [M-1:0] instruction;

    logic [(2**(M/2))-1:0][N-1:0] data;

    instructions insts ();


    always_comb begin
        data = insts.CONST;
    end

    always_comb
        instruction = data[read_add +: 4];

endmodule