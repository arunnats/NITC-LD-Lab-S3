module sixteenBitIncrementer(
	input [15:0] a,
	output [15:0] b,
	finalcarry
);

	wire [14:0]carry;
    
	halfAdder h1(.s(b[0]),.c(carry[0]),.a(a[0]),.b(1'b1));
	halfAdder h2(.s(b[1]),.c(carry[1]),.a(a[1]),.b(carry[0]));
	halfAdder h3(.s(b[2]),.c(carry[2]),.a(a[2]),.b(carry[1]));
	halfAdder h4(.s(b[3]),.c(carry[3]),.a(a[3]),.b(carry[2]));
   halfAdder h5(.s(b[4]),.c(carry[4]),.a(a[4]),.b(carry[3]));
   halfAdder h6(.s(b[5]),.c(carry[5]),.a(a[5]),.b(carry[4]));
   halfAdder h7(.s(b[6]),.c(carry[6]),.a(a[6]),.b(carry[5]));
   halfAdder h8(.s(b[7]),.c(carry[7]),.a(a[7]),.b(carry[6]));
   halfAdder h9(.s(b[8]),.c(carry[8]),.a(a[8]),.b(carry[7]));
   halfAdder h10(.s(b[9]),.c(carry[9]),.a(a[9]),.b(carry[8]));
   halfAdder h11(.s(b[10]),.c(carry[10]),.a(a[10]),.b(carry[9]));
   halfAdder h12(.s(b[11]),.c(carry[11]),.a(a[11]),.b(carry[10]));
   halfAdder h13(.s(b[12]),.c(carry[12]),.a(a[12]),.b(carry[11]));
   halfAdder h14(.s(b[13]),.c(carry[13]),.a(a[13]),.b(carry[12]));
   halfAdder h15(.s(b[14]),.c(carry[14]),.a(a[14]),.b(carry[13]));
   halfAdder h16(.s(b[15]),.c(finalcarry),.a(a[15]),.b(carry[14]));

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
    
	nand nand_1 (y,a,a);
    
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
