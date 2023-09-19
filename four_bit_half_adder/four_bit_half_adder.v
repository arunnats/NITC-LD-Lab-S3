module four_bit_half_adder(
	input [3:0] a,
	input [3:0] b,
	output [3:0] sum
);
	xor xor_h0(sum[0],a[0],b[0]);
	
	xor xor_h1(sum[1],a[1],b[1]);
	
	xor xor_h2(sum[2],a[2],b[2]);
	
	xor xor_h3(sum[3],a[3],b[3]);
  
endmodule
