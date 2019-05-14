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

module REG (REG_address1, REG_address2, REG_address_wr, REG_write_1, SYS_clk, REG_data_wb_in1, REG_data_out1, REG_data_out2); //register files
input [5:0] REG_address1;
input [5:0] REG_address2;
input [5:0] REG_address_wr;
input REG_write_1, SYS_clk;
input [31:0] REG_data_wb_in1;
output[31:0] REG_data_out1;
output[31:0] REG_data_out2;
reg [31:0] register [31:0];

initial begin
  register[0] <= 32'd0;
  register[1] <= 32'd0;
  register[2] <= 32'd0;
  register[3] <= 32'd0;
  register[4] <= 32'd0;
  register[5] <= 32'd0;
  register[6] <= 32'd0;
  register[7] <= 32'd0;
  register[8] <= 32'd0;
  register[9] <= 32'd0;
  register[10] <= 32'd0;
  register[11] <= 32'd0;
  register[12] <= 32'd0;
  register[13] <= 32'd0;
  register[14] <= 32'd0;
  register[15] <= 32'd0;
  register[16] <= 32'd0;
  register[17] <= 32'd0;
  register[18] <= 32'd0;
  register[19] <= 32'd0;
  register[20] <= 32'd0;
  register[21] <= 32'd0;
  register[22] <= 32'd0;
  register[23] <= 32'd0;
  register[24] <= 32'd0;
  register[25] <= 32'd0;
  register[26] <= 32'd0;
  register[27] <= 32'd0;
  register[28] <= 32'd0;
  register[29] <= 32'd0;
  register[30] <= 32'd0;
  register[31] <= 32'd0;
end

assign REG_data_out1 = register[REG_address1];
assign REG_data_out2 = register[REG_address2];

always @ (posedge SYS_clk)
  begin
      if (REG_write_1 == 1)
        register[REG_address_wr] <= REG_data_wb_in1;
  end
endmodule

module ALU (ALU_control, ALU_operand_1, ALU_operand_2, ALU_result, ALU_status);
input [3:0] ALU_control;
input [31:0] ALU_operand_1;
input [31:0] ALU_operand_2;
output [31:0] ALU_result;
output [7:0] ALU_status;
reg [31:0] ALU_result;
reg [7:0] ALU_status;

always @ (ALUControl, ALU_operand_1, ALU_operand_2)
  begin
    case (ALUControl)
        0: //and
          ALU_result <= ALU_operand_1 & ALU_operand_2;
        1: //or
          ALU_result <= ALU_operand_1 | ALU_operand_2;
        2: //add
          ALU_result <= ALU_operand_1 + ALU_operand_2;
        4: //beq
          begin
            if (ALU_operand_1 == ALU_operand_2)
              ALU_result <= 32'd1;
          end
        6: //sub
          ALU_result <= ALU_operand_1 - ALU_operand_2;
        7: //slt
          begin
              if (ALU_operand_1[31] != ALU_operand_2[31])
                begin
                    if (ALU_operand_1[31] > ALU_operand_2[31])
                      ALU_result <= 32'd1;
                    else
                      ALU_result <= 32'd0;
                end
              else
                begin
                    if (ALU_operand_1 < ALU_operand_2)
                      ALU_result <= 32'd1;
                    else
                      ALU_result <= 32'd0;
                end
          end
    endcase
  end
always @ (ALU_result)
  begin
    if (ALU_result == 0)
      ALU_status[7] <= 1'b1;
  end
endmodule

module DMEM (SYS_clk, DMEM_address, DMEM_data_in, DMEM_mem_write, DMEM_mem_read, DMEM_data_out); //data memory
input SYS_clk;
input [31:0] DMEM_address;
input [31:0] DMEM_data_in;
input DMEM_mem_write;
input DMEM_mem_read;
output[31:0] DMEM_data_out;
reg [31:0] memory [0:255];
always @ (posedge SYS_clk)
  begin
    if (DMEM_mem_write)
      memory[DMEM_address] <= DMEM_data_in;
  end
assign DMEM_data_out = DMEM_mem_read ? memory[DMEM_address] : 0;
endmodule

module control ( //control unit
    input [5:0] opcode;
    output [10:0] control_signal;
);
endmodule

module ALUControl(ALUOp, instruction, ALU_control);
input [1:0] ALUOp;
input [5:0] instruction;
output [3:0] ALU_control;
reg [3:0] ALU_control;

always @ (ALUOp, instruction)
  begin
    if (ALUOp == 2'b01) ALU_control = 4'b0110; //sub
    if (ALUOp == 2'b10)
        begin
          case (instruction)
              6'b100100: //and
                ALU_control = 4'b0000;
              6'b100101: //or
                ALU_control = 4'b0001;
              6'b100000: //add
                ALU_control = 4'b0010;
              6'b100010: //sub
                ALU_control = 4'b0110;
              6'b101010: //slt
                ALU_control = 4'b0111;
          endcase
        end
  end
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
          dataOut <= { {16{dataIn[15]}}, dataIn[15:0] };
      end
endmodule

module shiftLeft(dataIn, dataOut);
    input [31:0] dataIn;
    output [31:0] dataOut;
    reg [31:0] dataOut;
    always @ (dataIn)
      begin
        dataOut <= dataIn << 2;
      end
endmodule
module EPC();
endmodule
