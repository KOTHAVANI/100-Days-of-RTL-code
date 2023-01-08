module T_FF_tb();
reg t,clk;
wire q, qb;


T_FF dut(.qb(qb), .q(q), .t(t),  .clk(clk)); 


initial
$monitor("clk = %b, t = %b, q = %b, qb = %b", clk, t, q, qb);


initial 
begin
  clk=0;
     forever #2 clk = ~clk;  
end 

initial
 begin 
 t = 0;
 #5
 t = 1;
 #5
 t = 0;
 #5
 t = 1;
 #5
 
$finish();  
 end 
endmodule
