module and_gate_test;
	reg [7:0]in1, in2;
	wire [7:0]out1; 
	and_gate_8bit g1(out1, in1, in2);
	integer count1, count2;
	initial begin
		for(count1=0; count1<255; count1=count1+1) begin 
			for(count2=0; count2<255; count2=count2+1) begin 
				in1 = count1; 
				in2 = count2; 
				#10; 
			end 
		end 
	end
endmodule