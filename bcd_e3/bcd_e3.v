module bcd_e3(
    input [3:0] a,
    output [3:0] e3
);

    wire not_b, not_cord;
    wire and_candd, and_b_notcord, and_notb_cord, and_b_cord;
    wire or_cord;

    and and0 (and_candd, a[1], a[0]);
    or or0 (or_cord, a[1], a[0]);

    not not0 (e3[0], a[0]);
    not not1 (not_b, a[1]);
    not not2 (not_cord, or_cord);

    and and1 (and_b_notcord, not_b, not_cord);
    and and2 (and_notb_cord, a[2], or_cord);

    or or1 (e3[1], and_b_notcord, and_notb_cord);

    and and3 (and_b_cord, a[3], or_cord);

    or or2 (e3[2], and_b_cord, a[2]);
    or or3 (e3[3], and_b_cord, a[3]);

endmodule
