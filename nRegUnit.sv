module nRegUnit #(parameter int N=8) (in, out, en, clk, rst);

    input  logic         clk, rst, en;
    input  logic [N-1:0] in;
    output logic [N-1:0] out;

    logic [N-1:0] register;

    always_ff @( posedge clk or posedge rst ) begin
        if (rst)
            register <= 0;
        else
            register <= en ? in : register;
    end

    always_comb begin
        out = register;
    end
    
endmodule