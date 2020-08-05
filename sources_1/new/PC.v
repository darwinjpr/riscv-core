`timescale 1ns / 1ps
module PC(pc_out,in,clk);

input wire [31:0] in;  
input wire clk;


output reg [31:0] pc_out;

initial
    pc_out = 32'd0;
       
always @(posedge clk)
begin
            pc_out = in;
end
endmodule

