module bcd_adder(
     input [3:0] a,
	input [3:0] b,
	output [3:0] sum,
	output finalcarry
);
     wire [3:0] s;
     wire carry;
     wire and_wire0, and_wire1, or_wire0;
    
     four_bit_adder add0 (.a(a),.b(b),.sum(s),.finalcarry(carry));
    
     and and_0(and_wire0,s[3],s[2]);
     and and_1(and_wire1,s[3],s[1]);
     or or_0(or_wire0,and_wire0,and_wire1,carry);
    
     four_bit_adder add1 (.a({1'b0, or_wire0, or_wire0, 1'b0}), .b(s), .sum(sum), .finalcarry(finalcarry));
    
    
    endmodule

 module four_bit_adder(
	input [3:0] a,
	input [3:0] b,
	output [3:0] sum,
	output finalcarry
);
	wire [3:0] and1, and2, and3, and4;
	wire xor0, xor1, xor2, xor3, or1, or2, or3;
	 wire [3:0]cout;
 	 
  adder add1 (.a(a[0]), .b(b[0]), .cin(1'b0), .sum(sum[0]), .cout(cout[0]));
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
