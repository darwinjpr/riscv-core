`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2020 19:24:02
// Design Name: 
// Module Name: if_id_buffer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//para tipo r unicamente
module if_id_buffer(
    input [31:0] instruccion,
    output [6:0] opcode,
    output [4:0] rs1,
    output [4:0] rs2,
    output [4:0] rd,
    output [2:0] funct3,
    output [6:0] funct7,
    output [11:0] imm12,
    output [6:0] imm11_5,
    output [4:0] imm4_0,
    output [6:0] imm12105,
    output [4:0] imm4111
//    output [19:0] imm3112 //lui
    );
    /*
    //Mux plantilla
    assign rs1 = instruccion[6]?

    (instruccion[5]?
    
    (instruccion[4]?(instruccion[2]?():())
    :(instruccion[2]?():()))
    
    :(instruccion[4]?(instruccion[2]?():())
    :instruccion[2]?():()))
    
    :(instruccion[5]?
    (instruccion[4]?(instruccion[2]?():())
    :(instruccion[2]?():()))
    
    :(instruccion[4]?(instruccion[2]?():())
    :(instruccion[2]?():())));
    */
    
    assign opcode = instruccion[6:0];
    
    //rs1=instruccion[19:15]
    assign rs1 = instruccion[6]?

    (instruccion[5]?
    
    (instruccion[4]?(instruccion[2]?(5'bx):(instruccion[19:15]))
    :(instruccion[2]?(5'bx):(instruccion[19:15])))
    
    :(instruccion[4]?(instruccion[2]?(5'bx):(instruccion[19:15]))
    :instruccion[2]?(5'bx):(instruccion[19:15])))
    
    :(instruccion[5]?
    (instruccion[4]?(instruccion[2]?(5'bx):(instruccion[19:15]))
    :(instruccion[2]?(5'bx):(instruccion[19:15])))
    
    :(instruccion[4]?(instruccion[2]?(5'bx):(instruccion[19:15]))
    :(instruccion[2]?(5'bx):(instruccion[19:15]))));
    
    //rs2
    assign rs2 = instruccion[6]?

    (instruccion[5]?
    
    (instruccion[4]?(instruccion[2]?(5'bx):(5'bx))
    :(instruccion[2]?(5'bx):(instruccion[24:20])))
    
    :(instruccion[4]?(instruccion[2]?(5'bx):(5'bx))
    :instruccion[2]?(5'bx):(5'bx)))
    
    :(instruccion[5]?
    (instruccion[4]?(instruccion[2]?(5'bx):(instruccion[24:20]))
    :(instruccion[2]?(5'bx):(instruccion[24:20])))
    
    :(instruccion[4]?(instruccion[2]?(5'bx):(5'bx))
    :(instruccion[2]?(5'bx):(5'bx))));
    
    //rd
    assign rd = instruccion[6]?

    (instruccion[5]?
    
    (instruccion[4]?(instruccion[2]?(5'bx):(5'bx))
    :(instruccion[2]?(5'bx):(5'bx)))
    
    :(instruccion[4]?(instruccion[2]?(5'bx):(5'bx))
    :instruccion[2]?(5'bx):(5'bx)))
    
    :(instruccion[5]?
    (instruccion[4]?(instruccion[2]?(instruccion[11:7]):(instruccion[11:7]))
    :(instruccion[2]?(5'bx):(5'bx)))
    
    :(instruccion[4]?(instruccion[2]?(5'bx):(instruccion[11:7]))
    :(instruccion[2]?(5'bx):(instruccion[11:7]))));
    
    //funct3
    assign funct3 = instruccion[6]?

    (instruccion[5]?
    
    (instruccion[4]?(instruccion[2]?(3'bx):(instruccion[14:12]))
    :(instruccion[2]?(3'bx):(instruccion[14:12])))
    
    :(instruccion[4]?(instruccion[2]?(3'bx):(instruccion[14:12]))
    :instruccion[2]?(3'bx):(instruccion[14:12])))
    
    :(instruccion[5]?
    (instruccion[4]?(instruccion[2]?(3'bx):(instruccion[14:12]))
    :(instruccion[2]?(3'bx):(instruccion[14:12])))
    
    :(instruccion[4]?(instruccion[2]?(3'bx):(instruccion[14:12]))
    :(instruccion[2]?(3'bx):(instruccion[14:12]))));
    
    //funct7
    assign funct7 = instruccion[6]?

    (instruccion[5]?
    
    (instruccion[4]?(instruccion[2]?(7'bx):(7'bx))
    :(instruccion[2]?(7'bx):(7'bx)))
    
    :(instruccion[4]?(instruccion[2]?(7'bx):(7'bx))
    :instruccion[2]?(7'bx):(7'bx)))
    
    :(instruccion[5]?
    (instruccion[4]?(instruccion[2]?(7'bx):(instruccion[31:25]))
    :(instruccion[2]?(7'bx):(7'bx)))
    
    :(instruccion[4]?(instruccion[2]?(7'bx):(7'bx))
    :(instruccion[2]?(7'bx):(7'bx))));
    
    //imm12 instruccion[31:20]
    assign imm12 = instruccion[6]?

    (instruccion[5]?
    
    (instruccion[4]?(instruccion[2]?(12'bx):(12'bx))
    :(instruccion[2]?(12'bx):(12'bx)))
    
    :(instruccion[4]?(instruccion[2]?(12'bx):(12'bx))
    :instruccion[2]?(12'bx):(12'bx)))
    
    :(instruccion[5]?
    (instruccion[4]?(instruccion[2]?(12'bx):(12'bx))
    :(instruccion[2]?(12'bx):(12'bx)))
    
    :(instruccion[4]?(instruccion[2]?(12'bx):(instruccion[31:20]))
    :(instruccion[2]?(12'bx):(instruccion[31:20]))));
    
    //imm11_5 instruccion[31:25]
    assign imm11_5 = instruccion[6]?

    (instruccion[5]?
    
    (instruccion[4]?(instruccion[2]?(7'bx):(7'bx))
    :(instruccion[2]?(7'bx):(7'bx)))
    
    :(instruccion[4]?(instruccion[2]?(7'bx):(7'bx))
    :instruccion[2]?(7'bx):(7'bx)))
    
    :(instruccion[5]?
    (instruccion[4]?(instruccion[2]?(7'bx):(7'bx))
    :(instruccion[2]?(7'bx):(instruccion[31:25])))
    
    :(instruccion[4]?(instruccion[2]?(7'bx):(7'bx))
    :(instruccion[2]?(7'bx):(7'bx))));
    
    //imm4_0,
    assign imm4_0 = instruccion[6]?

    (instruccion[5]?
    
    (instruccion[4]?(instruccion[2]?(5'bx):(5'bx))
    :(instruccion[2]?(5'bx):(5'bx)))
    
    :(instruccion[4]?(instruccion[2]?(5'bx):(5'bx))
    :instruccion[2]?(5'bx):(5'bx)))
    
    :(instruccion[5]?
    (instruccion[4]?(instruccion[2]?(5'bx):(5'bx))
    :(instruccion[2]?(5'bx):(instruccion[11:7])))
    
    :(instruccion[4]?(instruccion[2]?(5'bx):(5'bx))
    :(instruccion[2]?(5'bx):(5'bx))));
    
    //imm12105,instruccion[31:25]
    assign imm12105 = instruccion[6]?

    (instruccion[5]?
    
    (instruccion[4]?(instruccion[2]?(7'bx):(7'bx))
    :(instruccion[2]?(7'bx):(instruccion[31:25])))
    
    :(instruccion[4]?(instruccion[2]?(7'bx):(7'bx))
    :instruccion[2]?(7'bx):(7'bx)))
    
    :(instruccion[5]?
    (instruccion[4]?(instruccion[2]?(7'bx):(7'bx))
    :(instruccion[2]?(7'bx):(7'bx)))
    
    :(instruccion[4]?(instruccion[2]?(7'bx):(7'bx))
    :(instruccion[2]?(7'bx):(7'bx))));
    
    
    
    //imm4111,
    assign imm4111 = instruccion[6]?
    
    (instruccion[5]?
    
    (instruccion[4]?(instruccion[2]?(5'bx):(5'bx))
    :(instruccion[2]?(5'bx):(instruccion[11:7])))
    
    :(instruccion[4]?(instruccion[2]?(5'bx):(5'bx))
    :instruccion[2]?(5'bx):(5'bx)))
    
    :(instruccion[5]?
    (instruccion[4]?(instruccion[2]?(5'bx):(5'bx))
    :(instruccion[2]?(5'bx):(5'bx)))
    
    :(instruccion[4]?(instruccion[2]?(5'bx):(5'bx))
    :(instruccion[2]?(5'bx):(5'bx))));
    
    /*
    //imm3112   
    assign imm3112 = instruccion[6]?
    
    (instruccion[5]?
    
    (instruccion[4]?(instruccion[2]?(20'bx):(20'bx))
    :(instruccion[2]?(20'bx):(20'bx)))
    
    :(instruccion[4]?(instruccion[2]?(20'bx):(20'bx))
    :instruccion[2]?(20'bx):(20'bx)))
    
    :(instruccion[5]?
    (instruccion[4]?(instruccion[2]?(instruccion[31:12]):(20'bx))
    :(instruccion[2]?(20'bx):(20'bx)))
    
    :(instruccion[4]?(instruccion[2]?(20'bx):(20'bx))
    :(instruccion[2]?(20'bx):(20'bx))));*/

endmodule
