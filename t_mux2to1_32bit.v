`timescale 1ns/1ns
module t_mux2to1_32bit;
reg [31:0] dataIn1;
reg [31:0] dataIn2;
reg sel;
wire [31:0] dataOut;

mux2to1_32bit UUT(dataIn1[31:0], dataIn2[31:0], sel, dataOut[31:0]);

initial begin
    dataIn1 = 32'd32;
    dataIn2 = 32'd40;
    #20
    sel = 0;
end
endmodule
