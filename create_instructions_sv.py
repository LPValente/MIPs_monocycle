def create_sv (input_file = "programdata.txt", output_file = "instructions.sv", header=True):

    with open(input_file, 'r') as f:
        lines = f.readlines()

    with open(output_file, 'w') as f:
        
        if header:
            h = 1
        else:
            h = 0
        
        f.write(f"module {output_file[:-3]} #(parameter N = {(len(lines)-1)*4});\n")
        f.write(f"    logic[N-1:0][7:0] CONST;\n\n")
        f.write("    always_comb begin\n")
            
        for index, line in enumerate(lines[h:],start=h):
            row = "".join(line.strip().split(" "))
            vector = row #bin_string(row)
            
            f.write("        CONST["+str((index-1)*4)+" +: 4] = 32'h" + f"{vector[0:8]}"+f";\n")

        f.write("    end\n")
        f.write("endmodule\n")
        
create_sv(input_file = "programdata.txt", output_file = "instructions.sv", header=True)