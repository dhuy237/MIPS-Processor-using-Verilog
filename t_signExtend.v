`timescale 1ns / 1ns
module t_signExtend;
reg [15:0] dataIn;
wire [31:0] dataOut;

signExtend UUT(dataIn[15:0], dataOut[31:0]);

initial begin
  dataIn = 16'b1000000011111111;
end
endmodule
