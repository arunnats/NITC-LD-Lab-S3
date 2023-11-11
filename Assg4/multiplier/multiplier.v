module multiplier (
  input [3:0] a,
  input [3:0] b,
  output [7:0] c
);

	wire [3:0] layer1, layer2, layer3;
	wire [3:0] multa0, multa1, multa2, multa3;
	wire [3:0] carry0, carry1, carry2;
	wire [7:0] product;
	
	multiply mult0(a,b[0],multa0);
	multiply mult1(a,b[1],multa1);
	multiply mult2(a,b[2],multa2);
	multiply mult3(a,b[3],multa3);
	
	halfAdder ha0(multa0[1],multa1[0],layer1[0],carry0[0]);
	fullAdder fa1(multa0[2],multa1[1],carry0[0],layer1[1],carry0[1]);
	fullAdder fa2(multa0[3],multa1[2],carry0[2],layer1[2],carry0[2]);
	halfAdder ha3(carry0[2],multa1[3],layer1[3],carry0[3]);
	
	halfAdder ha4(layer1[1],multa2[0],layer2[0],carry1[0]);
	fullAdder fa5(layer1[2],multa2[1],carry1[0],layer2[1],carry1[1]);
	fullAdder fa6(layer1[3],multa2[2],carry1[1],layer2[2],carry1[2]);
	fullAdder fa7(carry0[3],multa2[3],carry1[2],layer2[3],carry1[3]);

	halfAdder ha8(layer2[1],multa3[0],layer3[0],carry2[0]);
	fullAdder fa9(layer2[2],multa3[1],carry2[0],layer3[1],carry2[1]);
	fullAdder fa10(layer2[3],multa3[2],carry2[1],layer3[2],carry2[2]);
	fullAdder fa11(carry1[3],multa3[3],carry2[2],layer3[3],carry2[3]);
	
	assign product[0] = multa0[0];
	assign product[1] = layer1[0];
	assign product[2] = layer2[0];
	assign product[3] = layer3[0];
	assign product[4] = layer3[1];
	assign product[5] = layer3[2];
	assign product[6] = layer3[3];
	assign product[7] = carry2[3];
	
	assign c = product;
	
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
