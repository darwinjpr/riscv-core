`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2019 17:58:44
// Design Name: 
// Module Name: RestadorCompleto
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


module RestadorCompleto(
input logic bit1,
  input logic bit2,
  input wire CarryIn,
  output logic Resta,
  output wire CarryOut
   );

  wire   CompXor;
  wire   CompAnd1;
  wire   CompAnd2;
       
  assign CompXor = bit1 ^ bit2; //Xor
  assign CompAnd1 = ~(CompXor) & CarryIn; //And
  assign CompAnd2 = ~(bit1) & bit2; //And
 
  assign Resta  = CompXor ^ CarryIn; //resta
  assign CarryOut = CompAnd1 | CompAnd2; //Acarreo
 
endmodule 
