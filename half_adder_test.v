module half_adder_test;
reg in1, in2;
wire out1, out2;
half_adder a1(out1,out2 ,in1, in2);
reg [2:0]count;
initial begin
for(count=0; count<4; count = count+1)
begin
{in1, in2} = count[1:0];
#20;
end
end
endmodule