`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2019 18:22:49
// Design Name: 
// Module Name: SumadorCompleto
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: http://www.nandland.com
// 
//////////////////////////////////////////////////////////////////////////////////


module SumadorCompleto(
  input logic bit1,
  input logic bit2,
  input wire CarryIn,
  output logic Suma,
  output wire CarryOut
   );

  wire   CompXor;
  wire   CompAnd1;
  wire   CompAnd2;
       
  assign CompXor = bit1 ^ bit2; //Xor
  assign CompAnd1 = CompXor & CarryIn; //And
  assign CompAnd2 = bit1 & bit2; //And
 
  assign Suma   = CompXor ^ CarryIn; //Suma
  assign CarryOut = CompAnd1 | CompAnd2; //Acarreo
 
endmodule 

