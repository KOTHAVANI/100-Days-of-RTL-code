module d_ff_tb();
reg d_in,clock;
wire q, qb;


d_ff dut(.qb(qb), .q(q), .d_in(d_in),  .clock(clock)); 


initial
  $monitor("simtime = %t, clock = %b, d_in = %b, q = %b, qb = %b", $time, clock, d_in, q, qb);


initial 
begin
  clock=0;
     forever #2 clock = ~clock;  
end 

initial
 begin 
 d_in = 0;
 #5
 d_in = 1;
 #5
 d_in = 0;
 #5
 d_in = 1;
 #5
 
$finish();  
 end 
endmodule
