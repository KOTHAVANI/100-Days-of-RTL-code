// Code your design for half subtractor
module HS(a, b, borrow, difference);
  
input a,b;
output borrow, difference;
  
assign difference = a^b;
assign borrow =~a & b; 
  
endmodule
