module fourBitDecrementorTestbench;

	reg [3:0] a;
	wire [4:0] b;
    
	fourBitDecrementor testbench (
    	.a(a),
    	.b(b)
	);
    
	integer i;
	initial begin
  	  for (i = 0; i < 16; i = i + 1) begin
  		  a=i;
			  #10;
       end
	$finish;
	end

endmodule
