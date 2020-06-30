`timescale 1ns / 1ps

module memoriainstrucciones#(             //-- Parametros
    parameter Ni = 34)( //Ni es el numero de instrucciones en el programa (archivo .mem)
    input [31:0] Din,
    output [31:0] Dout
    );
    //Se declara la memoria de instrucciones a utilizar, de 1 byte por linea, y 128 lineas
    reg	[7:0] Memory_Ins [127:0];
    //Auxiliar para redireccionar las intrucciones
    reg [31:0] memins [Ni:0];
    integer i;//auxiliar para el bucle
    initial begin
        $readmemh ("instrucciones.mem", memins); //carga la memoria de instrucciones del archivo .mem       
        for (i = 0; i <= Ni; i=i+1) begin // Ciclo for para inicializar cada espacio de memoria
        //
            Memory_Ins[4*i] = memins[i][7:0];
            Memory_Ins[4*i+1] = memins[i][15:8];
            Memory_Ins[4*i+2] = memins[i][23:16];
            Memory_Ins[4*i+3] = memins[i][31:24]; 
        end
    end
    //asignacion de salida
    assign Dout[7:0] =  Memory_Ins[Din];
    assign Dout[15:8] =  Memory_Ins[Din+1];
    assign Dout[23:16] =  Memory_Ins[Din+2];
    assign Dout[31:24] =  Memory_Ins[Din+3];
endmodule
