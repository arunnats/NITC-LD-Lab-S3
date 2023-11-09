module eightBitRegister(d,clk,reset,q);

input [7:0]d;
input clk;
input reset;
output reg [7:0]q;

always @(posedge clk or negedge reset)
begin
if(reset==1'b0)
q <= 8'b0;
else
q <= d;
end
endmodule