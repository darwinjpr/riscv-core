`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.08.2020 20:34:12
// Design Name: 
// Module Name: id_test
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


module id_test();

    logic [31:0] instruccion;
    logic [6:0] opcode;
    logic [4:0] rs1;
    logic [4:0] rs2;
    logic [4:0] rd;
    logic [2:0] funct3;
    logic [6:0] funct7;
    
if_id_buffer id(instruccion,opcode,rs1,rs2,rd,funct3,funct7);

initial begin

instruccion = 32'b00000001110011100000001100110011;


end

endmodule
