module control1(RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUop, Jump, SignZero ,OpCode);
input [5:0] OpCode;
output Jump,RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,SignZero;
output [1:0] ALUop;
reg Jump,RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,SignZero;
reg [1:0] ALUop;
  always @(OpCode)
    case (OpCode)
      6'b000000 : // R - type
        begin
          RegDst = 1'b1; // Thanh ghi dich giai ma tu bit [15:11] cua lenh
          ALUSrc = 1'b0;
          MemtoReg = 1'b0;
          RegWrite = 1'b1; // Cho phep ghi gia tri vao thanh ghi dich
          MemRead = 1'b0;
          MemWrite = 1'b0;
          Branch = 1'b0;
          ALUop = 2'b10;
          Jump = 1'b0;
          SignZero = 1'bx;
        end
      6'b100011 : // lw - load word
        begin
          RegDst = 1'b0; // thanh ghi dich duoc giai ma tu bit [20:16] cua lenh
          ALUSrc = 1'b1; // chon gia tri sign_extend dua vao bo ALU
          MemtoReg = 1'b1; // chon gia tri dua ve thanh ghi dich tu bo nho du lieu
          RegWrite = 1'b1; // cho phep gia tri dua ve duoc ghi vao thanh ghi dich
          MemRead = 1'b1; // cho phep doc du lieu tu bo nho du lieu
          MemWrite = 1'b0;
          Branch = 1'b0;
          ALUop = 2'b00;
          Jump = 1'b0;
          SignZero = 1'b0; // chon sign extend
        end
      6'b101011 : // sw - store word
        begin
          RegDst = 1'bx; //
          ALUSrc = 1'b1; // chon gia tri sign_extend dua vao bo ALU
          MemtoReg = 1'bx; // khogn quan tam gia tri dua ve
          RegWrite = 1'b0;
          MemRead = 1'b0;
          MemWrite = 1'b1; // cho phep ghi du lieu vao bo nho du lieu
          Branch = 1'b0;
          ALUop = 2'b00;
          Jump = 1'b0;
          SignZero = 1'b0;
        end
      6'b000101 : // bne - branch if not equal
        begin
          RegDst = 1'bx;
          ALUSrc = 1'b0;
          MemtoReg = 1'bx;
          RegWrite = 1'b0;
          MemRead = 1'b0;
          MemWrite = 1'b0;
          Branch = 1'b1; // cho phep thuc hien lenh branch
          ALUop = 2'b01;
          Jump = 1'b0;
          SignZero = 1'b0; // sign extend
        end
      6'b000010 : // j - Jump
        begin
          RegDst = 1'bx;
          ALUSrc = 1'bx;
          MemtoReg = 1'bx;
          RegWrite = 1'b0;
          MemRead = 1'b0;
          MemWrite = 1'b0;
          Branch = 1'bx;
          ALUop = 2'bxx;
          Jump = 1'b1;
          SignZero = 1'bx;
        end
      6'b001000 : // addi
        begin
          RegDst = 1'b0;
          ALUSrc = 1'b0;
          MemtoReg = 1'b0;
          RegWrite = 1'b1; // Cho phep ghi gia tri vao thanh ghi dich
          MemRead = 1'b0;
          MemWrite = 1'b0;
          Branch = 1'b0;
          ALUop = 2'b10;
          Jump = 1'b0;
          SignZero = 1'bx;
        end
      6'b000100 : // beq
        begin
          RegDst = 1'bx;
          ALUSrc = 1'b0; // Chon zero_extend 32 bit dua vao ALU
          MemtoReg = 1'bx;
          RegWrite = 1'b0; // Cho phep ghi du lieu vao thanh ghi dich
          MemRead = 1'b0;
          MemWrite = 1'b0;
          Branch = 1'b1;
          ALUop = 2'b00;
          Jump = 1'b0;
          SignZero = 1'b1; // zero extend
        end
    endcase
endmodule
