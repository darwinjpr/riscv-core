`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2020 11:47:53
// Design Name: 
// Module Name: prueba4_alu
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


module prueba4_alu();
//PC
logic [31:0] PC_OutSum;
logic [31:0] PC;
logic clk = 0;
PC regPC(PC,PC_OutSum,clk);

//memoria de instrucciones
logic [31:0] i; //instrucción
memoriainstrucciones nextInst(.Din(PC),.Dout(i));

//sumador de PC
add4 addPC(PC,PC_OutSum);


logic [31:0] salida = 0;
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
wire [11:0] imm;
if_id_buffer ID(i,opcode,rs1,rs2,rd,funct3,funct7,imm);

//banco de registros
wire [31:0] DOA;
wire [31:0] DOB;
wire [31:0] DI;
reg_bank b_registros(DOA, DOB, DI, rs1, rs2, rd, clk, REG_WR);

//extension de signo
wire [31:0]imm_ex;
s_ext Ext_Signo(imm,imm_ex);

//mux escoge ente imm y rs2
wire [31:0]B;
Mux_B muxB(i[5],DOB,imm_ex,B);

//ALU
wire cero;

ALU ALU(DOA,B,funct7[6:5],DI,cero);

initial begin
#10
clk =  ! clk;
#10
clk =  ! clk;
#10
clk =  ! clk;
#10
clk =  ! clk;
#10
clk =  ! clk;
#10
clk =  ! clk;
#10
clk =  ! clk;
#10
clk =  ! clk;
#10
clk =  ! clk;
#10
clk =  ! clk;
#10
clk =  ! clk;
#10
clk =  ! clk;
#10
clk =  ! clk;
#10
clk =  ! clk;
#10
clk =  ! clk;
#10
clk =  ! clk;
#10
clk =  ! clk;
#10
clk =  ! clk;
#10
clk =  ! clk;
#10
clk =  ! clk;
end
always begin
#10
REG_WR = !clk;
end
endmodule
