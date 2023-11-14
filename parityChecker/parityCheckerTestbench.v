module parityCheckerTestbench;
reg dataIn, 
reset, 
clk;
wire dataOut;

parityChecker testbench(dataIn, clk, reset, dataOut);

initial
begin

dataIn = 0;
reset = 1;
clk = 0;	

end

always #25 {dataIn, reset} = $random;
always #25 clk = ~clk;
endmodule