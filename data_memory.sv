module data_memory #(parameter N=32, M=32) (clk, rst, MemW, MemR, address, Wdata, Rdata);

    input logic clk, rst, MemW, MemR;
    input logic [M-1:0] address;
    input logic [N-1:0] Wdata;
    output logic [N-1:0] Rdata;

    logic [(2**(M/2))-1:0][N-1:0] data ;
    
    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            data <= 0;
        end
        else begin
            if(MemW && ~MemR)
                data[address] <= Wdata;
            else if(~MemW && MemR)
                data <= data;
        end
    end

    always_comb
        Rdata = data[address];

endmodule