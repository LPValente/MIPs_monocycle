module instructions #(parameter N = 12);
    logic[N-1:0][7:0] CONST;

    always_comb begin
        CONST[0 +: 4] = 32'h80010028;
        CONST[4 +: 4] = 32'h80020014;
        CONST[8 +: 4] = 32'h80030023;
        CONST[12 +: 4] = 32'h80040038;
        CONST[16 +: 4] = 32'h80050004;
        CONST[20 +: 4] = 32'h80060005;
        CONST[24 +: 4] = 32'hAC020002;
        CONST[28 +: 4] = 32'h8C140002;
        CONST[32 +: 4] = 32'h0022D020;
        CONST[36 +: 4] = 32'h0023B022;
        CONST[40 +: 4] = 32'h0356B020;
        CONST[44 +: 4] = 32'h1282FFFD;
    end
endmodule
