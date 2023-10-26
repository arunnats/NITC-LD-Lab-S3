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
