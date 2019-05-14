module ALU (ALU_control, ALU_operand_1, ALU_operand_2, ALU_result, ALU_status);
input [3:0] ALU_control;
input [31:0] ALU_operand_1;
input [31:0] ALU_operand_2;
output [31:0] ALU_result;
output [7:0] ALU_status;
reg [63:0] ALU_result_temp;
reg [7:0] ALU_status;
integer i;
assign ALU_result = ALU_result_temp [31:0];
initial begin
  ALU_status = 8'd0;
end
always @ (ALU_control, ALU_operand_1, ALU_operand_2)
  begin
    case (ALU_control)
        0: //and
          ALU_result_temp <= ALU_operand_1 & ALU_operand_2;
        1: //or
          ALU_result_temp <= ALU_operand_1 | ALU_operand_2;
        2: //add
          ALU_result_temp <= ALU_operand_1 + ALU_operand_2;
        3: //mul
          ALU_result_temp <= ALU_operand_1 * ALU_operand_2;
        4: //beq
          begin
            if (ALU_operand_1 == ALU_operand_2)
              ALU_result_temp <= 32'd1;
          end
        6: //sub
          ALU_result_temp <= ALU_operand_1 - ALU_operand_2;
        7: //slt
          begin
              if (ALU_operand_1[31] != ALU_operand_2[31])
                begin
                    if (ALU_operand_1[31] > ALU_operand_2[31])
                      ALU_result_temp <= 32'd1;
                    else
                      ALU_result_temp <= 32'd0;
                end
              else
                begin
                    if (ALU_operand_1 < ALU_operand_2)
                      ALU_result_temp <= 32'd1;
                    else
                      ALU_result_temp <= 32'd0;
                end
          end
    endcase
  end
always @ (ALU_result)
  begin
    if (ALU_result_temp == 0)
      ALU_status[7] <= 1'b1;
    if (ALU_result_temp[63:32] > 32'd0)
      ALU_status[6] <= 1'b1;
    if (ALU_result_temp[31] == 1'b1)
      ALU_status[4] <= 1'b1;
    for (i = 31; i >= 0; i = i - 1)
        begin
            if(ALU_operand_1[i] == 0 && ALU_operand_2[i] == 0 && ALU_result_temp[i] == 1)
                ALU_status[5] <= 1'b1;
        end
  end
endmodule
