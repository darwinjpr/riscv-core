`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2020 15:08:25
// Design Name: 
// Module Name: test_memoriadatos
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


module test_memoriadatos( );

    
logic [31:0]Addr; // Direccion de memoria a la que se debe acceder para guardar un dato
logic [31:0]Write_Data; // Datos a guardar.
logic MemRead; // Señal para leer en memoria .
logic MemWrite; // Señal para escribir en memoria.
logic [2:0]funct3; //Señal que identifica el tipo de instrucción de memoria
logic clk; //señal de reloj del procesador


logic [31:0] MemOut;//Dato que escogido para ser guardado en registro

memoriadatos test_memoriadatos(
    Addr, // Direccion de memoria a la que se debe acceder para guardar un dato
    Write_Data, // Datos a guardar.
    MemRead, // Señal para leer en memoria .
    MemWrite, // Señal para escribir en memoria.
    funct3, //Señal que identifica el tipo de instrucción de memoria
    clk, //señal de reloj del procesador
    MemOut//Dato que escogido para ser guardado en registro
    );

// initialize test
initial
begin
clk = 1;

//escribe
MemRead = 0;
MemWrite = 1; # 2;

//escribe una palabra
Addr = 32'h000a0004;    //direccion donde va a guardar por primera vez
Write_Data = 32'h11111111;  //datos por guardar
funct3 = 3'b000; # 2;

//escribe media palabra
Addr = 32'h000a0008;    //direccion donde va a guardar por primera vez
Write_Data = 32'h22222222;  //datos por guardar
funct3 = 3'b001; # 2;

//escribe byte
Addr = 32'h000a000c;    //direccion donde va a guardar por primera vez
Write_Data = 32'h33333333;  //datos por guardar
funct3 = 3'b010; # 2;

//leer
Addr = 32'h00000000;
MemRead = 1;
MemWrite = 0;
Write_Data = 32'h10101010; # 2; //datos por guardar (diferente al que se va a leer)(no afecta aqui)

//lee una palabra
Addr = 32'h000a0004;    //direccion donde va a leer
funct3 = 3'b000; # 2;
//lee media palabra
funct3 = 3'b001; # 2;
//lee byte
funct3 = 3'b010; # 2;

/////////////////////////////////////////////////////////
//lee una palabra
Addr = 32'h000a0008;    //direccion donde va a leer
funct3 = 3'b000; # 2;
//lee media palabra
funct3 = 3'b001; # 2;
//lee byte
funct3 = 3'b010; # 2;

/////////////////////////////////////////////////////////
//lee una palabra
Addr = 32'h000a000c;    //direccion donde va a leer
funct3 = 3'b000; # 2;
//lee media palabra
funct3 = 3'b001; # 2;
//lee byte
funct3 = 3'b010; # 2;

/////////////////////////////////////////////////////////
//fin de prueba
MemRead = 1;
MemWrite = 0;
Addr = 0;    //direccion donde va a guardar por primera vez
Write_Data = 0;  //datos por guardar
funct3 = 3'b010; # 2;


end

always 
    #1 clk =  ! clk;

endmodule