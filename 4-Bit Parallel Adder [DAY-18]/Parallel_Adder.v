module Full_Adder(a,b,cin,sum,carry);

input a,b,cin;
output  sum,carry;

assign sum=a^b^cin;
assign carry=(a & b) | cin & (a ^ b);

endmodule

module Parallel_Adder(A,B,Cin,Sum,Carry);
 
input [3:0]A;
input [3:0]B;
input Cin; 
output  [3:0]Sum;
output  [3:0]Carry;
 
Full_Adder fa1(.a(A[0]), .b(B[0]), .cin(Cin), .sum(Sum[0]), .carry(Carry[0]));
Full_Adder fa2(A[1],B[1],Carry[0],Sum[1],Carry[1]);
Full_Adder fa3(A[2],B[2],Carry[1],Sum[2],Carry[2]); 
Full_Adder fa4(A[3],B[3],Carry[2],Sum[3],Carry[3]);
 
endmodule
