// Code your design for half subtractor
module HS(a, b, borrow, difference);
  
input a,b;
output borrow, difference;
  
assign borrow = a^b;
assign difference =~a & b; 
  
endmodule
