module datapath(input clk,rst,Reg_Write,memWrite,memRead,RegDst,ALUsrc,memToReg,PCsrc,Jmp,link31,writePC,Jumpinp,input [2:0]ALU_control,output [31:0]inst,output Zero);
    wire [31:0]writeData,regAddress,instAddress,readDataMem,Write_Data,Read_Data1, Read_Data2,ALUin2,ALUout,PCsrcIn,addIn,branchIn,notJmp,memData,Jump;
    wire [4:0]Read_Reg1, Read_Reg2, Write_Reg,outReg;

    register PC(
        .clk(clk),
        .ld(1'b1),
        .rst(rst),
        .Qin(PCsrcIn),
        .Q(instAddress)
    );

    adder incrementer(
        .a(instAddress),
        .b(32'd4),
        .res(addIn)
    );

    adder branchAdd(
        .a(addIn),
        .b({{14{inst[15]}},inst[15:0],2'b00}),
        .res(branchIn)
    );

    mux2nton branchmux(
        .a(addIn),
        .b(branchIn),
        .o(notJmp),
        .s(PCsrc)
    );

    mux2nton Jumpinmux(
        .a({instAddress[31:28],inst[25:0],2'b00}),
        .b(Read_Data1),
        .o(Jump),
        .s(Jumpinp)
    );

    mux2nton Jmpmux(
        .a(notJmp),
        .b(Jump),
        .o(PCsrcIn),
        .s(Jmp)
    );

    inst_mem im(
        .Address(instAddress),
        .inst(inst)
    );

    mux2nton #5 dstReg(
        .a(inst[20:16]),
        .b(inst[15:11]),
        .o(outReg),
        .s(RegDst)
    );

    mux2nton #5 reg31(
        .a(outReg),
        .b(5'd31),
        .o(Write_Reg),
        .s(link31)
    );

    mux2nton ALUB(
        .a(Read_Data2),
        .b({{16{inst[15]}},inst[15:0]}),
        .s(ALUsrc),
        .o(ALUin2)
    );

    register_file rf(
        .clk(clk),
        .Reg_Write(Reg_Write),
        .Read_Reg1(inst[25:21]),
        .Read_Reg2(inst[20:16]),
        .Write_Reg(Write_Reg),
        .Write_Data(Write_Data),
        .Read_Data1(Read_Data1),
        .Read_Data2(Read_Data2)
    );

    ALU alu(
        .A(Read_Data1),
        .B(ALUin2),
        .ALU_control(ALU_control),
        .Zero(Zero),
        .Out(ALUout)
    );

    data_mem dm(
        .memWrite(memWrite),
        .memRead(memRead),
        .writeData(Read_Data2),
        .Address(ALUout),
        .readData(readDataMem)
    );

    mux2nton memtoreg(
        .b(readDataMem),
        .a(ALUout),
        .o(memData),
        .s(memToReg)
    );

    mux2nton PCdata(
        .b(notJmp),
        .a(memData),
        .o(Write_Data),
        .s(writePC)
    );

endmodule