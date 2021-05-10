module MIPS(input clk,rst);
wire Reg_Write,memWrite,memRead,RegDst,ALUsrc,memToReg,PCsrc,Jmp,Zero,link31,writePC,Jumpinp;
wire [2:0]ALU_control;
wire [31:0]inst;
    datapath dp(clk,rst,Reg_Write,memWrite,memRead,RegDst,ALUsrc,memToReg,PCsrc,Jmp,link31,writePC,Jumpinp,ALU_control,inst,Zero);
    controller c(clk,rst,Zero,inst[31:26],inst[5:0],Reg_Write,memWrite,memRead,RegDst,ALUsrc,memToReg,Jmp,link31,writePC,Jumpinp,PCsrc,ALU_control);
endmodule