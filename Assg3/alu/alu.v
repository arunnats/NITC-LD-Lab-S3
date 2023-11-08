module alu(
	input [15:0] x,
	input [15:0] y,
	output [15:0] a,
	output [15:0] b,
	output [15:0] c,
	output d,
	output e,
	output [15:0] f,
	output [15:0] g,
	output [15:0] h,
	output [15:0] i,
	output [15:0] j,
	output [15:0] k,
	output [15:0] l,
	output [15:0] m,
	output [15:0] n,
	output [15:0] o,
	output [15:0] p
);

	adder16bit add (.s(a),.a(x),.b(y));
	subtractor16bit sub0 (.difference(b),.a(x),.b(y));
	subtractor16bit sub1 (.difference(c),.a(y),.b(x));
	notGate not0 (d,(1'b0));
   notGate not1 (e,(1'b1));
	convertToNegative con0 (.a(16'b0000000000000001),.b(f));
	convertToNegative con1 (.a(x),.b(g));
	convertToNegative con2 (.a(y),.b(h));
	sixteenBitNegator neg0 (.a(x),.b(i));
	sixteenBitNegator neg1 (.a(y),.b(j));
	incrementer16Bit inc0 (.a(x),.b(k));
	incrementer16Bit inc1 (.a(y),.b(l));
	decrementer16Bit dec0 (.a(x),.b(m));
	decrementer16Bit dec1 (.a(y),.b(n));
	sixteenBitAnd and16 (x,y,o);
	sixteenBitOr or16 (x,y,p);
endmodule
	
module convertToNegative(
	input [15:0] a,
	output [15:0] b
);
	wire [15:0] complement;
	
	sixteenBitNegator neg0 ( .a(a),.b(complement));
	incrementer16Bit inc0 (.a(complement),.b(b));
	
endmodule


module sixteenBitAnd(
	input [15:0] a,
	input [15:0] b,
	output [15:0] y
);
	andGate and1 (.y(y[0]),.a(a[0]),.b(b[0]));
	andGate and2 (.y(y[1]),.a(a[1]),.b(b[1]));
	andGate and3 (.y(y[2]),.a(a[2]),.b(b[2]));
	andGate and4 (.y(y[3]),.a(a[3]),.b(b[3]));
	
	andGate and5 (.y(y[4]),.a(a[4]),.b(b[4]));
	andGate and6 (.y(y[5]),.a(a[5]),.b(b[5]));
	andGate and7 (.y(y[6]),.a(a[6]),.b(b[6]));
	andGate and8 (.y(y[7]),.a(a[7]),.b(b[7]));
	
	andGate and9 (.y(y[8]),.a(a[8]),.b(b[8]));
	andGate and10 (.y(y[9]),.a(a[9]),.b(b[9]));
	andGate and11 (.y(y[10]),.a(a[10]),.b(b[10]));
	andGate and12 (.y(y[11]),.a(a[11]),.b(b[11]));
	
	andGate and13 (.y(y[12]),.a(a[12]),.b(b[12]));
	andGate and14 (.y(y[13]),.a(a[13]),.b(b[13]));
	andGate and15 (.y(y[14]),.a(a[14]),.b(b[14]));
	andGate and16 (.y(y[15]),.a(a[15]),.b(b[15]));
    
endmodule
	
module sixteenBitOr(
	input [15:0] a,
	input [15:0] b,
	output [15:0] y
);

	orGate or1 (.y(y[0]),.a(a[0]),.b(b[0]));
	orGate or2 (.y(y[1]),.a(a[1]),.b(b[1]));
	orGate or3 (.y(y[2]),.a(a[2]),.b(b[2]));
	orGate or4 (.y(y[3]),.a(a[3]),.b(b[3]));
	
	orGate or5 (.y(y[4]),.a(a[4]),.b(b[4]));
	orGate or6 (.y(y[5]),.a(a[5]),.b(b[5]));
	orGate or7 (.y(y[6]),.a(a[6]),.b(b[6]));
	orGate or8 (.y(y[7]),.a(a[7]),.b(b[7]));
	
	orGate or9 (.y(y[8]),.a(a[8]),.b(b[8]));
	orGate or10 (.y(y[9]),.a(a[9]),.b(b[9]));
	orGate or11 (.y(y[10]),.a(a[10]),.b(b[10]));
	orGate or12 (.y(y[11]),.a(a[11]),.b(b[11]));
	
	orGate or13 (.y(y[12]),.a(a[12]),.b(b[12]));
	orGate or14 (.y(y[13]),.a(a[13]),.b(b[13]));
	orGate or15 (.y(y[14]),.a(a[14]),.b(b[14]));
	orGate or16 (.y(y[15]),.a(a[15]),.b(b[15]));
    
endmodule
	
module sixteenBitNegator(
	input [15:0] a,
	output [15:0] b
);

	nand g_0(b[0],a[0]);
	nand g_1(b[1],a[1]);
	nand g_2(b[2],a[2]);
	nand g_3(b[3],a[3]);
   nand g_4(b[4],a[4]);
   nand g_5(b[5],a[5]);
   nand g_6(b[6],a[6]);
   nand g_7(b[7],a[7]);
   nand g_8(b[8],a[8]);
   nand g_9(b[9],a[9]);
   nand g_10(b[10],a[10]);
   nand g_11(b[11],a[11]);
   nand g_12(b[12],a[12]);
   nand g_13(b[13],a[13]);
   nand g_14(b[14],a[14]);
   nand g_15(b[15],a[15]);
    
endmodule


module incrementer16Bit(
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

module decrementer16Bit(
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
  	 
    notGate not_1 (b[16],carry[15]);
    
endmodule


module adder16bit(
    output[15:0] s,
    output[15:0] c,
    input[15:0] a,
    input[15:0] b
    );
    fullAdder FA1(s[0],c[0],a[0],b[0],1'b0);
    fullAdder FA2(s[1],c[1],a[1],b[1],c[0]);
    fullAdder FA3(s[2],c[2],a[2],b[2],c[1]);
    fullAdder FA4(s[3],c[3],a[3],b[3],c[2]);

    fullAdder FA5(s[4],c[4],a[4],b[4],c[3]);
    fullAdder FA6(s[5],c[5],a[5],b[5],c[4]);
    fullAdder FA7(s[6],c[6],a[6],b[6],c[5]);
    fullAdder FA8(s[7],c[7],a[7],b[7],c[6]);

    fullAdder FA9(s[8],c[8],a[8],b[8],c[7]);
    fullAdder FA10(s[9],c[9],a[9],b[9],c[8]);
    fullAdder FA11(s[10],c[10],a[10],b[10],c[9]);
    fullAdder FA12(s[11],c[11],a[11],b[11],c[10]);

    fullAdder FA13(s[12],c[12],a[12],b[12],c[11]);
    fullAdder FA14(s[13],c[13],a[13],b[13],c[12]);
    fullAdder FA15(s[14],c[14],a[14],b[14],c[13]);
    fullAdder FA16(s[15],c[15],a[15],b[15],c[14]);
    
endmodule

module subtractor16bit(
    output[15:0] borrow,
    output[15:0] difference,
    input[15:0] a,
    input[15:0] b
    );
    fullSubtractor FS1(borrow[0],difference[0],a[0],b[0],1'b0);
    fullSubtractor FS2(borrow[1],difference[1],a[1],b[1],borrow[0]);
    fullSubtractor FS3(borrow[2],difference[2],a[2],b[2],borrow[1]);
    fullSubtractor FS4(borrow[3],difference[3],a[3],b[3],borrow[2]);

    fullSubtractor FS5(borrow[4],difference[4],a[4],b[4],borrow[3]);
    fullSubtractor FS6(borrow[5],difference[5],a[5],b[5],borrow[4]);
    fullSubtractor FS7(borrow[6],difference[6],a[6],b[6],borrow[5]);
    fullSubtractor FS8(borrow[7],difference[7],a[7],b[7],borrow[6]);

    fullSubtractor FS9(borrow[8],difference[8],a[8],b[8],borrow[7]);
    fullSubtractor FS10(borrow[9],difference[9],a[9],b[9],borrow[8]);
    fullSubtractor FS11(borrow[10],difference[10],a[10],b[10],borrow[9]);
    fullSubtractor FS12(borrow[11],difference[11],a[11],b[11],borrow[10]);

    fullSubtractor FS13(borrow[12],difference[12],a[12],b[12],borrow[11]);
    fullSubtractor FS14(borrow[13],difference[13],a[13],b[13],borrow[12]);
    fullSubtractor FS15(borrow[14],difference[14],a[14],b[14],borrow[13]);
    fullSubtractor FS16(borrow[15],difference[15],a[15],b[15],borrow[14]);
    
endmodule

module fullSubtractor(
    output borrow,
    output diff,
    input a,
    input b,
    input bin
);
    wire diff0,borrow0,borrow1;
    halfSubtractor fs0(.a(a), .b(b), .borrow(borrow0), .diff(diff0));
    halfSubtractor fs1(.a(diff0), .b(bin), .borrow(borrow1), .diff(diff));
    orGate or_0(.a(borrow1), .b(borrow0), .y(borrow));
endmodule


module fullAdder(
    output s,
    output c,
    input a,
    input b,
    input cin
    );

    wire s1,c1,c2;
    
    halfAdder HA1(s1,c1,a,b);
    halfAdder HA2(s,c2,s1,cin);
    orGate or1(.a(c1),.b(c2),.y(c));

endmodule

module halfAdder(
    output s,
    output c,
    input a,
    input b
);

    xorGate xor_0 (s,a,b);
    andGate and_0 (c,a,b);

endmodule


module halfSubtractor(output borrow,
	output diff,
	input a,
	input b
);

    wire not_a;
    xorGate xor_0 (diff,a,b);
    notGate not_0 (not_a,a);
    andGate and0 (borrow,not_a,b);

endmodule


module andGate(
    output y,
    input a,
   b
);
    
    wire aNandb;
    
    nand nand_1 (aNandb,a,b);
    nand nand_2 (y,aNandb,aNandb);

endmodule

module orGate(
    output y,
    input a,
    input b
);
    
    wire aNanda, bNandb;
    
    nand nand_1 (aNanda,a,a);
    nand nand_2 (bNandb,b,b);
    nand nand_3 (y,aNanda,bNandb);

endmodule

module notGate(
    output y,
    input a
);
    
    nand nand_1 (y,a);
    
endmodule

module xorGate(
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