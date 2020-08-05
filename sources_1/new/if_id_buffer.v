`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2020 19:24:02
// Design Name: 
// Module Name: if_id_buffer
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

//para tipo r unicamente
module if_id_buffer(
    input [31:0] instruccion,
    output [6:0] opcode,
    output [4:0] rs1,
    output [4:0] rs2,
    output [4:0] rd,
    output [2:0] funct3,
    output [6:0] funct7,
    output [11:0] imm
    );
    
    assign opcode = instruccion [6:0];
    assign rs1 = instruccion [19:15];
    
    assign imm = instruccion[5] ? 12'bx : instruccion [31:20];//cuando bit 5 es 0
    assign rs2 = instruccion[5] ? instruccion [24:20] : 5'bx;//cuando bit 5 es 1
    assign funct7 = instruccion[5] ? instruccion [31:25] : 7'bx;//cuando bit 5 es 1
    //assign <output> = <1-bit_select> ? <input1> : <input0>;
    //assign imm = instruccion [31:20];
    
    //assign rs2 = instruccion [24:20];
    //assign funct7 = instruccion [31:25];
    
    assign rd = instruccion [11:7];
    assign funct3 = instruccion [14:12];

    
endmodule
