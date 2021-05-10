module MIPS(input clk,rst);
wire Reg_Write,memWrite,memRead,RegDst,ALUsrc,memToReg,PCsrc,Jmp,Zero;
wire [2:0]ALU_control;
wire [31:0]inst;
    datapath(clk,rst,Reg_Write,memWrite,memRead,RegDst,ALUsrc,memToReg,PCsrc,Jmp,ALU_control,inst,Zero);
    controller(clk,rst,Zero,inst[31:26],inst[5:0],Reg_Write,memWrite,memRead,RegDst,ALUsrc,memToReg,PCsrc,Jmp,ALU_control);
endmodule