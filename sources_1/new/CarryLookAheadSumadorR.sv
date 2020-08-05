`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2019 17:14:15
// Design Name: 
// Module Name: CarryLookAheadSumadorR
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


module CarryLookAheadSumadorR
  #(parameter N = 3)
  (
   input logic [N-1:0] Operando1,
   input logic [N-1:0] Operando2,
   output logic [N-1:0]  Resultado,
   output logic CarryOut,
   input logic CarryIn
   
   );
   
  wire [N:0]     w_C;
  wire [N:0]     w_C0;
  wire [N-1:0]   w_RES;
  
  genvar             ii; //variable que cambia en tiempos de ejecucion
  generate
    for (ii=0; ii<N; ii=ii+1) 
      begin
        RestadorCompleto Resta
            ( 
              .bit1(Operando1[ii]),
              .bit2(Operando2[ii]),
              .CarryIn(w_C[ii]),
              .Resta(w_RES[ii]),
              .CarryOut(w_C0[ii])
              );
      end
  endgenerate
 
  genvar             jj;
  generate
    for (jj=1; jj<N+1; jj=jj+1) 
      begin
      //carry del restador
        assign w_C[jj] = w_C0[jj-1];
      end
  endgenerate
   
  assign w_C[0] = CarryIn; 
 
  assign Resultado = w_RES; 
  assign CarryOut= w_C[N];  
 
endmodule 
