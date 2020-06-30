`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2020 18:31:30
// Design Name: 
// Module Name: muxpc
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


module muxpc(
    input [31:0] pc4,
    input [31:0] otro,
    input sel,
    output [31:0] pc
    );
    
    
   assign pc = sel ? otro : pc4;
			
	
endmodule
