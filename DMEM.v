module DMEM (SYS_clk, DMEM_address, DMEM_data_in, DMEM_mem_write, DMEM_mem_read, DMEM_data_out); //data memory
input SYS_clk;
input [31:0] DMEM_address;
input [31:0] DMEM_data_in;
input DMEM_mem_write;
input DMEM_mem_read;
output[31:0] DMEM_data_out;
reg [31:0] memory [0:255];
always @ (posedge SYS_clk)
  begin
    if (DMEM_mem_write)
      memory[DMEM_address] <= DMEM_data_in;
  end
assign DMEM_data_out = DMEM_mem_read ? memory[DMEM_address] : 0;
endmodule
