module inst_mem(input [31:0]Address,output reg [31:0]inst);
reg [31:0] mem[0:1023];

always @(Address) begin
    inst<=mem[Address];
end
endmodule