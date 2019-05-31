module system (SYS_clk, SYS_reset, SYS_load, SYS_pc_val, SYS_output_sel, SYS_leds);
input SYS_clk;
input SYS_reset;
input SYS_load;
input [7:0] SYS_pc_val;
input [7:0] SYS_output_sel;
output[26:0] SYS_leds;

endmodule
