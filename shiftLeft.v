module shiftLeft(dataIn, dataOut);
input [31:0] dataIn;
output [31:0] dataOut;
reg [31:0] dataOut;
always @ (dataIn)
	begin
		dataOut = dataIn << 2;
   end
endmodule
