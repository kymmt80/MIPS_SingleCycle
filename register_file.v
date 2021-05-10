module register_file(input clk, Reg_Write,input [4:0]Read_Reg1, Read_Reg2, Write_Reg, input[31:0]Write_Data,output reg [31:0] Read_Data1, Read_Data2);
reg [31:0] regs[0:31];

initial begin 
    regs[0]=0;
    regs[1]=0;
    regs[2]=0;
    regs[3]=0;
    regs[4]=0;
    regs[5]=0;
    regs[6]=0;
    regs[7]=0;
    regs[8]=0;
    regs[9]=0;
    regs[10]=0;
    regs[11]=0;
    regs[12]=0;
    regs[13]=0;
    regs[14]=0;
    regs[15]=0;
    regs[16]=32'd4;
    regs[17]=32'd7;
end

always @(posedge clk) begin
    if(Reg_Write==1&&Write_Reg!=0)
        regs[Write_Reg]=Write_Data;
end

assign Read_Data2 = regs[Read_Reg2];
assign Read_Data1 = regs[Read_Reg1];
endmodule