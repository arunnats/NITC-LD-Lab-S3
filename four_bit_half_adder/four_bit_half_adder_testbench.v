module four_bit_half_adder_testbench;

    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] sum;

    four_bit_half_adder testbench (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        $display("a   b   sum");
        $monitor("%b %b %b", a, b, sum);

        for (a = 0; a < 16; a = a + 1) begin
            for (b = 0; b < 16; b = b + 1) begin
                #10; 
            end
        end

        $finish;
    end

endmodule
