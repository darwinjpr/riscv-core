`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module Fetch(
    input clk,
    input [31:0] otro, //direccion de pc para branch 
    input selmux0,// selector para mux0
    output reg [31:0] instruccion,
    output reg [31:0] pc4
    );
    
    wire [31:0] pc;
    wire [31:0] pc4aux;
    wire [31:0] instruccionaux;
    
    muxpc mux0(pc4aux,otro,selmux0,pc);
    add4 add(pc,pc4aux);
    memoriainstrucciones obtener_instruccion(pc,instruccionaux);
  
    always @(posedge clk) begin
        pc4 <= pc4aux;
        instruccion <= instruccionaux;
    end
				
endmodule
