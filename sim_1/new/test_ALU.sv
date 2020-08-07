`timescale 1ns / 1ps

module test_ALU();

logic [31:0]A,B,ALU_out;
logic control_ALU,cero;

ALU ALU(A,B,control_ALU,ALU_out,cero);

initial begin 

A=32'd4;
B=32'd4;
control_ALU=1'b0;
#1
A=32'd4;
B=32'd4;
control_ALU=1'b1;
end


endmodule
