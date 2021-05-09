module register_file(input clk, Reg_Write,input [4:0]Read_Reg1, Read_Reg2, Write_Reg, input[31:0]Write_Data,output reg [31:0] Read_Data1, Read_Data2);
reg [31:0] regs[0:31];
always @(posedge clk) begin
    if(Reg_Write==1)
        regs[Write_Reg]=Write_Data;
end

assign Read_Data2 = regs[Read_Reg2];
assign Read_Data1 = regs[Read_Reg1];
endmodule