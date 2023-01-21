module Parallel_Adder_tb();
 
wire [3:0]Sum;
wire [3:0]Carry;
reg [3:0]A;
reg [3:0]B;
reg Cin;
 
Parallel_Adder dut(.Sum(Sum), .A(A), .B(B), .Carry(Carry), .Cin(Cin) );
 
initial
begin
 
$monitor( "A = %b, B = %b, Cin = %b, Sum = %b, Carry = %b",A, B ,Cin, Sum, Carry); 
 
A = 4'b1101; 
B = 4'b1001; 
Cin = 1'b0;

#20;

A = 4'b1111; 
B = 4'b1101;
Cin = 1'b1;
 
end
 
endmodule
