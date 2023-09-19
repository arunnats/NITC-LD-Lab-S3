module full_adder(input a, b, carry_in, output sum, carry_out);
    xor_gate and_inst (.in1(a), .in2(b), .in3(carry_in), .y(xor_out));
	 and_gate and_inst1 (.in1(a), .in2(b), .y(and_out_1));
	 and_gate and_inst2 (.in1(a), .in2(carry_in), .y(and_out_2));
	 and_gate and_inst3 (.in1(b), .in2(carry_in), .y(and_out_3));
	 or_gate or_inst (.in1(and_out_1), .in2(and_out_2), .in3(and_out_3), .y(or_out));
    assign sum = xor_out;
	 assign carry_out = or_out;

endmodule

module or_gate (
    input in1,
    input in2,
	 input in3,
    output y
);

	 assign y = in1 | in2 | in3;
endmodule

module xor_gate (
    input in1,
    input in2,
	 input in3,
    output y
);

    assign y = in1 ^ in2 ^ in3;
endmodule

module and_gate (
    input in1,
    input in2,
    output y
);

	 assign y = in1 & in2;
endmodule