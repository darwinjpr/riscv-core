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
//assign FlagAcarreo = salida_carry;

//respuesta al shift izq y derecha
//wire [N-1:0] r_shift_left, r_shift_right;  //variables auxiliares para shift left y right
//wire r_a_shift_left, r_a_shift_right;
//declaracion de modulos
//deco_shift_left SHIFT_LEFT(ALUA, ALUB, ALUFlagIn, r_shift_left, r_a_shift_left);    //shift left
//deco_shift_right SHIFT_RIGHT(ALUA, ALUB, ALUFlagIn, r_shift_right, r_a_shift_right); //shift right

//respuesta a la suma y resta    
logic [N-1:0] ALU_SUMA, ALU_RESTA;
logic CarrySUMA, CarryRESTA;
//Declaración de módulos
CarryLookAheadSumador #(N) SUM( ALUA, ALUB, ALU_SUMA, CarrySUMA, ALUFlagIn);   
CarryLookAheadSumadorR #(N) SUM2( ALUA, ALUB, ALU_RESTA, CarryRESTA, ALUFlagIn);

//respuesta al incremento y decremento en 1 y variables locales de entrada   
//logic [N-1:0] ALU_incremento, ALU_decremento, AA, BB;
//logic Carry_incremento, Carry_decremento;
//Declaración de módulos
//CarryLookAheadSumador #(N) INCREMENTO( AA, BB, ALU_incremento, Carry_incremento, 0);   
//CarryLookAheadSumadorR #(N) DECREMENTO( AA, BB, ALU_decremento, Carry_decremento, 0);

//La funcion case se utiliza para seleccionar cual resultado se conecta a la salida de la ALU
//es decir, todas las funciones son llamadas, solo que al final del circuito se escoje cual es la salida
always @(*)
begin
//FlagDesbordamiento = 0;
//FlagNegativo = 0;
FlagCero = 0;
salida_carry = 0;
/*
    if(ALUFlagIn == 0)
        begin
            AA = ALUA;
            BB = 1;
        end
    else
        begin
            AA = ALUB;
            BB = 1;
        end
        */
    case(ALUControl)
    2'b00: // suma
    begin
        ALU_Result = ALU_SUMA;
        salida_carry = CarrySUMA;
        FlagCero = (ALU_Result == '0);
        //overflow
        /*if (ALUA[N-1] == ALUB[N-1])
          begin
             if(ALUA[N-1] != ALU_Result[N-1])
               FlagDesbordamiento = 1; 
             else
               FlagDesbordamiento = 0;
          end
        else 
        FlagDesbordamiento = 0;
        //bandera negativo
        FlagNegativo = (ALU_Result[N-1] == 1);*/
    end
    2'b01: // resta 
    begin
        ALU_Result = ALU_RESTA;
        salida_carry = CarryRESTA;
        FlagCero = (ALU_Result == '0);
        //overflow
        /*if (ALUA[N-1] != ALUB[N-1])
          begin
             if(ALUA[N-1] != ALU_Result[N-1])
               FlagDesbordamiento = 1; 
             else
               FlagDesbordamiento = 0;
          end
        else 
        FlagDesbordamiento = 0;
        //bandera negativo
        FlagNegativo = (ALU_Result[N-1] == 1);*/
    end
    /*
    4'b0010: //  incrementa1 --- suma1
        begin
            ALU_Result = ALU_incremento;
            salida_carry = Carry_incremento;
            FlagCero = (ALU_Result == '0);
        end
    4'b0011: //  decrementa1 --- resta1
        begin
            ALU_Result = ALU_decremento;
            salida_carry = Carry_decremento;
            FlagCero = (ALU_Result == '0);
        end
    4'b0100: // Corrimiento Izquierda
        if (ALUB == N)
            begin
                ALU_Result = {(N){ALUFlagIn}};
                salida_carry = ALUA[0];
                FlagCero = (ALU_Result == '0);
            end
        else 
            begin
            if (ALUB > N)
                begin
                    ALU_Result = {(N){ALUFlagIn}};
                    salida_carry = ALUFlagIn;
                    FlagCero = (ALU_Result == '0);
                end
            else
                begin
                    ALU_Result = r_shift_left;
                    salida_carry = r_a_shift_left;
                    FlagCero = (ALU_Result == '0);
                end
            end
    4'b0101: // Corrimiento Derecha
        if (ALUB == N)
            begin
                ALU_Result = {(N){ALUFlagIn}};
                salida_carry = ALUA[N-1];
                FlagCero = (ALU_Result == '0);
            end
        else
            begin
            if (ALUB > N)
                begin
                    ALU_Result = {(N){ALUFlagIn}};
                    salida_carry = ALUFlagIn;
                    FlagCero = (ALU_Result == '0);
                end
            else
                begin
                    ALU_Result = r_shift_right;
                    salida_carry = r_a_shift_right;
                    FlagCero = (ALU_Result == '0);
                end
            end
    4'b0110: //  negación a o b
        if (ALUFlagIn == 0)
            begin
                ALU_Result = ~ ALUA;
                FlagCero = (ALU_Result == '0);
            end
        else
            begin
                ALU_Result = ~ ALUB;
                FlagCero = (ALU_Result == '0);
            end
    4'b0111: //  Logical and 
    begin
        ALU_Result = ALUA & ALUB;
        FlagCero = (ALU_Result == '0);
        FlagNegativo = (ALU_Result[N-1] == 1);
     end
    4'b1000: //  Logical or
    begin
        ALU_Result = ALUA | ALUB;
        FlagCero = (ALU_Result == '0);
        FlagNegativo = (ALU_Result[N-1] == 1);
    end
    4'b1001: //  Logical xor  
    begin
        ALU_Result = ALUA ^ ALUB;
        FlagCero = (ALU_Result == '0);
        FlagNegativo = (ALU_Result[N-1] == 1);
    end
    */
      default: 
          begin
          ALU_Result = ALU_SUMA;
          salida_carry = CarrySUMA;
          FlagCero = (ALU_Result == '0);
          //overflow
          /*if (ALUA[N-1] == ALUB[N-1])
            begin
               if(ALUA[N-1] != ALU_Result[N-1])
                 FlagDesbordamiento = 1; 
               else
                 FlagDesbordamiento = 0;
            end
          else 
          FlagDesbordamiento = 0;
          //bandera negativo
          FlagNegativo = (ALU_Result[N-1] == 1);*/
      end 
    endcase
end
endmodule
