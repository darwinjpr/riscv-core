`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2020 03:24:10
// Design Name: 
// Module Name: prueba_fetch
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


module prueba_fetch( );

//PC
logic [31:0] PC_OutSum;
logic [31:0] PC;
logic clk = 0;
PC regPC(PC,PC_OutSum,clk);

//memoria de instrucciones
logic [31:0] i; //instrucción
memoriainstrucciones nextInst(.Din(PC),.Dout(i));

//sumador de PC
add4 addPC(PC,PC_OutSum);

initial begin
#10
clk =  ! clk;
#10
clk =  ! clk;
#10
clk =  ! clk;
#10
clk =  ! clk;
#10
clk =  ! clk;
#10
clk =  ! clk;
end


endmodule
