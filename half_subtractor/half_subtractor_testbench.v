module half_subtractor_testbench;

    reg a;
    reg b;
    wire diff;
    wire borrow;

    half_subtractor testbench (
        .a(a),
        .b(b),,
        .diff(diff),
		  .borrow(borrow)
    );
    
    integer i,j;
	 
    initial begin
        $display("a	b	diff borrow");
        $monitor("%b %b %b %b", a, b, diff, borrow);
  		  for (i = 0; i < 2; i = i + 1) begin
  			  for (j = 0; j < 2; j = j + 1) begin
  				   a=i;
     			  	b=j;
     			   #10;
  			  end
  		  end
  	  end

        $finish;
	end

endmodule
