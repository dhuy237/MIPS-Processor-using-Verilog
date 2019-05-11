module adder(dataIn, dataOut);
    input [7:0] dataIn;
    output reg [7:0] dataOut;
    always @ (dataIn) begin
        dataOut <= dataIn + 8'b00000100;
    end
endmodule
