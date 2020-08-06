`timescale 1ns / 1ps

module Mux_C(
       input [31:0] Instruccion,resultado,datoMem,
       input [1:0] Senal,
       
       output reg[31:0] Salida
    
    );
    
    //assign Salida = Senal[1] ? (Senal[0] ? 32'bz : datoMem) : (Senal[0] ? resultado : {Instruccion[31:12],{12{1'b0}}});
    
    always @(*) begin
    case(Senal)
        
        2'b00: begin//salida del mux para un lui, es un immediato concatenado con ceros
        Salida={Instruccion[31:12],{12{1'b0}}};
        end
    
        2'b01: begin//salida para cuando elige el resultado del Sumador
        Salida=resultado;
        end
        
        2'b10: begin//salida cuando elige el dato que viene de Memoria
        Salida=datoMem;
        end
        
        2'b11:begin//salida en alta impedancia cuando la instruccion no utiliza ese mux
        Salida=32'bz;
        end
        
        
    endcase
    end
endmodule
