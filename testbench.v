module testbench();
reg clk=0,rst=0;
MIPS mips(.clk(clk),.rst(rst));
always#5 clk=~clk;
initial begin
    #0 rst=1;
    #10 rst=0;
end
endmodule