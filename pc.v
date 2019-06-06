module pc(SYS_clk, SYS_reset, pc_in, pc_out);
input SYS_clk, SYS_reset;
input [31:0] pc_in;
output [31:0]	pc_out;
reg [31:0] out;
initial begin
	out = 32'd0;
end
always @(posedge SYS_clk or negedge SYS_reset)
  begin
	 if(SYS_reset == 1'b0)
		begin
			out = 32'd0;
		end
	else
      begin
        out = pc_in;
      end
  end
assign pc_out = out;
endmodule
