module stateMachineTestBench();
wire y_out;
reg x_in,clock,reset;
  stateMachine tb(y_out,x_in,clock,reset);

initial 
	begin 
		clock = 0; 
		forever #5 clock = ~clock; 
	end

initial 
begin
	reset = 0;
	#10 reset = 1;
	#10 reset = 0;
	#10 reset = 1;
	#10 x_in = 1;
	#10 x_in = 0;
	#10 x_in = 1;
	#10 x_in = 0;
	#10 x_in = 1;
	#10 x_in = 0;
	#10 x_in = 1;
	#10 x_in = 1;
	#10 x_in = 0;
	#10 x_in = 1;
	#10 x_in = 0;
	#10 x_in = 1;
	#10 x_in = 0;
	#10 x_in = 1;
	#20 $finish;
end

endmodule