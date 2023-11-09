//`timescale 1ns/1ps;
module d_LatchTestbench();
reg d;
reg reset;
wire q;

d_Latch testbench(.d(d),.reset(reset),.q(q));
 
initial begin  
 reset=1;
 d <= 0;
 #20;
 d <= 1;
 #20;
 d <= 0;
 #20;
 d <= 1;
 #20;
 reset=0;
 #20;
 d <=1;
 reset=1;
 #20;
 d <= 0;
 #20;
 d <= 1;
 #20 $finish;
end
endmodule