module ALU (
    input [31:0] A, B,
    input s,
    output reg [31:0] F,
    output reg z
    );

always @(*) begin
    
    case (s)

    1'b0: F = A + B;
    1'b1: F = A - B;

    endcase

    if(F==32'd0)//esto calcula la bandera de zero
        z = 1'b1;
    
    else
        z = 1'b0;
		  

end
  
endmodule