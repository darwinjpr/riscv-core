`timescale 1ns / 1ps

module UnidadControl(
    input wire [6:0] opcode,
    input clk,
    output reg [1:0] S_Mux_B, S_Mux_C,//señales de control de los muxes
    output reg REG_RD, REG_WR, MEM_RD, MEM_WR
    );
    //wire [6:0] opcode=Instruccion[6:0];
    
    always @(*) begin
    
    case(opcode)
        7'b1100011: begin//branch
        S_Mux_B=2'b11;
        S_Mux_C=2'b11;
        REG_RD=1'b0;
        REG_WR= 1'b0;
        MEM_RD=1'b0;
        MEM_WR=1'b0; 
        end
        
        7'b0110111: begin//lui
        S_Mux_B=2'b11;
        S_Mux_C=2'b00;
        REG_RD=1'b0;
        REG_WR= 1'b1;
        MEM_RD=1'b0;
        MEM_WR=1'b0; 
        end
        
        7'b0110011: begin//add
        S_Mux_B=2'b00;
        S_Mux_C=2'b01;
        REG_RD=1'b1;
        REG_WR= 1'b1;
        MEM_RD=1'b0;
        MEM_WR=1'b0; 
        end
        
        7'b0010011:begin//addi
        S_Mux_B=2'b01;
        S_Mux_C=2'b01;
        REG_RD=1'b1;
        REG_WR= 1'b1;
        MEM_RD=1'b0;
        MEM_WR=1'b0; 
        end
        
        
        7'b0100011:begin//store
        S_Mux_B=2'b10;
        S_Mux_C=2'b11;
        REG_RD=1'b1;
        REG_WR= 1'b0;
        MEM_RD=1'b0;
        MEM_WR=1'b1;
        end
        
        
        7'b0000011:begin//load
        S_Mux_B=2'b01;
        S_Mux_C=2'b10;
        REG_RD=1'b1;
        REG_WR= 1'b1;
        MEM_RD=1'b1;
        MEM_WR=1'b0; 
        end
     
     
      endcase
        
        
    end
    
endmodule