module biDirectionalShiftRegister(
	output reg [7:0] out,
	input dataIn,
	input clk,
	input reset,
	input direction
);


always@(posedge clk or negedge reset)
begin
	if(~reset)
		out <= 8`bx;
	else if (direction)
		out <={out[6:0],dataIn} ;
	else
		out <={dataIn,out[7:1]} ;
	
end

endmodule