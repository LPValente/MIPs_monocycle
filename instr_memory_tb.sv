module instr_memory_tb #(parameter int N = 8, parameter int M = 32);

    logic [M-1:0] read_add;
    logic [M-1:0] instruction;

    instr_memory #(.N(N), .M(M)) insttest (read_add, instruction);

    initial begin
        for(int i = 0; i < 100; i++)begin
            read_add = i*4;
            #10;
            $display("%d:  %h", read_add, instruction);
            #10;
        end
        $finish;
    end

endmodule