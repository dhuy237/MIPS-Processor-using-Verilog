module system ( //modeule system
    input SYS_clk,
    input SYS_reset,
    input SYS_load,
    input [7 :0] SYS_pc_val,
    input [7 :0] SYS_output_sel,
    output[26:0] SYS_leds
);

module IMEM ( //instruction memory
    input [7 :0] IMEM_PC,
    output[31:0] IMEM_instruction
);

module REG ( //register files
    input [5:0] REG_address1,
    input [5:0] REG_address2,
    input [5:0] REG_address_wr,
    input REG_write_1,
    input [31:0] REG_data_wb_in1,
    output[31:0] REG_data_out1,
    output[31:0] REG_data_out2,
);

module ALU ( //ALU
    input [3 :0] ALU_control,
    input [31:0] ALU_operand_1,
    input [31:0] ALU_operand_2,
    output [31:0] ALU_result,
    output [7 :0] ALU_status
);

module DMEM ( //data memory
    input [31:0] DMEM_address,
    input [31:0] DMEM_data_in,
    input DMEM_mem_write,
    input DMEM_mem_read,
    output[31:0] DMEM_data_out
);

module control ( //control unit
    input [5:0] opcode;
    output [10:0] control_signal;
);
module ALUControl();
module Exception();
module adder();
module mux();
module signExtend();
module shiftLeft();
module EPC();
