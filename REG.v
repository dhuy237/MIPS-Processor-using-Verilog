module REG (REG_address1, REG_address2, REG_address_wr, REG_write_1, SYS_clk, REG_data_wb_in1, REG_data_out1, REG_data_out2); //register files
input [4:0] REG_address1;
input [4:0] REG_address2;
input [4:0] REG_address_wr;
input REG_write_1, SYS_clk;
input [31:0] REG_data_wb_in1;
output [31:0] REG_data_out1;
output [31:0] REG_data_out2;
reg [31:0] register [0:31];


initial begin
  register[0] = 32'd0;
  register[1] = 32'd0;
  register[2] = 32'd0;
  register[3] = 32'd0;
  register[4] = 32'd0;
  register[5] = 32'd0;
  register[6] = 32'd0;
  register[7] = 32'd0;
  register[8] = 32'd0;
  register[9] = 32'd0;
  register[10] = 32'd13;
  register[11] = 32'd18;
  register[12] = 32'd0;
  register[13] = 32'd0;
  register[14] = 32'd0;
  register[15] = 32'd0;
  register[16] = 32'd0;
  register[17] = 32'd0;
  register[18] = 32'd0;
  register[19] = 32'd0;
  register[20] = 32'd0;
  register[21] = 32'd0;
  register[22] = 32'd0;
  register[23] = 32'd0;
  register[24] = 32'd0;
  register[25] = 32'd0;
  register[26] = 32'd0;
  register[27] = 32'd0;
  register[28] = 32'd0;
  register[29] = 32'd0;
  register[30] = 32'd0;
  register[31] = 32'd0;
end
always @ (posedge SYS_clk)
  begin
      if (REG_write_1 == 1'd1)
        register[REG_address_wr] = REG_data_wb_in1;
  end
assign REG_data_out1 = register[REG_address1];
assign REG_data_out2 = register[REG_address2];
//assign REG_data_out1 = (REG_address1 == 0) ? 32'd0 : register[REG_address1];
//assign REG_data_out2 = (REG_address2 == 0) ? 32'd0 : register[REG_address2];
endmodule
