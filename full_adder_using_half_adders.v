module half_adder(
    input a,
    input b,
    output sum,
    output carry
);	
    xor xor_1(sum,a,b);
    and and_1(carry,a,b);
endmodule

module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    wire sum_0, carry_0, carry_1;
    half_adder ha0(.a(a), .b(b), .sum(sum_0), .carry(carry_0));
    half_adder ha1(.a(cin), .b(sum_0), .sum(sum), .carry(carry_1));
    or or_0(cout, carry_0, carry_1);
    
endmodule
    
module full_addder_using_half(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output finalcarry
);
    wire [3:0] carry;
    full_adder add1 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(carry[0]));
    full_adder add2 (.a(a[1]), .b(b[1]), .cin(carry[0]), .sum(sum[1]), .cout(carry[1]));
    full_adder add3 (.a(a[2]), .b(b[2]), .cin(carry[1]), .sum(sum[2]), .cout(carry[2]));
    full_adder add4 (.a(a[3]), .b(b[3]), .cin(carry[2]), .sum(sum[3]), .cout(finalcarry));

endmodule
