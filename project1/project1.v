module project1(
	input a,
	b,
	c,
	d,
	output o
);
	
	wire nand_wire_1,nand_wire_2;
	
	nand nanf_g_1(nand_wire_1,a,b);
	nand nanf_g_2(nand_wire_2,c,d);
	nand nanf_g_3(o,nand_wire_1,nand_wire_2);
	
endmodule 