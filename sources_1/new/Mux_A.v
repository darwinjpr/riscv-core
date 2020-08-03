`timescale 1ns / 1ps

module Mux_A(
    input wire [31:0] Instruccion,//isntrucccion que se está ejecutando,
    input wire Cero,//bandera de cero
    
    output reg [31:0] Y//salida del mux
    );
    wire [6:0] OPCODE =Instruccion[6:0];
    reg [31:0] buffer;//esto es solo para no hacer una operacion del tipo Y=Y+X
    
    
    always @(*) begin
    if (Cero==1'b0 && OPCODE==7'b1100011) begin //si la bandera de ceroestá apagada y el OPCODE es de un branch hace el salto y por tanto la salida es el offset
    buffer={Instruccion[31], Instruccion[7], Instruccion[30:25], Instruccion[8:11]} ;//armo el offset y le extiendo signo
    Y= buffer<<1;//le hago corrimiento a la izquierda de un bit
    end
    else begin
    Y=31'b100;//en caso contrario la salida es 4 para que siga con la siguiente instrucción consecutiva
    end
    end


endmodule
