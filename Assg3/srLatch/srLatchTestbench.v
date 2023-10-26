module srLatchTestbench;
    
    reg s;
    reg r;
    wire q;
    wire qNot;
    
    srLatch testbench (
   	 .s(s),
   	 .r(r),
   	 .q(q),
   	 .qNot(qNot)
    );
   	 
    initial begin
     s=1; r=0; #5
	s=0; r=0; #5
	s=0; r=1; #5
	s=0; r=0; #5
	s=1; r=1; #5
    
    $finish;
    end

endmodule
