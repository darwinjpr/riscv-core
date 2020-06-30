`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module riscv_core(
    input clk
    );
    
    //nube de control
    
    //fetch del procesador
    wire [31:0]otro;
    wire selmux0;
    wire instruccion;
    wire pc4;
    Fetch seccion1(clk,otro,selmux0,instruccion,pc4);
    
    //decode del procesador
endmodule
