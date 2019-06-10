module ExceptionHandle(ALU_status, readIn, writeIn, MemRead, MemWrite);
input [7:0] ALU_status;
input readIn, writeIn;
output reg MemRead, MemWrite;
always @(ALU_status)
	begin
		if (ALU_status[6] == 1'b1 || ALU_status[3] == 1'b1 || ALU_status[2] == 1'b1)
			begin
				MemRead = 1'b0;
				MemWrite = 1'b0;
			end
		else
			begin
				MemRead = 1'b1;
				MemWrite = 1'b1;
			end
	end
endmodule