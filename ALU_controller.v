module ALU_controller(input[1:0]ALUop,input[5:0]func,output reg[2:0] ALU_control);
reg [1:0]funcOp;
always @(ALUop,funcOp) begin
    case(ALUop)
        2'b00:ALU_control=3'b000; //add
        2'b01:ALU_control=3'b001; //sub
        2'b10:ALU_control=funcOp; //R type
        2'b11:ALU_control=3'b010; //slt
    endcase
end
always @(func) begin
    case(func)
    6'h20:funcOp=3'b000; //add
    6'h22:funcOp=3'b001; //sub
    6'h2a:funcOp=3'b010; //slt
    endcase
end
endmodule