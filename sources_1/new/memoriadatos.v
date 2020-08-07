`timescale 1ns / 1ps

//Memoria de 128 bytes

module memoriadatos(
    
    input [31:0]Addr, // Direccion de memoria a la que se debe acceder para guardar un dato
    input [31:0]Write_Data, // Datos a guardar.
    input MemRead, // Señal para leer en memoria .
    input MemWrite, // Señal para escribir en memoria.
    input [2:0]funct3, //Señal que identifica el tipo de instrucción de memoria
    input clk, //señal de reloj del procesador

    output reg[31:0] MemOut//Dato que escogido para ser guardado en registro
    );
    
    //Se declaran las 4 celdas de memoria.
    reg	[7:0] Memory_Cell_0	[511:0];
    reg	[7:0] Memory_Cell_1	[511:0];
    reg	[7:0] Memory_Cell_2	[511:0];
    reg	[7:0] Memory_Cell_3	[511:0];
    
    //Se inicializa la memoria y se declara todo en 0
    integer i;
    initial begin
       for (i = 0; i <= 512; i=i+1) begin // Ciclo for para inicializar cada espacio de memoria 2kB
            Memory_Cell_0[i] = 8'd0;
            Memory_Cell_1[i] = 8'd0;
            Memory_Cell_2[i] = 8'd0;
            Memory_Cell_3[i] = 8'd0;
       end
    end
    
    //Siempre que esté en el ciclo negativo de reloj, se evalúa si el módulo de memoria esta habilitado y si la señal de escritura tambien está habilitado, en ese caso
    //quiere decir que se desea realizar un store (escritura)a la memoria de datos. Luego se evalua si es un store byte, halfbyte o word y se realizan las asignaciones 
    //pertinentes según sea el caso
    
    always @(~clk)begin
    if(MemWrite)
        case(funct3)
            3'b000: 
            begin
                Memory_Cell_0[Addr] = Write_Data[7:0]; //store byte: Solo se escribe sobre la celda 0 de memoria (los 8 LSB del dato total)
                Memory_Cell_1[Addr] = 8'b00000000;
                Memory_Cell_2[Addr] = 8'b00000000;
                Memory_Cell_3[Addr] = 8'b00000000;            
            end
            
            3'b001:
            begin
                Memory_Cell_0[Addr] = Write_Data[7:0]; //store Halfbyte: Solo escribe sobre la celda 1 y 0 de memoria 
                Memory_Cell_1[Addr] = Write_Data[15:8];
                Memory_Cell_2[Addr] = 8'b00000000;
                Memory_Cell_3[Addr] = 8'b00000000;             
            end
               
            3'b010:
            begin
                Memory_Cell_0[Addr] = Write_Data[7:0]; // Store word: Escribe sobre las cuatro celdas (32bits)
                Memory_Cell_1[Addr] = Write_Data[15:8];
                Memory_Cell_2[Addr] = Write_Data[23:16];
                Memory_Cell_3[Addr] = Write_Data[31:24];
            end
        endcase
        
       if(MemRead) // para leer de memoria
        case(funct3) //load byte: Solo lee una celda
            3'b000: 
            begin
                MemOut[7:0] = Memory_Cell_0[Addr];
                MemOut[15:8] = 8'b00000000;
                MemOut[23:16] = 8'b00000000; 
                MemOut[31:24] = 8'b00000000;
            end
                 
   
            3'b001: //load halfbyte: lee 2 celdas 
            begin
                MemOut[7:0] = Memory_Cell_0[Addr]; 
                MemOut[15:8] = Memory_Cell_1[Addr];
                MemOut[23:16] = 8'b00000000; 
                MemOut[31:24] = 8'b00000000;                
            end
               
            3'b010: //load word, lee las 4 celdas
            begin
                MemOut[7:0] = Memory_Cell_0[Addr]; 
                MemOut[15:8] = Memory_Cell_1[Addr];
                MemOut[23:16] = Memory_Cell_2[Addr]; 
                MemOut[31:24] = Memory_Cell_3[Addr];
            end
       // Pasar Direccion
       
        endcase
       else MemOut = 32'bx; 
    end

    
endmodule
