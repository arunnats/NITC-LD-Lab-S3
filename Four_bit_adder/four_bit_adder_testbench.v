module four_bit_adder_testbench;

	reg [3:0] a;
	reg [3:0] b;
     reg cin;
	wire [3:0] sum;
     wire finalcarry;

	four_bit_adder testbench (
  	  .a(a),
  	  .b(b),
   	  .cin(cin),
  	  .sum(sum),
   	  .finalcarry(finalcarry)
	);
    
	integer i,j,k;
    
	initial begin
  	  $display("a    b    cin    finalcarry    sum");
  	  $monitor("%b %b %b %b %b", a, b, cin, finalcarry, sum);
   	  for (k = 0; k < 2; k = k + 1) begin
   		 for (i = 0; i < 16; i = i + 1) begin
   			 for (j = 0; j < 16; j = j + 1) begin
   				  cin=k;
   				  a=i;
  				  b=j;
  				  #10;
   			 end
   		 end
   	 end

  	  $finish;
    end

endmodule
