module multiplier (
  input [3:0] a,
  input [3:0] b,
  output [7:0] c
);

  wire [3:0] multipliedB0, multipliedB1, multipliedB2, multipliedB3;
  wire [3:0] shiftedB1, shiftedB2, shiftedB3;
  wire [8:0] sumB0_B1, sumB2_B3, sumB01_B23;

  multiply m0 (.a(a), .b(b[0]), .y(multipliedB0));
  multiply m1 (.a(a), .b(b[1]), .y(multipliedB1));
  multiply m2 (.a(a), .b(b[2]), .y(multipliedB2));
  multiply m3 (.a(a), .b(b[3]), .y(multipliedB3));

  assign shiftedB1 = {2'b00, multipliedB1};
  assign shiftedB2 = {1'b0, multipliedB2, 1'b0};
  assign shiftedB3 = {multipliedB3, 2'b00};

  fourBitAdder fa0 (.a(multipliedB0), .b(shiftedB1), .sum(sumB0_B1[3:0]), .cout(sumB0_B1[4]));
  fourBitAdder fa1 (.a(sumB0_B1[3:0]), .b(shiftedB2), .sum(sumB2_B3[3:0]), .cout(sumB2_B3[4]));
  fourBitAdder fa2 (.a(sumB2_B3[3:0]), .b(shiftedB3), .sum(sumB01_B23[3:0]), .cout(sumB01_B23[4]));

  assign c = sumB01_B23[7:0];

endmodule


module fourBitAdder(
  input [3:0] a,
  input [3:0] b,
  output [3:0] sum,
  output cout
);

  wire [2:0] c;
  wire [4:0] s;

  halfAdder ha0 (a[0], b[0], s[0], c[0]);
  fullAdder fa0 (a[1], b[1], c[0], s[1], c[1]);
  fullAdder fa1 (a[2], b[2], c[1], s[2], c[2]);
  fullAdder fa2 (a[3], b[3], c[2], s[3], cout);

  assign sum = s;

endmodule

module halfAdder (
  input wire a,
  input wire b,
  output wire s,
  output wire cout
);

  assign s = a ^ b;
  assign cout = a & b;

endmodule

module fullAdder (
  input wire a,
  input wire b,
  input wire cin,
  output wire s,
  output wire cout
);

  wire aXorb;
  wire bAndb;
  wire cinAndaXorb;

  assign aXorb = a ^ b;
  assign s = aXorb ^ cin;

  assign bAndb = a & b;
  assign cinAndaXorb = cin & aXorb;
  assign cout = bAndb | cinAndaXorb;

endmodule

module multiply(
  input wire [3:0] a,
  input wire b,
  output wire [3:0] y
);

  assign y[0] = a[0] & b;
  assign y[1] = a[1] & b;
  assign y[2] = a[2] & b;
  assign y[3] = a[3] & b;

endmodule
