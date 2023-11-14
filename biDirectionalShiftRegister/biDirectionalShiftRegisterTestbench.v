module biDirectionalShiftRegisterTestBench;
    reg clk;
    reg reset;
    reg dataIn;
	 reg direction;
    wire [7:0] out;

    biDirectionalShiftRegister tb (
        .clk(clk),
        .reset(reset),
        .dataIn(dataIn),
        .out(out),
		  .direction(direction)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    // Apply test vectors to the shift_register
    initial begin
        reset = 1;
		  direction = 1;
        #20 dataIn = 0; 
        #20 dataIn = 1;
		  direction = 0;
        #20 dataIn = 0;
        #20 dataIn = 1;
        #20 dataIn = 1;
		  direction = 1;
        #20 dataIn = 0;
		  #20 dataIn = 0;
        #20 dataIn = 1;
		  #20 dataIn = 1;
		  #20 reset = 0;
        #20 reset = 1;
		  direction = 0;
		  #20 dataIn = 0;
        #20 dataIn = 0;
		  direction = 1;
        #20 dataIn = 1;
        #20 dataIn = 0;
        #20 dataIn = 1;
		  #20 dataIn = 1;
        #20 dataIn = 0;
		  direction = 0;
        #20 dataIn = 0;
        #20 dataIn = 1;
        #20 dataIn = 0;
		  direction = 1;
        #20 dataIn = 0;
        #20 dataIn = 0;
        #20 dataIn = 0;
        #20 dataIn = 1;
        #20 $finish;  // End the simulation
    end
endmodule
