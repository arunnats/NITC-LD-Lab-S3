module project1_testbench;

   reg a;
   reg b;
	reg c;
	reg d;
   wire o;

    project1 testbench (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .o(o),
    );
    
    integer i,j,k,l;
    
    initial begin
        $display("a	b	c	d	o");
        $monitor("%b %b %b %b %b", a, b, c, d, o);
  	   for (k = 0; k < 2; k = k + 1) begin
			for (l = 0; l < 2; l = l + 1) begin
				for (i = 0; i < 2; i = i + 1) begin
					for (j = 0; j < 2; j = j + 1) begin
  				   a=k;
  				   b=l;
  				   c=i;
     			  	d=j;
     			   #10;
				   end
  		      end
			end
  	  end

        $finish;
	end

endmodule



