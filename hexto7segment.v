module hexto7segment(dataIn, dataOut);
input [3:0] dataIn;
output reg [6:0] dataOut;

always @(*)
  begin
    case (dataIn)
      4'b0000: dataOut = 7'b0000001;
      4'b0001: dataOut = 7'b1001111;
      4'b0010: dataOut = 7'b0010010;
      4'b0011: dataOut = 7'b0000110;
      4'b0100: dataOut = 7'b1001100;
      4'b0101: dataOut = 7'b0100100;
      4'b0110: dataOut = 7'b0100000;
      4'b0111: dataOut = 7'b0001111;
      4'b1000: dataOut = 7'b0000000;
      4'b1001: dataOut = 7'b0000100;
      4'b1010: dataOut = 7'b0001000;
      4'b1011: dataOut = 7'b1100000;
      4'b1100: dataOut = 7'b0110001;
      4'b1101: dataOut = 7'b1000010;
      4'b1110: dataOut = 7'b0110000;
      4'b1111: dataOut = 7'b0111000;
		default dataOut = 7'b0000001;
    endcase
  end
endmodule
