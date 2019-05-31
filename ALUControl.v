module ALUControl(ALUOp, instruction, ALU_control);
input [1:0] ALUOp;
input [5:0] instruction;
output [3:0] ALU_control;
reg [3:0] ALU_control;

always @ (ALUOp, instruction)
  begin
    if (ALUOp == 2'b00) ALU_control = 4'b1000; //addi
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
              default: ALU_control = 4'bxxxx;
          endcase
        end
  end
endmodule
