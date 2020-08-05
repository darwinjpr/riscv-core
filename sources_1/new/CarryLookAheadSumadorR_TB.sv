`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2019 17:17:24
// Design Name: 
// Module Name: CarryLookAheadSumadorR_TB
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


module CarryLookAheadSumadorR_TB();
   parameter N = 4;
  logic [N-1:0] POperando1 = 0;
  logic [N-1:0] POperando2 = 0;
  logic [N-1:0]  PResultado;
  logic  PCarryOut;
  logic  PCarryIn = 0;
   
  CarryLookAheadSumadorR #(.N(N)) CarryP
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
      POperando1 = 4'b1111;
      POperando2 = 4'b1000;
      PCarryIn = 1'b0;
      #10;
      POperando1 = 4'b1000;
      POperando2 = 4'b1111;
      PCarryIn = 1'b0;
      #10;
      POperando1 = 4'b1111;
      POperando2 = 4'b1000;
      PCarryIn = 1'b1;
      #10;
      POperando1 = 4'b1000;
      POperando2 = 4'b1111;
      PCarryIn = 1'b1;
      #10;
    end
 
endmodule 
