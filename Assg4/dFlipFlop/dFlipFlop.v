module dFlipFlop(d,clk,preset,clear,q);
input d;
input clk;
input preset; 
input clear;
output reg q;
always @(posedge clk or negedge preset or negedge clear)
begin
if(clear==1'b0)
q <= 1'b0;
else if(preset==1'b0)
q <= 1'b1;
else
q <= d;
end
endmodule