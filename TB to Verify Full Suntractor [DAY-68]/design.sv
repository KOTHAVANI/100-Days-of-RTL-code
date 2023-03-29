// Code your design for full subtractor
module FS(a, b, bin, borrow, difference);
  
input a, b, bin;
output borrow, difference;
  
assign difference = a^b^bin;
assign borrow = (~a& bin) | (~a& b) | (b &bin); 
  
endmodule
