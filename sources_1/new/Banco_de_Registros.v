module reg_bank (DOA, DOB, DI, DIR_A, DIR_B, DIR_WR, clk, REG_WR);

input clk, REG_WR; // Señales de entrada de un bit
input [4:0] DIR_A, DIR_B, DIR_WR; // Registros fuente (rs1, rs2) y registro destino (rd)
input [31:0] DI; // Registro que se va a escribir
output [31:0] DOA,DOB; //Registros de salida 32 bits

reg [31:0] regfile[0:31];


assign DOA = regfile[DIR_A];
assign DOB = regfile[DIR_B];

always @(posedge clk)
    if(REG_WR) regfile [DIR_WR] <= DI;
endmodule
