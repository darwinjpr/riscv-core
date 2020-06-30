`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2020 00:41:46
// Design Name: 
// Module Name: test_memoriainstrucciones
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


module test_memoriainstrucciones();

logic [31:0] Din; //direccion de entrada
logic [31:0] Dout; //dato de salida

integer Ni = 34; //numero de instrucciones en el programa

//Inst_Memory test_memoriainstrucciones(Din,Dout);
memoriainstrucciones test_memoriainstrucciones(Din,Dout);

initial
begin
    //for (int i = 0; i < Ni; i++) begin
    for (int i = 0; i < Ni*4; i=i+4) begin
    Din = i; #2;
    end
    
end

endmodule
