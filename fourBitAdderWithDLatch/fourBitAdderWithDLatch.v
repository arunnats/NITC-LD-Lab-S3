module temp(
	output [3:0] sum,
	input [3:0] a,
	input [3:0] b
);

	module fullAdder fa ( 

endmodule


module fullAdder(
		output sum,
		carry,
		input a,
		b,
		c
);
	
	wire andWire0,andWire1,andWire2;
	xor xor0(sum,a,b,c);
	and and0(andWire0,a,b);
	and and1(andWire1,b,c);
	and and2(andWire2,c,a);
	
	or or0(carry,andWire0,andWire1,andWire2);
	
endmodule

module fourBitAdderWithDLatch(
    output wire q,
    output wire qBar,
    input d,
    clk
);

    wire dBar, andWire0, andWire1, nandWire0, nandWire1;

    not not0(dBar,d);

    and and0(andWire0,d,clk);
    and and1(andWire1,dBar,clk);

    nand nand0(nandWire0,andWire0,qBar);
    nand nand1(qBar,andWire1,nandWire0);

    assign q = nandWire0;

endmodule
