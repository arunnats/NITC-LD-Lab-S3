module bcd_e3_test();
    reg [3:0] a;
    wire [3:0] e3;

    bcd_e3 testbench (
        .a(a),
        .e3(e3),
    );
    
    integer i;
	 
    initial begin
		$display("a	e3");
		$monitor("%b %b", a, e3);
		for (i = 0; i < 2; i = i + 1) begin
			a=i;
			#10;
