module instructionmem (IMEM_instruction, IMEM_PC);
	output [31:0] IMEM_instruction;
	input [7:0] IMEM_PC;

	reg [31:0] instr_mem [0:31];

	always @ (IMEM_PC)
		begin
			case (IMEM_PC)
				32'd0: IMEM_instruction = 32'h...;

			endcase
		end
endmodule //instructionmem

/*
add $t1, $t2, $t3        (1)

sub $t4, $t5, $t6

and $t5, $t6, $t7

or  $t5, $t6, $t7

addi $t1, $t2, 0x00000001

beq $t2, $t3, 0x014B4820 (if $t2 = $t3 then go to (1)  )

slt $t1, $t2, $t3
*/
