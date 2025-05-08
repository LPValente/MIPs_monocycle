module main_control_tb;
    
    logic Op5, Op4, Op3, Op2, Op1, Op0;
    logic RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0;

    main_control mct (Op5, Op4, Op3, Op2, Op1, Op0, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0);

    logic [5:0] Op;

    initial begin
        forever #1 {Op5, Op4, Op3, Op2, Op1, Op0} = Op; 
    end

    initial begin
        Op = 6'b000000;
        #5;
        $display ("+-------------------------------------------------------");
        $display("|Op: %b", Op);
        $display(
            "|RegDst: %b | ALUSrc: %b | MemtoReg: %b | RegWrite: %b | MemRead: %b | MemWrite: %b | Branch: %b | ALUOp1: %b | ALUOp0: %b |",
            RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0
            );
        #5;
        Op = 6'b100011;
        #5;
        $display ("+-------------------------------------------------------");
        $display("|Op: %b", Op);
        $display(
            "|RegDst: %b | ALUSrc: %b | MemtoReg: %b | RegWrite: %b | MemRead: %b | MemWrite: %b | Branch: %b | ALUOp1: %b | ALUOp0: %b |",
            RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0
            );
        #5;
        Op = 6'b101011;
        #5;
        $display ("+-------------------------------------------------------");
        $display("|Op: %b", Op);
        $display(
            "|RegDst: %b | ALUSrc: %b | MemtoReg: %b | RegWrite: %b | MemRead: %b | MemWrite: %b | Branch: %b | ALUOp1: %b | ALUOp0: %b |",
            RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0
            );
        #5;
        Op = 6'b000100;
        #5;
        $display ("+-------------------------------------------------------");
        $display("|Op: %b", Op);
        $display(
            "|RegDst: %b | ALUSrc: %b | MemtoReg: %b | RegWrite: %b | MemRead: %b | MemWrite: %b | Branch: %b | ALUOp1: %b | ALUOp0: %b |",
            RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0
            );
        #5;
        $display ("+-------------------------------------------------------");
        $finish;
    end
endmodule