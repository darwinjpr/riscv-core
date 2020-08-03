`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module Fetch(
    input clk,
    input [31:0] otro, //direccion de pc para branch 
    input selmux0,// selector para mux0
    output [31:0] instruccion,
    output [31:0] pc_out
    );
    wire [31:0] sig_pc=4;
    wire [31:0] pc4=0;
    
    //mux_pc u1(.pc_4(pc4),.beq(beq),.jumpaddress(jumpaddress),.sel(sel),.seljump(seljump),.sig_pc(sig_pc));
    PC pc(.in(sig_pc),.clk(clk),.pc_out(pc_out));
    memoriainstrucciones nextInst(.Din(pc_out),.Dout(instruccion));
    add4 add4(pc_out,pc4);
    
    endmodule

