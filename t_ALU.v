`timescale 1ns/1ns
module t_ALU ();
reg [3:0] ALU_control;
reg [31:0] ALU_operand_1;
reg [31:0] ALU_operand_2;
wire [31:0] ALU_result;
wire [7:0] ALU_status;

ALU UUT (ALU_control [3:0], ALU_operand_1 [31:0], ALU_operand_2 [31:0], ALU_result [31:0], ALU_status [7:0]);

initial begin
  ALU_control = 4'b1000;
  ALU_operand_1 = 32'h80000000;
  ALU_operand_2 = 32'd10;
end
endmodule
