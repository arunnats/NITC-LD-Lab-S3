//`timescale 1ns/1ps;
module d_LatchTestbench();
reg d;
reg preset;
reg clear'
wire q;

d_Latch testbench(.d(d),.preset(preset),.clear(clear),.q(q));
 
initial begin  
 preset=1;
 d <= 0;
 #20;
 d <= 1;
 #20;
 d <= 0;
 #20;
 d <= 1;
 #20;
 preset=0;
 #20;
 d <=1;
 preset=1;
 #20;
 d <= 0;
 #20;
 d <= 1;
 #20 $finish;
end
endmodule