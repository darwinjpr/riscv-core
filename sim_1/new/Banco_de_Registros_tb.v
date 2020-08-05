module reg_Bank_tb ();

reg [4:0] DIR_A, DIR_B, DIR_WR;
reg [31:0] DI;
reg REG_WR, CLK;
wire [31:0] DOA, DOB;

reg_bank REG(DOA, DOB, DI, DIR_A, DIR_B, DIR_WR, clk, REG_WR);

initial CLK = 0;

always #5 CLK = !CLK;

initial 
   begin
       #7
       for (k=0; k<32; k=k+1)
        begin
           DIR_WR = k; DI =10*k; REG_WR=1;
           #10 REG_WR = 0;  
        end

        #20
        for (k=0; k<32; k=k+2)
            begin
                DIR_A = k, DIR_B = k+1;
                #5
                $display ("reg[%2d=%d, reg[%2d]=%d", DIR_A, DOA, DIR_B, DOB);
            end

        #2000 $finish;
   end


endmodule