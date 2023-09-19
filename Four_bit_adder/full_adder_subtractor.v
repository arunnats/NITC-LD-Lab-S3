module full_adder_subtractor(
	input [3:0] a,
	input [3:0] b,
	input k,
	output [3:0] sum,
	output finalcarry
);
	  wire [3:0] a_wire,b_wire,k_wire;
	  wire xor0, xor1, xor2, xor3, or1, or2, or3;
     wire [3:0]cout;
    
   /*  xor xor_f1_0 (xor0,b[0],k);
     xor xor_f1_1 (sum[0],a[0],xor0,k);
     and and_f1_0 (and1[0],a[0],xor0);
     and and_f1_1 (and1[1],a[0],k);
     and and_f1_2 (and1[2],k,xor0);
     or or_f1_0 (cout[0],and1[0],and1[1],and1[2]);
    
     xor xor_f2_0 (xor1,b[1],k);
     xor xor_f2_1 (sum[1],a[1],xor1,cout[0]);
     and and_f2_0 (and2[0],a[1],xor1);
     and and_f2_1 (and2[1],a[1],cout[0]);
     and and_f2_2 (and2[2],cout[0],xor1);
     or or_f2_0 (cout[1],and2[0],and2[1],and2[2]);
    
     xor xor_f3_0 (xor2,b[2],k);
     xor xor_f3_1 (sum[2],a[2],xor2,cout[1]);
     and and_f3_0 (and3[0],a[2],xor2);
     and and_f3_1 (and3[1],a[2],cout[1]);
     and and_f3_2 (and3[2],cout[1],xor2);
     or or_f3_0 (cout[2],and3[0],and3[1],and3[2]);
    
     xor xor_f4_0 (xor3,b[3],k);
     xor xor_f4_1 (sum[3],a[3],xor3,cout[2]);
     and and_f4_0 (and4[0],a[3],xor3);
     and and_f4_1 (and4[1],a[3],cout[2]);
     and and_f4_2 (and4[2],cout[2],xor3);
     or or_f4_0 (finalcarry,and4[0],and4[1],and4[2]);
	  */
	 adder add1 (.a(a[0]), .b(b[0]), .k(k), .cin(k), .sum(sum[0]), .cout(cout[0]));
    adder add2 (.a(a[1]), .b(b[1]), .k(k), .cin(cout[0]), .sum(sum[1]), .cout(cout[1]));
    adder add3 (.a(a[2]), .b(b[2]), .k(k), .cin(cout[1]), .sum(sum[2]), .cout(cout[2]));
    adder add4 (.a(a[3]), .b(b[3]), .k(k), .cin(cout[2]), .sum(sum[3]), .cout(finalcarry));
    
endmodule


module adder(
	input a,
	b,
	k,
	cin,
	output sum,
	cout
	);
	
	 wire [3:0] wire1;
	 xor xor_f1_0 (xor0,b,k);
    xor xor_f1_1 (sum,a,xor0,k);
    and and_f1_0 (wire1[0],a,xor0);
    and and_f1_1 (wire1[1],a,k);
    and and_f1_2 (wire1[2],k,xor0);
    or or_f1_0 (cout,wire1[0],wire1[1],wire1[2]);
	
	
	
endmodule
	