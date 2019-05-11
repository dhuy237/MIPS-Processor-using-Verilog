`timescale 1ns/1ns
module t_shiftLeft;
reg [31:0] dataIn;
wire [31:0] dataOut;

shiftLeft UUT(dataIn[31:0], dataOut[31:0]);

initial begin
  dataIn = 32'd1;
end
endmodule
