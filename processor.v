module processor(select, SYS_clk, SYS_reset, outputled1, outputled2, hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7);
input SYS_clk, SYS_reset;
input [2:0] select;

output reg [17:0] outputled2;
output reg [7:0] outputled1;
output [6:0] hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7;
wire [7:0] ALU_status_1;
wire [31:0] ALU_result;
wire [31:0] IMEM_instruction;
wire [4:0] dataOut_mux5bit;
wire [10:0] control_signal;
wire [31:0] REG_data_out1, REG_data_out2;
wire [3:0] ALU_control;
wire [31:0] dataOut_mux32bit;
wire [31:0] extend32bit;
wire [31:0] PC_4;
wire [31:0] shiftOut1, shiftOut2;
wire [31:0] addOut2, addOut3;
wire andOut;
wire [31:0] dataOutMux3, dataOutMux5;
wire [31:0] PC_OUT;
wire [31:0] PC_IN;
wire [31:0] dmemOut;

always@(select) //or posedge SYS_clk)
	begin
		case(select)
			3'd0:
				begin
					outputled2[17:0] = IMEM_instruction[26:8];
					outputled1[7:0] = IMEM_instruction[7:0];
				end
			3'd1:
				begin
					outputled2[17:0] = REG_data_out1[26:8];
					outputled1[7:0] = REG_data_out1[7:0];
				end
			3'd2:
				begin
					outputled2[17:0] = ALU_result[26:8];
					outputled1[7:0] = ALU_result[7:0];
				end
			3'd3:
				begin
					outputled2[17:0] = 18'd0;
					outputled1[7:0] = ALU_status_1[7:0];
				end
			3'd4:
				begin
					outputled2[17:0] = dmemOut[26:8];
					outputled1[7:0] = dmemOut[7:0];
				end
			3'd5:
				begin
					outputled2[2:0] = control_signal[10:8];
					outputled1[7:0] = control_signal[7:0];
				end
			3'd6:
				begin
					outputled2[17:0] = 18'd0;
					outputled1[7:4] = 4'd0;
					outputled1[3:0] = ALU_control[3:0];
				end
			3'd7:
				begin
					outputled2[17:0] = PC_OUT[26:8];
					outputled1[7:0] = PC_OUT[7:0];
				end
		endcase
	end
	
hexto7segment seg0(.dataIn(ALU_result[3:0]), .dataOut(hex0[6:0]));
hexto7segment seg1(.dataIn(ALU_result[7:4]), .dataOut(hex1[6:0]));
hexto7segment seg2(.dataIn(ALU_result[11:8]), .dataOut(hex2[6:0]));
hexto7segment seg3(.dataIn(ALU_result[15:12]), .dataOut(hex3[6:0]));
hexto7segment seg4(.dataIn(ALU_result[19:16]), .dataOut(hex4[6:0]));
hexto7segment seg5(.dataIn(ALU_result[23:20]), .dataOut(hex5[6:0]));
hexto7segment seg6(.dataIn(ALU_result[27:24]), .dataOut(hex6[6:0]));
hexto7segment seg7(.dataIn(ALU_result[31:28]), .dataOut(hex7[6:0]));

pc pc1(.SYS_clk(SYS_clk), .SYS_reset(SYS_reset), .pc_in(PC_IN), .pc_out(PC_OUT));

IM im1(.IMEM_PC(PC_OUT), .IMEM_instruction(IMEM_instruction));

adder4 add1(.dataIn(PC_OUT), .dataOut(PC_4));

shiftLeft_26bit shift1(.dataIn(IMEM_instruction[25:0]), .dataOut(shiftOut1));

adder add2(.dataIn1(PC_4), .dataIn2(shiftOut1), .dataOut(addOut2));

shiftLeft shift2(.dataIn(extend32bit), .dataOut(shiftOut2));

adder add3(.dataIn1(PC_4), .dataIn2(shiftOut2), .dataOut(addOut3));

and1 and1(.dataIn1(control_signal[4]), .dataIn2(ALU_status_1[7]), .dataOut(andOut));

mux2to1_32bit mux3(.dataIn1(PC_4), .dataIn2(addOut3), .sel(andOut), .dataOut(dataOutMux3));

mux2to1_32bit mux4(.dataIn1(dataOutMux3), .dataIn2(addOut2), .sel(control_signal[1]), .dataOut(PC_IN));

mux2to1_5bit mux1(.dataIn1(IMEM_instruction [20:16]), .dataIn2(IMEM_instruction [15:11]), .sel(control_signal[10]), .dataOut(dataOut_mux5bit [4:0]));

REG reg1(.REG_address1(IMEM_instruction [25:21]), .REG_address2(IMEM_instruction [20:16]), .REG_address_wr(dataOut_mux5bit [4:0]), .REG_write_1(control_signal[7]), .SYS_clk(SYS_clk), .REG_data_wb_in1(dataOutMux5), .REG_data_out1(REG_data_out1), .REG_data_out2(REG_data_out2));

signExtend extend1(.dataIn(IMEM_instruction[15:0]), .dataOut(extend32bit));

mux2to1_32bit mux2(.dataIn1(REG_data_out2), .dataIn2(extend32bit), .sel(control_signal[9]), .dataOut(dataOut_mux32bit));

ALU alu1(.ALU_control(ALU_control [3:0]), .ALU_operand_1(REG_data_out1), .ALU_operand_2(dataOut_mux32bit), .ALU_result(ALU_result), .ALU_status(ALU_status_1));

ALUControl alucontrol1(.ALUOp(control_signal [3:2]), .instruction(IMEM_instruction[5:0]), .ALU_control(ALU_control [3:0]));

control control1(.OpCode(IMEM_instruction [31:26]), .control_signal(control_signal [10:0]));

DMEM dmem1(.SYS_clk(SYS_clk), .DMEM_address(ALU_result), .DMEM_data_in(REG_data_out2), .DMEM_mem_write(control_signal[5]), .DMEM_mem_read(control_signal[6]), .DMEM_data_out(dmemOut));

mux2to1_32bit mux5(.dataIn1(ALU_result), .dataIn2(dmemOut), .sel(control_signal[8]), .dataOut(dataOutMux5));

endmodule