module buffer_register_tb();
reg clock;
reg [0:3]d;
wire q0,q1,q2,q3;


buffer dut(.q0(q0), .q1(q1),  .q2(q2), .q3(q3), .d(d), .clock(clock)); 

initial 
begin
clock = 1'b0;
 forever #2 clock = ~clock;
end

initial
begin
$monitor("q0 = %b, q1 = %b, q2 = %b, q3 = %b, d= %b,", q0, q1, q2, q3, d);

  
     d = 4'b1101; 
	 
     #10;
	 
     d = 4'b1001;
 	 
  
 end 
endmodule
