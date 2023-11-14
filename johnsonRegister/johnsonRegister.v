module johnsonRegister(
  output reg [2:0] out,
  input clk,
  input clear
);

  always @(posedge clk or posedge clear) begin
   if(clear) begin
		out <= 3'b001;
	end else begin
		out <= {out[1:0],~out[2]}  ;
	end
	end

endmodule
