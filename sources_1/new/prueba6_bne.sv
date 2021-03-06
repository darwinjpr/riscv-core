`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2020 09:46:09
// Design Name: 
// Module Name: prueba6_bne
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


module prueba6_bne();

//CABLES
//PC
logic [31:0] PC_OutSum;
logic [31:0] PC;
logic clk = 0;
//memoria de instrucciones
logic [31:0] i; //instrucción
// etapa de ID
wire [6:0] opcode;
wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;
wire [2:0] funct3;
wire [6:0] funct7;
wire [11:0] imm;
wire [6:0] imm11_5;//sw
wire [4:0] imm4_0;//sw
wire [6:0] imm12105;//bne
wire [4:0] imm4111;//bne
//wire [19:0] imm3112; //lui
//Unidad de control
wire S_Mux_A;
logic control_ALU;
wire [1:0] S_Mux_B, S_Mux_C;
wire REG_RD, REG_WR, MEM_RD, MEM_WR;
//banco de registros
wire [31:0] DOA;
wire [31:0] DOB;
wire [31:0] DI;
//extension de signo
wire [31:0]imm_ex;
//concatena y extiende para sw
wire [31:0]imm_sw;
//mux escoge ente imm y rs2
wire [31:0]B;
//ALU
wire [31:0] ALU_out;
wire cero;
//Memoria de datos
wire [31:0]MemOut;
//FETCH
wire [31:0]i_branch;
wire [31:0]opPC;

//ETAPAS
//PC
PC regPC(PC,PC_OutSum,clk);
//sumador de PC
add4 addPC(PC,opPC,PC_OutSum);
//Memoria instrucciones
memoriainstrucciones nextInst(.Din(PC),.Dout(i));
//ID
if_id_buffer ID(i,opcode,rs1,rs2,rd,funct3,funct7,imm,imm11_5,imm4_0,imm12105,imm4111);
//Unidad de control
UnidadControl control(opcode,funct7[5],clk,cero,control_ALU,S_Mux_A,S_Mux_B, S_Mux_C,REG_RD, REG_WR, MEM_RD, MEM_WR);
//banco de registros
reg_bank b_registros(DOA, DOB, DI, rs1, rs2, rd, clk, REG_WR);
//extension de signo
s_ext Ext_Signo(imm,imm_ex);
//concatena y extiende para sw
concatenador concatenador(imm11_5,imm4_0,imm_sw);
//mux escoge ente imm y rs2
Mux_B muxB(S_Mux_B,imm_ex,imm_sw,DOB,B);
//ALU
ALU ALU(DOA,B,control_ALU,ALU_out,cero);
//Memoria de datos
memoriadatos memDATOS(ALU_out,DOB,MEM_RD,MEM_WR,funct3,clk,MemOut);
//mux C
Mux_C muxC(i,ALU_out,MemOut,S_Mux_C,DI);
//FETCH
concatenador2 concatenador2(imm12105,imm4111,i_branch);
Mux_A muxA(i_branch,S_Mux_A,opPC);

 
initial begin
 /*  // Define file handle integer
integer outfile;

initial begin
   // Open file output.dat for writing
   outfile = $fopen("output.dat", "w");

   // Check if file was properly opened and if not, produce error and exit
   if (outfile == 0) begin
      $display("Error: File, output.dat could not be opened.\nExiting Simulation.");
      $finish;
   end

   // Write monitor data to a file
   $fmonitor (outfile, "Time: %t\t Data_out = %h", $realtime, Data_out);

   // Wait for 1 ms and end monitoring
   #1000000;

   // Close file to end monitoring
   $fclose(outfile);
end

// Example of reading a file using $fscanf:
// ----------------------------------------

real number;

// Define integers for file handling
integer number_file;
integer i=1;

initial begin
   // Open file numbers.txt for reading
   number_file = $fopen("numbers.txt", "r");
   // Produce error and exit if file could not be opened
   if (number_file == 0) begin
      $display("Error: Failed to open file, numbers.txt\nExiting Simulation.");
      $finish;
   end
   // Loop while data is being read from file
   //    (i will be -1 when end of file or 0 for blank line)
   while (i>0) begin
      $display("i = %d", i);
      i=$fscanf(number_file, "%f", number);
      $display("Number read from file is %f", number);
      @(posedge CLK);
   end
   // Close out file when finished reading
   $fclose(number_file);
   #100;
   $display("Simulation ended normally");
   $stop;
end*/
for (int i = 0; i <= 10000; i=i+1) begin
#1
clk =  ! clk;
end
end
endmodule