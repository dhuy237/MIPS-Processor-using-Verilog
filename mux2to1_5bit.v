module mux2to1_5bit(dataIn1, dataIn2, sel, dataOut);
input [4:0] dataIn1, dataIn2;
input sel;
output [4:0] dataOut;
reg [4:0] dataOut;
always @(dataIn1, dataIn2, sel) 
	begin
		if (sel == 0)
			dataOut <= dataIn1;
      else
         dataOut <= dataIn2;
   end
endmodule
