`timescale 1ns / 1ps
//sumador para pc
module add4(
    input [31:0]pc,
    input [31:0]otro,
    output [31:0]pc4
    );
    
    assign pc4 = pc + otro;
endmodule
