module data_mem(input memWrite,memRead,input [31:0]writeData,Address,output reg readData);
reg[31:0] mem[0:65535];

always@(memRead,Address)begin
    if (memRead ==1)
        readData <= mem[Address];
    else if(memWrite==1)
        mem[Address]<=writeData;
end
endmodule