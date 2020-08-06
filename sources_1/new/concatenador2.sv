`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2020 13:16:07
// Design Name: 
// Module Name: concatenador2
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


module concatenador2(
    input [6:0]imm12105,
    input [4:0]imm4111,
    output [31:0]i_branch
    );
    
    wire[31:0]aux;
    s_ext Ext_Signo({imm12105[6],imm4111[0],imm12105[5:0],imm4111[4:1]},aux);
    
    assign i_branch = aux<<1;
    
endmodule
