module moore_zero_det_tb();
wire [1:0] t_y_out;
reg t_x_in,t_clock,t_reset;
  moore_zero_det uut(t_y_out,t_x_in,t_clock,t_reset);

initial #500 $finish;  

initial 
	begin 
		t_clock = 0; 
		forever #10 t_clock = ~t_clock; 
	end

initial 
begin
	t_reset = 0;
	#10 t_reset = 1;
	#10 t_reset = 0;
	#10 t_reset = 1;
	#10 t_x_in = 1;
	#10 t_x_in = 0;
	#10 t_x_in = 1;
	#10 t_x_in = 0;
	#10 t_x_in = 1;
	#10 t_x_in = 0;
	#10 t_x_in = 1;
	#10 t_x_in = 1;
	#10 t_x_in = 0;
	#10 t_x_in = 1;
	#10 t_x_in = 0;
	#10 t_x_in = 1;
	#10 t_x_in = 0;
	#10 t_x_in = 1;
	#20 $finish;
end

endmodule