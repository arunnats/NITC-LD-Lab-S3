module srLatch (
    input wire S,
    input wire R,
    output wire Q,
    output wire ~Q
);

  wire nS, nR, and1, and2, or1, or2;

  // Create the complement (inverted) signals
  assign nS = ~S;
  assign nR = ~R;

  // Implement SR latch using primitive gates
  and and_1 (and1, nR, Q);
  and and_2 (and2, nS, ~Q);
  or or_1 (or1, Q, ~Q);
  or or_2 (or2, Q, ~Q);

endmodule