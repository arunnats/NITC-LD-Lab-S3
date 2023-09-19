module four_bit_half_adder(
    input [3:0] a,
    input [3:0] b,
    output [3:0] sum,
    output [3:0] carry
);
    wire [3:0] carry_bits;
    wire [3:0] sum_bits;

    half_adder ha0 (.a(a[0]), .b(b[0]), .sum(sum_bits[0]), .carry(carry_bits[0]));
    half_adder ha1 (.a(a[1]), .b(b[1]), .sum(sum_bits[1]), .carry(carry_bits[1]));
    half_adder ha2 (.a(a[2]), .b(b[2]), .sum(sum_bits[2]), .carry(carry_bits[2]));
    half_adder ha3 (.a(a[3]), .b(b[3]), .sum(sum_bits[3]), .carry(carry_bits[3]));

    assign sum = sum_bits;
    assign carry = carry_bits;
endmodule


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

