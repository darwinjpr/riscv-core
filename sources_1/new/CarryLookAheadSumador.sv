`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2019 18:32:29
// Design Name: 
// Module Name: CarryLookAheadSumador
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


module CarryLookAheadSumador
  #(parameter N = 3)
  (
   input logic [N-1:0] Operando1,
   input logic [N-1:0] Operando2,
   output logic [N-1:0]  Resultado,
   output logic CarryOut,
   input logic CarryIn
   
   );
     //Creando generadores y  propagadores de carry 
  wire [N:0]     w_C;
  wire [N-1:0]   w_G, w_P, w_SUM;
 
  
  genvar             ii; //variable que cambia en tiempos de ejecucion
  generate
    for (ii=0; ii<N; ii=ii+1) 
      begin
        SumadorCompleto FullAdder
            ( 
              .bit1(Operando1[ii]),
              .bit2(Operando2[ii]),
              .CarryIn(w_C[ii]),
              .Suma(w_SUM[ii]),
              .CarryOut()
              );
      end
  endgenerate
 
  genvar             jj;
  generate
    for (jj=0; jj<N; jj=jj+1) 
      begin
       // Creando terminos de generacion
        assign w_G[jj]   = Operando1[jj] & Operando2[jj];
        // Creando terminos de propagacion
        assign w_P[jj]   = Operando1[jj] | Operando2[jj];
        // Creando terminos de Carry
        assign w_C[jj+1] = w_G[jj] | (w_P[jj] & w_C[jj]);
      end
  endgenerate
   
  assign w_C[0] = CarryIn ; 
 
  assign Resultado = w_SUM; 
  assign CarryOut= w_C[N];  
 
endmodule 
