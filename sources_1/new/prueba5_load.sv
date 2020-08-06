`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2020 14:24:16
// Design Name: 
// Module Name: prueba5_load
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


module prueba5_load( );

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

// etapa de ID
wire [6:0] opcode;
wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;
wire [2:0] funct3;
wire [6:0] funct7;
wire [11:0] imm;
wire [6:0] imm11_5;
wire [4:0] imm4_0;
if_id_buffer ID(i,opcode,rs1,rs2,rd,funct3,funct7,imm,imm11_5,imm4_0);

//Unidad de control
wire [1:0] S_Mux_B, S_Mux_C;
wire REG_RD, REG_WR, MEM_RD, MEM_WR;
UnidadControl control(opcode,clk,S_Mux_B, S_Mux_C,REG_RD, REG_WR, MEM_RD, MEM_WR);

//banco de registros
wire [31:0] DOA;
wire [31:0] DOB;
wire [31:0] DI;
reg_bank b_registros(DOA, DOB, DI, rs1, rs2, rd, clk, REG_WR);

//extension de signo
wire [31:0]imm_ex;
s_ext Ext_Signo(imm,imm_ex);

//concatena y extiende para sw
wire [31:0]imm_sw;
concatenador concatenador(imm11_5,imm4_0,imm_sw);

//mux escoge ente imm y rs2
wire [31:0]B;
Mux_B muxB(S_Mux_B,imm_ex,imm_sw,DOB,B);

//ALU
wire [31:0] ALU_out;
wire cero;
ALU ALU(DOA,B,funct7[6:5],ALU_out,cero);

//Memoria de datos
wire [31:0]MemOut;
memoriadatos memDATOS(ALU_out,DOB,MEM_RD,MEM_WR,funct3,clk,MemOut);

//mux C
Mux_C muxC(i,ALU_out,MemOut,S_Mux_C,DI);
 
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
endmodule