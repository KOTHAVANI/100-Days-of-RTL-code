module Factorial_tb(); 

parameter N = 5;

reg [N:0] in;
wire [N*8:0] factorial_out;

Factorial dut( .in(in), .factorial_out(factorial_out) );

initial
begin
$monitor (" in = %d, factorial_out = %d ", in, factorial_out );
end

initial
begin
 in = 2;
 #10;
 in = 10;
 #10;
 in = 13;
 #10;
 in = 9;
 #10;
 in = 4;
 #10;
 in = 8;
 #10;
 in = 3;
 #10;
 in = 15;
 #10;
end

endmodule
