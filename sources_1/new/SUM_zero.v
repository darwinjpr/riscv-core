`timescale 1ns / 1ps

module SUM_zero(
    input wire [31:0] OperandoA, OperandoB,

    output reg [31:0] SUMout,
    output reg Cero

    );
   always @(*) begin
    SUMout=OperandoA+OperandoB;
    
    if(SUMout==32'd0)
		  Cero = 1'b1;
		  
		else
		  Cero = 1'b0;
		  
		  end
endmodule
