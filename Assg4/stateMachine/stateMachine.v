module stateMachine(
	output reg y_out,
	input x_in,clk,reset);
reg [1:0] state,next_state;
parameter A = 2'b00, B = 2'b01, C = 2'b10;
always@(posedge clk,negedge reset)
	if (reset==0) state <= A;
	else state<=next_state;
always @ (state, x_in)
	case (state)
		A:
			if (x_in) next_state = C;
			else next_state = B;
		B:
			if (x_in) next_state = C;
			else next_state = B;
		C:
			if (x_in) next_state = C;
			else next_state = B;
	endcase
always@(posedge clk,negedge reset)
	if (reset==0) y_out <= 0;
	else case (state)
		A: y_out <= 0;
		B: y_out <= 0;
		C: y_out <= x_in;
	endcase
endmodule
