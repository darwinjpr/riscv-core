`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module riscv_core(
    input clk,
    input [31:0] otro, //direccion de pc para branch 
    input selmux0,// selector para mux0
    output [31:0] instruccion,
    output [31:0] pc_out
    );
    wire [31:0] sig_pc=4;
    wire [31:0] pc4=0;
    
endmodule
