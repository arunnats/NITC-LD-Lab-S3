module twoBitAdderFSM(
output [3:0] reg y,
input [1:0] a,
input [1:0] b,
input clk,
input reset
);

parameter A = 0, G = 1, H = 2;
reg [1:0] state, nextState;
reg [3:0] comp;
comp = {a,b};

always@(posedge clk)
begin

	if(reset)
		state = A;
	else
		state = nextState;
		
	case(state)
	
	A:
		if(comp == 4'b0000)
		begin
			nextState = G;
			y = 0;
		end
		

end

endmodule