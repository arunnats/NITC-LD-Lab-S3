module aluTestbench;

    reg [15:0] x;
    reg [15:0] y;
    wire [15:0] a;
	 wire [15:0] b;
	 wire [15:0] c;
	 wire d;
	 wire e;
	 wire [15:0] f;
	 wire [15:0] g;
	 wire [15:0] h;
	 wire [15:0] i;
	 wire [15:0] j;
	 wire [15:0] k;
	 wire [15:0] l;
	 wire [15:0] m;
	 wire [15:0] n;
	 wire [15:0] o;
	 wire [15:0] p;
    
    alu testbench (
        .x(x),
        .y(y),
		  .a(a),
		  .b(b),
		  .c(c),
		  .d(d),
		  .e(e),
		  .f(f),
		  .g(g),
		  .h(h),
		  .i(i),
		  .j(j),
		  .k(k),
		  .l(l),
		  .m(m),
		  .n(n),
		  .o(o),
		  .p(p)
    );
    
    integer r,s;
    initial begin
   	 for (r = 0; r < 256; r = r + 1) begin
			for (s = 0; s < 256; s = s + 1) begin
   		 x=r;
			 y=s;
     		 #10;
			end
  	 end
    $finish;
    end

endmodule
