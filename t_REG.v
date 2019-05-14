`timescale 1ns / 1ns
module t_REG;
reg [5:0] REG_address1;
reg [5:0] REG_address2;
reg [5:0] REG_address_wr;
reg REG_write_1, SYS_clk;
reg [31:0] REG_data_wb_in1;
wire [31:0] REG_data_out1;
wire [31:0] REG_data_out2;

REG UUT(REG_address1 [5:0], REG_address2[5:0], REG_address_wr [5:0], REG_write_1, REG_data_wb_in1 [31:0], REG_data_out1 [31:0], REG_data_out2 [31:0]);

initial begin
  REG_address1 = 6'd9;
  REG_address2 = 6'd10;
  REG_address_wr = 6'd8;
  REG_write_1 = 1;
  REG_data_wb_in1 = 32'd12;
end
initial begin
  SYS_clk = 0;
  forever #5 SYS_clk = ~ SYS_clk;
end
endmodule
