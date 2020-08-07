`timescale 1ns / 1ps

module UnidadControl(
    input wire [6:0] opcode,
    input wire funct7_5,
    input clk,cero,
    output reg [1:0]control_ALU,
    output  S_Mux_A,
    output reg [1:0] S_Mux_B, S_Mux_C,//señales de control de los muxes
    output reg REG_RD, REG_WR, MEM_RD, MEM_WR
    );
    //wire [6:0] opcode=Instruccion[6:0];
    
    assign S_Mux_A = cero ? 1'b0 : (opcode[6]?(opcode[5]?(opcode[4]?(1'b0):(opcode[3]?(1'b0):(opcode[2]?(1'b0):(opcode[1]?(opcode[0]?(1'b1):(1'b0)):(1'b0))))):(1'b0)):1'b0) ;
    
    always @(*) begin
    
    case(opcode)
        7'b1100011: begin//branch
//        if (cero == 1'b1)S_Mux_A=1'b1;
//        else S_Mux_A=1'b0;
        S_Mux_B=2'b11;
        S_Mux_C=2'b11;
        REG_RD=1'b0;
        REG_WR= 1'b0;
        MEM_RD=1'b0;
        MEM_WR=1'b0; 
        control_ALU=2'b01;
        end
        
        7'b0110111: begin//lui
//        S_Mux_A=1'b0;
        S_Mux_B=2'b11;
        S_Mux_C=2'b00;
        REG_RD=1'b0;
        REG_WR= 1'b1;
        MEM_RD=1'b0;
        MEM_WR=1'b0;
        control_ALU=2'bxx;
        end
        
        7'b0110011: begin//add
//        S_Mux_A=1'b0;
        S_Mux_B=2'b00;
        S_Mux_C=2'b01;
        REG_RD=1'b1;
        REG_WR= 1'b1;
        MEM_RD=1'b0;
        MEM_WR=1'b0;
        if (funct7_5 == 1'b1)control_ALU=2'b01;
        else control_ALU=2'b00;
        end
        
        7'b0010011:begin//addi
//        S_Mux_A=1'b0;
        S_Mux_B=2'b01;
        S_Mux_C=2'b01;
        REG_RD=1'b1;
        REG_WR= 1'b1;
        MEM_RD=1'b0;
        MEM_WR=1'b0; 
        control_ALU=2'b00;
        end
        
        
        7'b0100011:begin//store
//        S_Mux_A=1'b0;
        S_Mux_B=2'b10;
        S_Mux_C=2'b11;
        REG_RD=1'b1;
        REG_WR= 1'b0;
        MEM_RD=1'b0;
        MEM_WR=1'b1;
        control_ALU=2'b00;
        end
        
        
        7'b0000011:begin//load
//        S_Mux_A=1'b0;
        S_Mux_B=2'b01;
        S_Mux_C=2'b10;
        REG_RD=1'b1;
        REG_WR= 1'b1;
        MEM_RD=1'b1;
        MEM_WR=1'b0; 
        control_ALU=2'b00;
        end
     
     
      endcase
        
        
    end
    
endmodule