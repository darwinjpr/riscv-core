module ALU (
    input [31:0] A, B,
    input s,
    output [31:0] F,
    output reg z
    );
//nuevas variables de conexion

//respuesta a la suma y resta    
wire [31:0] ALU_SUMA, ALU_RESTA;
wire CarrySUMA, CarryRESTA;
//Declaraci?n de m?dulos
CarryLookAheadSumador #(32) SUM( A, B, ALU_SUMA, CarrySUMA, 1'b0);   
CarryLookAheadSumadorR #(32) SUM2( A, B, ALU_RESTA, CarryRESTA, 1'b0);

//asignaciones de salidas de alu
assign F = s ? ALU_RESTA : ALU_SUMA; // asiganar los valores de ALU_Result a ALUOU

always @(*) begin

    if(F==32'd0)//esto calcula la bandera de zero
        z = 1'b1;
    else
        z = 1'b0;

end
  
endmodule