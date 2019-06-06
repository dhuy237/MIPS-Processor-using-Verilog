module IM (IMEM_PC, IMEM_instruction);
input [31:0] IMEM_PC;
output [31:0] IMEM_instruction;
reg [31:0] IMEM_instruction;
always @ (IMEM_PC)
	begin
		case (IMEM_PC)
			32'd0: IMEM_instruction = 32'b00100000000010010000000000000001; //addi t1 zero 1
			32'd4: IMEM_instruction = 32'b00100000000010100000000000001010; //addi t2 zero 10
			32'd8: IMEM_instruction = 32'b00100001001010010000000000000001; // addi t1 t1 1
			32'd12: IMEM_instruction = 32'b00000001001010100101100000101010; //slt t3 t1 t2
			32'd16: IMEM_instruction = 32'b00100000000010000000000000000001; //addi t0 zero 1
			32'd20: IMEM_instruction = 32'b00010001011010001111111111111100; //beq t3 t0 0xfffc (-4)
			32'd24: IMEM_instruction = 32'b00100001010010100000000000001101; // addi t2 t2 13
			32'd28: IMEM_instruction = 32'b00000001001010100110000000100000; //add t4 t1 t2
			32'd32: IMEM_instruction = 32'b00000001001010100110100000100010; //sub t5 t1 t2
			32'd36: IMEM_instruction = 32'b00000001001010100111000000100100; //and t6 t1 t2
			32'd40: IMEM_instruction = 32'b00000001001010100111100000100101; //or t7 t1 t2
		endcase
	end
endmodule
