module system ( //modeule system
    input SYS_clk,
    input SYS_reset,
    input SYS_load,
    input [7 :0] SYS_pc_val,
    input [7 :0] SYS_output_sel,
    output[26:0] SYS_leds
);
endmodule

module IMEM ( //instruction memory
    input [7 :0] IMEM_PC,
    output[31:0] IMEM_instruction
);
endmodule

module REG ( //register files
    input [5:0] REG_address1,
    input [5:0] REG_address2,
    input [5:0] REG_address_wr,
    input REG_write_1,
    input [31:0] REG_data_wb_in1,
    output[31:0] REG_data_out1,
    output[31:0] REG_data_out2,
);
endmodule

module ALU ( //ALU
    input [3 :0] ALU_control,
    input [31:0] ALU_operand_1,
    input [31:0] ALU_operand_2,
    output [31:0] ALU_result,
    output [7 :0] ALU_status
);
endmodule

module DMEM ( //data memory
    input [31:0] DMEM_address,
    input [31:0] DMEM_data_in,
    input DMEM_mem_write,
    input DMEM_mem_read,
    output[31:0] DMEM_data_out
);
endmodule

module control ( //control unit
    input [5:0] opcode;
    output [10:0] control_signal;
);
endmodule

module ALUControl();
endmodule
module Exception();
endmodule

module adder(dataIn, dataOut);
    input [7:0] dataIn; //IMEM_PC
    output reg [7:0] dataOut;
    always @ (dataIn)
      begin
          dataIn <= dataIn + 32'd4;
      end
endmodule

module mux2to1_32bit(dataIn1, dataIn2, sel, dataOut);
    input [31:0] dataIn1, dataIn2;
    input sel;
    output [31:0] dataOut;
    reg [31:0] dataOut;
    always @(dataIn1, dataIn2, sel)
      begin
          if (sel == 0)
            dataOut <= dataIn1;
          else
            dataOut <= dataIn2;
      end
endmodule

module signExtend(dataIn, dataOut);
    input [15:0] dataIn;
    output [31:0] dataOut;
    reg [31:0] dataOut;
    always @ (dataIn)
      begin
          dataOut <= { {16{dataIn[15]}}, dataIn[15:0]};
      end
endmodule

module shiftLeft(dataIn, dataOut);
    input [31:0] dataIn;
    output [31:0] dataOut;
endmodule
module EPC();
endmodule
