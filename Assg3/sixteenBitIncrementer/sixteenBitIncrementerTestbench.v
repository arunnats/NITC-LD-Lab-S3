module sixteenBitIncrementerTestbench;

	reg [15:0] a;
	wire [15:0] b;
	wire finalcarry;
    
	sixteenBitIncrementer testbench (
    	.a(a),
    	.b(b),
  	.finalcarry(finalcarry)
	);
    
	integer i;
	initial begin
  	  for (i = 0; i < 65536; i = i + 1) begin
  		  a=i;
			  #10;
       end
	$finish;
	end

endmodule
