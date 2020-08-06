`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2020 19:44:46
// Design Name: 
// Module Name: concatenador
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


module concatenador(
    input [11:0]imm7b,
    input [4:0]imm5b,
    output [31:0]salida
    );

wire [31:0]sal;
s_ext Ext_Signo({imm7b, imm5b},sal);
assign salida = sal;

endmodule
