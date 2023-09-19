module one_eight_demux(
    output y0,
    output y1,
    output y2,
    output y3,
    output y4,
    output y5,
    output y6,
    output y7,
	 input a,
    input s0,
    input s1,
    input s2
);

    wire [2:0] not_s;
    wire [7:0] and_gate;
    
/*  assign not_s[0]=-(s0);
	 assign not_s[1]=-(s1);
	 assign not_s[2]=-(s2);*/
	 
    not not_0(not_s[0], s0);
    not not_1(not_s[1], s1);
    not not_2(not_s[2], s2);
    
    and and_0(and_gate[0], not_s[0], not_s[1], not_s[2], a);
    and and_1(and_gate[1], not_s[0], not_s[1], s2, a);
    and and_2(and_gate[2], not_s[0], s1, not_s[2], a);
    and and_3(and_gate[3], not_s[0], s1, s2, a);
    and and_4(and_gate[4], s0, not_s[1], not_s[2], a);
    and and_5(and_gate[5], s0, not_s[1], s2, a);
    and and_6(and_gate[6], s0, s1, not_s[2], a);
    and and_7(and_gate[7], s0, s1, s2, a);
	 
	 assign y0=and_gate[0];
	 assign y1=and_gate[1];
	 assign y2=and_gate[2];
	 assign y3=and_gate[3];
	 assign y4=and_gate[4];
	 assign y5=and_gate[5];
	 assign y6=and_gate[6];
	 assign y7=and_gate[7];

	 
	 
endmodule
