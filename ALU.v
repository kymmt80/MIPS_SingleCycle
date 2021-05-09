module ALU(input [31:0]A ,B,input [2:0]ALU_control,output Zero,output reg [31:0]Out);
    always@(ALU_control)begin
        Out=0;
        case(ALU_control)
        3'b000:Out=A+B;
        3'b001:Out=A-B;
        3'b010:Out=(A<B)?1:0;
        endcase
    end
    assign Zero=(Out==0)?1:0;
endmodule