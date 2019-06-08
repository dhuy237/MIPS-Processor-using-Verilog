module control(OpCode, control_signal);
input [5:0]OpCode;
output reg [10:0] control_signal;

always @( OpCode)
	case (OpCode)
		6'b000000 : // R - type
			begin
				control_signal[10] = 1'b1;
				control_signal[9] = 1'b0;
				control_signal[8] = 1'b0;
				control_signal[7] = 1'b1;
				control_signal[6] = 1'b0;
				control_signal[5] = 1'b0;
				control_signal[4] = 1'b0;
				control_signal[3:2] = 2'b10;
				control_signal[1] = 1'b0;
				control_signal[0] = 1'bx;
			end
		6'b001000 : // addi
			begin
				control_signal[10] = 1'b0;
				control_signal[9] = 1'b1;
				control_signal[8] = 1'b0;
				control_signal[7] = 1'b1;
				control_signal[6] = 1'b0; 
				control_signal[5] = 1'b0;
				control_signal[4] = 1'b0;
				control_signal[3:2] = 2'b00;
				control_signal[1] = 1'b0;
				control_signal[0] = 1'bx;
			end
		6'b000100 : // beq
			begin
				control_signal[10] = 1'bx;
				control_signal[9] = 1'b0;
				control_signal[8] = 1'bx;
				control_signal[7] = 1'b0;
				control_signal[6] = 1'b0;
				control_signal[5] = 1'b0;
				control_signal[4] = 1'b1;
				control_signal[3:2] = 2'b01;
				control_signal[1] = 1'b0;
				control_signal[0] = 1'b1;
			end
	endcase
endmodule
