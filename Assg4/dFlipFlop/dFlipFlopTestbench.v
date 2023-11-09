module dFlipFlopTestbench();
    reg d;
    reg clk;
    reg reset;
    wire q;

    dFlipFlop testbench(d,clk,reset,q);

    initial begin
        clk = 0;
        forever #10 clk = ~clk;  
    end

    initial begin
        reset = 1;
        d = 0;
        #20 
		  d = 1;    
        #20 
		  d = 0;
        #20
		  d = 1;
        #20;
		  reset = 0; 
        #20 
		  d = 1;    
        #20 
		  d = 0;
        #20
		  d = 1;
        #20;
		  reset = 1; 
        #20 
		  d = 1;    
        #20 
		  d = 0;
        #20
		  d = 1;
        #100 $finish;
    end
	 
endmodule
