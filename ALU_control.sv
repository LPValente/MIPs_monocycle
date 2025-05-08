module ALU_control (instruction, ALU_op, op);

    input logic [5:0] instruction;
    input logic [1:0] ALU_op;
    output logic [3:0] op;
    
    always_comb begin
        case (ALU_op)
            2'b00: begin
                op = 4'b0010;
            end
            2'b01: begin
                op = 4'b0110;
            end
            2'b10: begin
                if (instruction[3:0] == 4'b0000)
                    op = 4'b0010;
                if (instruction[3:0] == 4'b0010)
                    op = 4'b0110;
            end
            default: begin
                if (instruction[3:0] == 4'b0000)
                    op = 4'b0010;
                if (instruction[3:0] == 4'b0010)
                    op = 4'b0110;
            end
        endcase
    end


endmodule