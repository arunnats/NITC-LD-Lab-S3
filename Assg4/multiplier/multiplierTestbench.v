	module multiplierTestbench;
    reg [3:0] a, b;
    wire [7:0] c;

    multiplier tb (.a(a), .b(b), .c(c));

    integer i,j;
	 initial begin
  	  for (i = 0; i < 16; i = i + 1) begin
	  for (j = 0; j < 16; j = j + 1) begin
  		  a=i;
		  b=j;
			  #10;
			end
       end
	$finish;
	end

endmodule
