module shiftLeft_26bit(dataIn, dataOut);
input [25:0] dataIn;
output [31:0] dataOut;
reg [31:0] dataOut;
always @ (dataIn)
	begin
		dataOut = { {16{dataIn[25]}}, dataIn[25:0]} << 2;
   end
endmodule
