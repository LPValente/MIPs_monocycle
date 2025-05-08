module sign_extend_tb;

    logic [15:0] in;
    logic [31:0] out;

    sign_extend st (in, out);

    initial begin
        in = 16'b1000_0000_0000_0000;
        #5;
        $display("________________%b", in);
        $display("%b", out);
        #5;
        in = 16'b0000_0000_0000_0000;
        #5;
        $display("________________%b", in);
        $display("%b", out);
        $finish;
    end
    
endmodule