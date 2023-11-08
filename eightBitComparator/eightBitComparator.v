module eightBitComparator(
	input [4:0] a,
	input [4:0] b,
	output aGreater,
	bGreater,
	aEqualsb
);
	equals eq0(.a(a),.b(b),.y(aEqualsb));
	greater aGreaterb(.a(a),.b(b),.y(aGreater));
	greater bGreatera(.b(b),.a(a),.y(bGreater));
	
endmodule

module equals(
	input [4:0] a,
	input [4:0] b,
	output y
);

	wire xorWire0, xorWire1, xorWire2, xorWire3;
	
	xor xor0(xorWire0,a[0],b[0]);
	xor xor1(xorWire1,a[1],b[1]);
	xor xor2(xorWire2,a[2],b[2]);
	xor xor3(xorWire3,a[3],b[3]);
	
	and and0(y,xorWire0,xorWire1,xorWire2,xorWire3);
	
endmodule

module greater(
	input [4:0] a,
	input [4:0] b,
	output y
);

	wire xorWire0, xorWire1, xorWire2, xorWire3;
	wire [4:0] aNot, bNot;
	wire andWire0,andWire1,andWire2,andWire3;
	
	not not0(bNot[0],b[0]);
	not not1(bNot[1],b[1]);
	not not2(bNot[2],b[2]);
	not not3(bNot[3],b[3]);
	
	xor xor0(xorWire0,a[0],b[0]);
	xor xor1(xorWire1,a[1],b[1]);
	xor xor2(xorWire2,a[2],b[2]);
	xor xor3(xorWire3,a[3],b[3]);
	
	
	and and0(andWire0,a[3],bNot[3]);
	and and1(andWire1,xorWire3,a[2],bNot[2]);
	and and2(andWire2,xorWire3,xorWire2,a[1],bNot[1]);
	and and3(andWire3,xorWire3,xorWire2,xorWire1,a[0],bNot[0]);
	
	or or0(y,andWire0,andWire1,andWire2,andWire3);
	
endmodule