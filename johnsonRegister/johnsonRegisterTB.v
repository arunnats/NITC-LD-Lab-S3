module johnsonRegisterTb;
wire [2:0] out;
reg clk;
reg clear;

johnsonRegister johnsonRegistertb(out,clk,clear);

initial 
begin
        clk = 0;
        forever #10 clk = ~clk;  
end

initial
begin
			clear=1;
			#10 clear = 0;
			#300 $finish;
end

endmodule