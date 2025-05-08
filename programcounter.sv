module programcounter #(parameter int N = 32) (
    input logic [N-1:0] addr_in,
    input logic clk,
    input logic rst,
    output logic [N-1:0] addr_out
    );

    always_ff @( posedge clk or posedge rst ) begin
        if (rst)
            addr_out <= 0;
        else begin
            addr_out <= addr_in;
        end      
    end

endmodule