module four_bit_adder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output finalcarry
);
    wire [3:0] and1, and2, and3, and4;
    wire xor0, xor1, xor2, xor3, or1, or2, or3;
 	wire [3:0]cout;
    
	/* xor xor_f1_0 (sum[0],a[0],b[0],cin);
 	and and_f1_0 (and1[0],a[0],b[0]);
 	and and_f1_1 (and1[1],cin,b[0]);
 	and and_f1_2 (and1[2],a[0],cin);
 	or or_f1_0 (cout[0],and1[0],and1[1],and1[2]);
    
 	xor xor_f2_0 (sum[1],a[1],b[1],cout[0]);
 	and and_f2_0 (and2[0],a[1],b[1]);
 	and and_f2_1 (and2[1],cout[0],b[1]);
 	and and_f2_2 (and2[2],a[1],cout[0]);
 	or or_f2_0 (cout[1],and2[0],and2[1],and2[2]);
    
 	xor xor_f3_0 (sum[2],a[2],b[2],cout[1]);
 	and and_f3_0 (and3[0],a[2],b[2]);
 	and and_f3_1 (and3[1],cout[1],b[2]);
 	and and_f3_2 (and3[2],a[2],cout[1]);
 	or or_f3_0 (cout[2],and3[0],and3[1],and3[2]);
    
 	xor xor_f4_0 (sum[3],a[3],b[3],cout[2]);
 	and and_f4_0 (and4[0],a[3],b[3]);
 	and and_f4_1 (and4[1],cout[2],b[3]);
 	and and_f4_2 (and4[2],a[3],cout[2]);
 	or or_f4_0 (finalcarry,and4[0],and4[1],and4[2]);*/
      
      adder add1 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(cout[0]));
      adder add2 (.a(a[1]), .b(b[1]), .cin(cout[0]), .sum(sum[1]), .cout(cout[1]));
      adder add3 (.a(a[2]), .b(b[2]), .cin(cout[1]), .sum(sum[2]), .cout(cout[2]));
      adder add4 (.a(a[3]), .b(b[3]), .cin(cout[2]), .sum(sum[3]), .cout(finalcarry));

endmodule


module adder(
	input a,
	b,
	cin,
	output sum,
	cout
	);
    
   wire [3:0] wire1;
      xor xor_f1_1 (sum,a,b,cin);
    and and_f1_0 (wire1[0],a,b);
    and and_f1_1 (wire1[1],a,cin);
    and and_f1_2 (wire1[2],cin,b);
    or or_f1_0 (cout,wire1[0],wire1[1],wire1[2]);

endmodule
