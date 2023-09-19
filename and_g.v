module Verilog_Ld_Lab(input a, b, carry_in, output sum, carry_out);
		  xor_gate xor_inst (.a(a), .b(b), .c(carry_in), .y(xor_out));
        assign sum = xor_out;

endmodule	

module half_adder(input a, b, output sum, carry);
    wire and_out, xor_out;

    and_gate and_inst (.a(a), .b(b), .y(and_out));
    xor_gate xor_inst (.a(a), .b(b), .y(xor_out));

    assign sum = xor_out;
    assign carry = and_out;
endmodule

module and_gate (
    input a,
    input b,
    output y
);

    assign y = a & b;
endmodule

module nand_gate (
    input a,
    input b,
    output y
);

    assign y = ~(a & b);
endmodule

module or_gate (
    input a,
    input b,
    output y
);

    assign y = a | b;
endmodule

module nor_gate (
    input a,
    input b,
    output y
);

    assign y = ~(a | b);
endmodule

module not_gate (
    input a,
    output y
);

    assign y = ~a;
endmodule

module xor_gate (
    input a,
    input b,
	 input c,
    output y
);

    assign y = a ^ b;
endmodule
