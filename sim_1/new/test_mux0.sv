`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module test_mux0();

logic [31:0] pc4;
logic [31:0] otro;
logic sel;
logic [31:0] pc;

muxpc test_mux0(pc4,otro,sel,pc);

initial begin
pc4=32'h8;
otro=32'hbaca;
sel=0;
#2;
sel=1;
end

endmodule
