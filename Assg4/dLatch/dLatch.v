module d_Latch (
   input d,
   input preset,
	input clear,
   output reg q
);
   always @ (preset or clear or d)
      if (!preset)
         q <= 1;
		else if (!clear)
         q <= 0;
      else
         q <= d;
endmodule
