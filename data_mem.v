module data_mem(input memWrite,memRead,input [31:0]writeData,Address,output reg [31:0]readData);
reg[31:0] mem[0:65535];

initial begin
    mem[1000]=32'd56;
    mem[1004]=32'd5;
    mem[1008]=32'd4;
    mem[1012]=32'd6;
    mem[1016]=32'd1;
    mem[1020]=32'd5;
    mem[1024]=32'd4;
    mem[1028]=32'd8;
    mem[1032]=32'd4;
    mem[1036]=32'd5;
end

always@(memRead,Address)begin
    if (memRead ==1)
        readData <= mem[Address];
    else if(memWrite==1)
        mem[Address]<=writeData;
end
endmodule