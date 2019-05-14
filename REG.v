module REG (REG_address1, REG_address2, REG_address_wr, REG_write_1, SYS_clk, REG_data_wb_in1, REG_data_out1, REG_data_out2); //register files
input [5:0] REG_address1;
input [5:0] REG_address2;
input [5:0] REG_address_wr;
input REG_write_1, SYS_clk;
input [31:0] REG_data_wb_in1;
output [31:0] REG_data_out1;
output [31:0] REG_data_out2;
reg [31:0] register [31:0];

assign REG_data_out1 = (REG_address1 == 0) ? 32'b0 : register[REG_address1];
assign REG_data_out2 = (REG_address2 == 0) ? 32'b0 : register[REG_address2];

always @ (posedge SYS_clk)
  begin
      if (REG_write_1)
        register[REG_address_wr] <= REG_data_wb_in1;
  end
endmodule
