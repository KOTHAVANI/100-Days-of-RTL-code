module Johnson_Counter_tb();
reg reset, clock;
wire [3:0]q;

Johnson_Counter dut(.q(q), .reset(reset),  .clock(clock)); 


initial
$monitor("reset = %b, q= %b", reset, q);


initial 
begin
  clock = 1'b0;
     forever #5 clock = ~clock;  
end 

initial
 begin 
 reset = 1'b1;
 #10;
 reset = 1'b0;
 end 

endmodule
