`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.08.2020 19:25:17
// Design Name: 
// Module Name: prueba_i_suma
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module prueba_i_suma();
logic [31:0] i; //instrucción
logic [31:0] salida = 0;
logic clk = 1;
logic REG_WR = 0;
//i= 0000000 5'b2 5'b1 000 5'b3 0110011
//0000000 11100 11100 000 00110 01100 11
//intrucción: add
//opcode: 0110011
//funct3: 000 
//funct7: 0000000

//Al salir la intruccion de la memoria de instrucciones, entra a la etapa de ID
wire [6:0] opcode;
wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;
wire [2:0] funct3;
wire [6:0] funct7;
if_id_buffer ID(i,opcode,rs1,rs2,rd,funct3,funct7);

//banco de registros
logic [31:0] DOA;
logic [31:0] DOB;
logic [31:0] DI;
reg_bank b_registros(DOA, DOB, DI, rs1, rs2, rd, clk, REG_WR);

//ALU
wire cero;
SUM_zero ALU(DOA,DOB,DI,cero);


integer T2 = 10;

initial begin

i=32'b0000000_11100_11100_000_00110_0110011;
#11
REG_WR = 1;
#11
REG_WR = 0;
#11
i=32'b0000000_00110_11100_000_00110_0110011;
#11
REG_WR = 1;
#11
REG_WR = 0;
end

always begin
    #T2
    clk =  ! clk;
    salida = DI;
    end

endmodule
