`timescale 1ns/1ns
module t_adder;
reg [7:0] dataIn;
wire [7:0] dataOut;

adder UUT(dataIn[7:0], dataOut[7:0]);

initial begin
  dataIn = 8'd7;
end
endmodule
