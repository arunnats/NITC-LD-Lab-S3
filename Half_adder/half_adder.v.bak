module half_adder(input a, b, output sum, carry);
    wire and_out, xor_out;

    and_gate and_inst (.a(a), .b(b), .y(and_out));
    xor_gate xor_inst (.a(a), .b(b), .y(xor_out));

    assign sum = xor_out;
    assign carry = and_out;
endmodule

module xor_gate (
    input a,
    input b,
    output y
);

    assign y = a ^ b;
endmodule

module and_gate (
    input a,
    input b,
    output y
);

    assign y = a & b;
endmodule

