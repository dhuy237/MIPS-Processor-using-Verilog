module testSystem(machineCode, SYS_clk, ALU_status, ALU_result);
input [31:0] machineCode;
input SYS_clk;
output [7:0] ALU_status;
output [31:0] ALU_result;

wire [4:0] dataOut_mux5bit;
wire [10:0] control_signal;
wire [31:0] REG_data_out1, REG_data_out2;
wire [3:0] ALU_control;

mux2to1_5bit mux1(.dataIn1(machineCode [20:16]), .dataIn2(machineCode [15:11]), .sel(control_signal[10]), .dataOut(dataOut_mux5bit [4:0]));
REG reg1(.REG_address1(machineCode [25:21]), .REG_address2(machineCode [20:16]), .REG_address_wr(dataOut_mux5bit [4:0]), .REG_write_1(control_signal[7]), .SYS_clk(SYS_clk), .REG_data_wb_in1(ALU_result [31:0]), .REG_data_out1(REG_data_out1), .REG_data_out2(REG_data_out2));
ALU alu1(.ALU_control(ALU_control [3:0]), .ALU_operand_1(REG_data_out1), .ALU_operand_2(REG_data_out2), .ALU_result(ALU_result), .ALU_status(ALU_status));
ALUControl alucontrol1(.ALUOp(control_signal [3:2]), .instruction(machineCode[5:0]), .ALU_control(ALU_control [3:0]));
control control1(.OpCode(machineCode [31:26]), .control_signal(control_signal [10:0]));
endmodule
//mux2to1_5bit mux1([20:16] machineCode, [15:11] machineCode, control_signal[11], [4:0] dataOut_mux5bit);
//REG reg1([25:21] machineCode, [20:16] machineCode, [4:0] dataOut_mux5bit, control_signal[7], SYS_clk, [31:0] ALU_result, [31:0] REG_data_out1, [31:0] REG_data_out2);
//ALUControl alucontrol1([3:2] control_signal, [5:0] machineCode, [3:0] ALU_control);
//control control1([31:26] machineCode, [10:0]control_signal);
//ALU alu1([3:0] ALU_control, [31:0] REG_data_out1, [31:0] REG_data_out2, [31:0] ALU_result, [7:0] ALU_status);
