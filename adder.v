module adder(dataIn1, dataIn2, dataOut);
input [31:0] dataIn1;
input [31:0] dataIn2;
output reg [31:0] dataOut;
always @ (dataIn1, dataIn2) 
	begin
		dataOut = dataIn1 + dataIn2;
   end
endmodule
