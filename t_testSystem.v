`timescale 1ns/1ns
module t_testSystem();
reg [31:0] machineCode;
reg SYS_clk;
wire [7:0] ALU_status;
wire [31:0] ALU_result;
testSystem UUT(machineCode[31:0], SYS_clk, ALU_status[7:0], ALU_result[31:0]);
initial begin
  machineCode = 32'b00000001010010110100100000101010;
end
initial begin
  SYS_clk = 0;
  forever #5 SYS_clk = ~ SYS_clk;
end
endmodule
