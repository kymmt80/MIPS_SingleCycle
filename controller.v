module controller(input clk,rst,Zero,input[5:0]opcode,func,output reg Reg_Write,memWrite,memRead,RegDst,ALUsrc,memToReg,Jmp,output PCsrc,output [2:0]ALU_control);
parameter [5:0] 
        RT=6'h0,Addi=6'h8,Slti=6'ha,Lw=6'h23,Sw=6'h2b,J=6'h2,Jal=6'h3,Jr,Beq=6'h4,Bne=6'h5 ;
reg [1:0]ALUop;
reg branch,decide_br;
always@(posedge clk)begin
    Reg_Write=0;memWrite=0;memRead=0;RegDst=0;ALUsrc=0;memToReg=0;branch=0;Jmp=0;decide_br=Zero;
    ALUop=2'b00;
    case(opcode)
    RT:begin
        RegDst=1;
        Reg_Write=1;
        memWrite=0;
        memRead=0;
        ALUsrc=0;
        memToReg=0;
        branch=0;
        Jmp=0;
        ALUop=2'b10;
    end
    Addi:begin
        RegDst=1;
        Reg_Write=1;
        memWrite=0;
        memRead=0;
        ALUsrc=1;
        memToReg=0;
        branch=0;
        Jmp=0;
        ALUop=2'b00;
    end
    Slti:begin
        RegDst=1;
        Reg_Write=1;
        memWrite=0;
        memRead=0;
        ALUsrc=1;
        memToReg=0;
        branch=0;
        Jmp=0;
        ALUop=2'b11;
    end
    Lw:begin
        RegDst=0;
        Reg_Write=1;
        memWrite=0;
        memRead=1;
        ALUsrc=1;
        memToReg=1;
        branch=0;
        Jmp=0;
        ALUop=2'b00;
    end
    Sw:begin
        Reg_Write=0;
        memWrite=1;
        memRead=0;
        ALUsrc=1;
        branch=0;
        Jmp=0;
        ALUop=2'b00;
    end
    J:begin
        Jmp=1;
    end
    Jal:begin
        
    end
    Jr:begin
        
    end
    Beq:begin
        Reg_Write=0;
        memWrite=0;
        memRead=0;
        ALUsrc=0;
        branch=1;
        Jmp=0;
        ALUop=2'b01;
        decide_br=Zero;
    end
    Bne:begin
        Reg_Write=0;
        memWrite=0;
        memRead=0;
        ALUsrc=0;
        branch=1;
        Jmp=0;
        ALUop=2'b01;
        decide_br=~Zero;
    end
    endcase
end
and a1(PCsrc,branch,decide_br);
ALU_controller Ac(.ALUop(ALUop),.func(func),.ALU_control(ALU_control));
endmodule