`timescale 1ns / 1ps

/*
module Mux_B(
    input sel,
    input [31:0]rs2,
    input [31:0]imm_ex,
    output [31:0] B
    );
    
assign B = sel ? rs2 : imm_ex;
endmodule */

module Mux_B(
    input wire [1:0] Senal,
    input wire [31:0] imm,imm_sw,resultado,
    
    output reg [31:0] Salida
    
    );
    
    always @(*) begin
    
    case(Senal)
        2'b00:begin//primera salida es el resultado del sumador  para add y sub
        Salida=resultado;
        end
        
        2'b01:begin//si la señal da un 01 la salida es un inmediato para addi y lw
        Salida=imm;
        end
        
        
        2'b10: begin//salida para cuando es un immediato de un store
        Salida=imm_sw;
        end
        
        2'b11:begin// salida para instrucciones que no ocupan el mux
       Salida=32'bz ;
        end
        
    endcase
    end
endmodule 