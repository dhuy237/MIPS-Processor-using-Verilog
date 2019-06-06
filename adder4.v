module adder4(dataIn, dataOut);
input [31:0] dataIn;
output reg [31:0] dataOut;
always @ (dataIn) 
	begin
		dataOut = dataIn + 32'd4;
   end
endmodule
