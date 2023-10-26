module sixteenBitDecrementerTestbench;

    reg [15:0] a;
    wire [16:0] b;
    
    sixteenBitDecrementer testbench (
   	 .a(a),
   	 .b(b)
    );
    
    integer i;
    initial begin
        for (i = 0; i < 65536; i = i + 1) begin
     	   a=i;
   		   #10;
   	end
    $finish;
    end

endmodule
