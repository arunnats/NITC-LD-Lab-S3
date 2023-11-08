module srlatch_tb();
    reg s,r;
    wire qfinal,qbarfinal;
    
    srlatch uut (.s(s),.r(r),.qfinal(qfinal),.qbarfinal(qbarfinal));
    integer count;
    
    initial begin
    for (count=0;count<4;count=count+1)begin
   	 {s,r}=count;
   	 #20;
   	 end
    end
endmodule