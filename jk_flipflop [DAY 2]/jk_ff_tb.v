module jk_ff_tb();
reg j,k, clk;
wire q, qbar;


jk_ff dut(.q(q), .qbar(qbar), .j(j), .k(k), .clk(clk)); 


initial
$monitor("simtime = %g, clk = %b, j = %b, k = %b, q = %b, qbar = %b", $time, clk, j, k, q, qbar);


initial 
begin
  clk=0;
     forever #10 clk = ~clk;  
end 

initial
 begin 
 j= 1; k= 0;
 #100; j= 0; k= 1; 
 #100; j= 0; k= 0; 
 #100; j= 1; k=1; 
 end 
endmodule
