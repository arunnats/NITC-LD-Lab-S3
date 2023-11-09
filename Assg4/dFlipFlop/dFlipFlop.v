module dFlipFlop(d,clk,reset,q);
input d;
input clk;
input reset;  
output reg q;
always @(posedge clk or negedge reset)
begin
if(reset==1'b0)
q <= 1'b0;
else
q <= d;
end
endmodule