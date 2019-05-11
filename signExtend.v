module signExtend(dataIn, dataOut);
    input [15:0] dataIn;
    output [31:0] dataOut;
    reg [31:0] dataOut;
    always @ (dataIn)
      begin
          dataOut <= { {16{dataIn[15]}}, dataIn[15:0]};
      end
endmodule
