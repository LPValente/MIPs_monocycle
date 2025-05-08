module ALU_control_tb;
    
    logic [5:0] instruction;
    logic [1:0] ALU_op;
    logic [3:0] op;

    ALU_control ALUt (instruction, ALU_op, op);

    initial begin
        instruction = 6'bx;
        ALU_op = 2'b00;
        #5;
        $display ("+-------------------------------------------------------");
        $display ("|ALU_op: %b  |  instruction = %b", ALU_op, instruction);
        $display ("|ALU_control output: %b", op);
        #5;
        instruction = 6'bx;
        ALU_op = 2'b01;
        #5;
        $display ("+-------------------------------------------------------");
        $display ("ALU_op: %b  |  instruction = %b", ALU_op, instruction);
        $display ("ALU_control output: %b", op);
        #5;
        instruction = 6'bxx0000;
        ALU_op = 2'b10;
        #5;
        $display ("+-------------------------------------------------------");
        $display ("ALU_op: %b  |  instruction = %b", ALU_op, instruction);
        $display ("ALU_control output: %b", op);
        #5;
        instruction = 6'bxx0010;
        ALU_op = 2'b11;
        #5;
        $display ("+-------------------------------------------------------");
        $display ("ALU_op: %b  |  instruction = %b", ALU_op, instruction);
        $display ("ALU_control output: %b", op);
        #5;
        $display ("+-------------------------------------------------------");
        $finish;
    end

endmodule