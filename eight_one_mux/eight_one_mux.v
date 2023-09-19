module eight_one_mux(
    output y,
    input in0,
    input in1,
    input in2,
    input in3,
    input in4,
    input in5,
    input in6,
    input in7,
    input s0,
    input s1,
    input s2
);

    wire [2:0] not_s;
    wire and_gate [7:0], or_gate;
    
/*  assign not_s[0]=-(s0);
	 assign not_s[1]=-(s1);
	 assign not_s[2]=-(s2);*/
	 
    not not_0(not_s[0], s0);
    not not_1(not_s[1], s1);
    not not_2(not_s[2], s2);
    
    and and_0(and_gate[0], not_s[0], not_s[1], not_s[2], in0);
    and and_1(and_gate[1], not_s[0], not_s[1], s2, in1);
    and and_2(and_gate[2], not_s[0], s1, not_s[2], in2);
    and and_3(and_gate[3], not_s[0], s1, s2, in3);
    and and_4(and_gate[4], s0, not_s[1], not_s[2], in4);
    and and_5(and_gate[5], s0, not_s[1], s2, in5);
    and and_6(and_gate[6], s0, s1, not_s[2], in6);
    and and_7(and_gate[7], s0, s1, s2, in7);
    
    or or_0(y, and_gate[0], and_gate[1], and_gate[2], and_gate[3], and_gate[4], and_gate[5], and_gate[6], and_gate[7]);
    
endmodule
