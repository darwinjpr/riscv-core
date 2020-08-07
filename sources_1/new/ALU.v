module ALU (s, A, B, F, z);

input s,z;
input [31:0] A, B;

output reg [31:0] F;


always @(s or A or B) begin
    
    case (s)

    0: F = A + B
    1: F = A - B

endcase

  if(F==32'd0)//esto calcula la bandera de zero
		  z = 1'b1;
		  
		else
		  z = 1'b0;
		  

end
  
endmodule