module reg_bank (DOA, DOB, DI, DIR_A, DIR_B, DIR_WR, clk, REG_WR);

input clk, REG_WR; // Señales de entrada de un bit
input [4:0] DIR_A, DIR_B, DIR_WR; // Registros fuente (rs1, rs2) y registro destino (rd)
input [31:0] DI; // Registro que se va a escribir
output [31:0] DOA,DOB; //Registros de salida 32 bits

//reg [31:0] regfile[0:31];
reg [31:0] regfile [31:0];
//inicializa banco de registros en cero
integer i;
initial begin 
    for (i = 0; i <= 31; i=i+1) begin // Ciclo for para inicializar cada espacio de memoria
        regfile[i] = 32'd1;
end end

assign DOA = regfile[DIR_A];
assign DOB = regfile[DIR_B];

always @(posedge clk)
    if(REG_WR == 1) begin
     regfile [DIR_WR] <= DI;
     end
endmodule
