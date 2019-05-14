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
