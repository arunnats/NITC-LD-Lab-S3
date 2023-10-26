module sixteenBitDecrementer(
    input [15:0] a,
    output [16:0] b
);
	wire [15:0]carry;
    
	fullAdder fa0(.s(b[0]),.c(carry[0]),.a(a[0]),.b(1'b1),.cin(1'b0));
	fullAdder fa1(.s(b[1]),.c(carry[1]),.a(a[1]),.b(1'b1),.cin(carry[0]));
	fullAdder fa2(.s(b[2]),.c(carry[2]),.a(a[2]),.b(1'b1),.cin(carry[1]));
	fullAdder fa3(.s(b[3]),.c(carry[3]),.a(a[3]),.b(1'b1),.cin(carry[2]));
   fullAdder fa4(.s(b[4]),.c(carry[4]),.a(a[4]),.b(1'b1),.cin(carry[3]));
   fullAdder fa5(.s(b[5]),.c(carry[5]),.a(a[5]),.b(1'b1),.cin(carry[4]));
   fullAdder fa6(.s(b[6]),.c(carry[6]),.a(a[6]),.b(1'b1),.cin(carry[5]));
   fullAdder fa7(.s(b[7]),.c(carry[7]),.a(a[7]),.b(1'b1),.cin(carry[6]));
   fullAdder fa8(.s(b[8]),.c(carry[8]),.a(a[8]),.b(1'b1),.cin(carry[7]));
   fullAdder fa9(.s(b[9]),.c(carry[9]),.a(a[9]),.b(1'b1),.cin(carry[8]));
   fullAdder fa10(.s(b[10]),.c(carry[10]),.a(a[10]),.b(1'b1),.cin(carry[9]));
   fullAdder fa11(.s(b[11]),.c(carry[11]),.a(a[11]),.b(1'b1),.cin(carry[10]));
   fullAdder fa12(.s(b[12]),.c(carry[12]),.a(a[12]),.b(1'b1),.cin(carry[11]));
   fullAdder fa13(.s(b[13]),.c(carry[13]),.a(a[13]),.b(1'b1),.cin(carry[12]));
   fullAdder fa14(.s(b[14]),.c(carry[14]),.a(a[14]),.b(1'b1),.cin(carry[13]));
   fullAdder fa15(.s(b[15]),.c(carry[15]),.a(a[15]),.b(1'b1),.cin(carry[14]));
    
    
	not_1In not_1 (b[16],carry[15]);
    
endmodule

module and_2In(
    output y,
    input a,
   b
);
    
    wire aNandb;
    
    nand nand_1 (aNandb,a,b);
    nand nand_2 (y,aNandb,aNandb);

endmodule

module or_2In(
    output y,
    input a,
    input b
);
    
    wire aNanda, bNandb;
    
    nand nand_1 (aNanda,a,a);
    nand nand_2 (bNandb,b,b);
    nand nand_3 (y,aNanda,bNandb);

endmodule

module not_1In(
    output y,
    input a
);
    
    nand nand_1 (y,a);
    
endmodule

module xor_2In(
    output y,
    input a,
    b
);

    wire aNandb,aNandComp,bNandComp;

    nand nand_1 (aNandb,a,b);
    nand nand_2 (aNandComp,a,aNandb);
    nand nand_3 (bNandComp,b,aNandb);
    nand nand_4 (y,aNandComp,bNandComp);

endmodule

module halfAdder(
    output s,
    c,
    input a,
    b
);

    xor_2In xor_1(.y(s),.a(a),.b(b));
    and_2In and_1(.y(c),.a(a),.b(b));
    
endmodule

module fullAdder(
	output s,
	c,
	input a,
	b,
	cin
);
    
	wire carry1,carry2,sum;
	halfAdder ha1(.s(sum),.c(carry1),.a(a),.b(b));
	halfAdder ha2(.s(s),.c(carry2),.a(cin),.b(sum));
    
	or_2In or1(c,carry1,carry2);
    
endmodule
