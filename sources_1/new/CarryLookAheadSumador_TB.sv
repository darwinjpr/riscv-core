`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2019 17:09:12
// Design Name: 
// Module Name: CarryLookAheadSumador_TB
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


module CarryLookAheadSumador_TB();
   parameter N = 1;
  logic [N-1:0] POperando1 = 0;
  logic [N-1:0] POperando2 = 0;
  logic [N-1:0]  PResultado;
  logic  PCarryOut;
  logic  PCarryIn = 0;
   
  CarryLookAheadSumador #(.N(N)) CarryPrueba
    (
     .Operando1(POperando1),
     .Operando2(POperando2),
     .Resultado(PResultado),
     .CarryOut(PCarryOut),
     .CarryIn(PCarryIn)
     );
 
  initial
    begin
      #10;
      POperando1 = 1'b1;
      POperando2 = 1'b0;
      #10;
      POperando1 = 1'b1;
      POperando2 = 1'b0;
      PCarryIn = 1'b1;
      #10;
      POperando1 = 1'b1;
      POperando2 = 1'b1;
      #10;
      POperando1 = 1'b1;
      POperando2 = 1'b1;
      PCarryIn = 1'b1;
      #10;
    end
 
endmodule 
