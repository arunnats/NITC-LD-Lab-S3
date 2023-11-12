module dFlipFlopTestbench();
    reg d;
    reg clk;
    reg preset;
	 reg clear;
    wire q;

    dFlipFlop testbench(d,clk,preset,clear,q);

    initial begin
        clk = 0;
        forever #10 clk = ~clk;  
    end

    initial begin
        preset = 1;
		  clear = 1;
        d = 0;
        #20 
		  d = 1;    
        #20 
		  d = 0;
        #20
		  d = 1;
        #20;
		  clear = 0; 
        #20 
		  clear = 1; 
        #20 
		  d = 1;    
        #20 
		  d = 0;
        #20
		  d = 1;
        #20;
		  preset = 0; 
        #20 
		  preset = 1; 
        #20 
		  d = 1;    
        #20 
		  d = 0;
        #20
		  d = 1;
		  clear = 0; 
        #20 
		  clear = 1; 
        d = 0;
        #20 
		  d = 1;    
        #20 
		  d = 0;
        #20
		  d = 1;
        #20;
		  preset = 0; 
        #20 
		  preset = 1; 
        #20 
		  d = 1;    
        #20 
		  d = 0;
        #20
		  d = 1;
        #20;
		  clear = 0; 
        #20 
		  clear = 1; 
        #20 
		  d = 1;    
        #20 
		  d = 0;
        #20
		  d = 1;
        #100 $finish;
    end
	 
endmodule
