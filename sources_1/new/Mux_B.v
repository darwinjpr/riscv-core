`timescale 1ns / 1ps

module Mux_B(
    input wire [31:0] Instruccion,resultado,
    input wire [1:0] Senal,
  
    
    output reg [31:0] Salida
    
    );
    
    always @(*) begin
    
    case(Senal)
        2'b00:begin//primera salida es el resultado del sumador  para add y sub
        Salida=resultado;
        end
        
        2'b01:begin//si la señal da un 01 la salida es un inmediato para addi y lw
        Salida={{20{Instruccion[31]}},Instruccion[31:20]};
        end
        
        
        2'b10: begin//salida para cuando es un immediato de un store
        Salida={{20{Instruccion[31]}},Instruccion[31:25],Instruccion[11:7]};
        end
        
        2'b11:begin// salida para instrucciones que no ocupan el mux
       Salida=1'bz ;
        end
        
    endcase
    end
endmodule
