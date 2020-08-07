`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Darwin, Paulo
// 
// Create Date: 11.03.2019 13:21:37
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: https://www.fpga4student.com/2017/06/Verilog-code-for-ALU.html
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU
           #(parameter N = 32, ALUFlagIn = 0)
           (input [N-1:0] ALUA,ALUB,  // entradas de N-1 bits              
           input  [1:0] ALUControl,// entrada de selccion 
           output [N-1:0] ALUResult, // Salida Resultado
           //output FlagAcarreo, // Bandera de acarreo
           //output reg FlagDesbordamiento,
           output reg FlagCero
           //output reg FlagNegativo
);

//nuevas variables de conexion
logic [N-1:0] ALU_Result; //utilizada como cable conectada a la salida
logic salida_carry;         //conecta al carry de la alu

//asignaciones de salidas de alu
assign ALUResult = ALU_Result; // asiganar los valores de ALU_Result a ALUOU

//respuesta a la suma y resta    
logic [N-1:0] ALU_SUMA, ALU_RESTA;
logic CarrySUMA, CarryRESTA;
//Declaración de módulos
CarryLookAheadSumador #(N) SUM( ALUA, ALUB, ALU_SUMA, CarrySUMA, ALUFlagIn);   
CarryLookAheadSumadorR #(N) SUM2( ALUA, ALUB, ALU_RESTA, CarryRESTA, ALUFlagIn);

//La funcion case se utiliza para seleccionar cual resultado se conecta a la salida de la ALU
//es decir, todas las funciones son llamadas, solo que al final del circuito se escoje cual es la salida
always @(*)
begin
if (ALU_Result=='0)FlagCero =1'b1;
else FlagCero =1'b0;

salida_carry = 0;

    case(ALUControl)
    2'b00: // suma
    begin
        ALU_Result = ALU_SUMA;
        salida_carry = CarrySUMA;

    end
    2'b01: // resta 
    begin
        ALU_Result = ALU_RESTA;
        salida_carry = CarryRESTA;

    end

      default: 
          begin
          ALU_Result = ALU_SUMA;
          salida_carry = CarrySUMA;
          
      end 
    endcase
end
endmodule
