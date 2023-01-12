module Half_Subtractor( A, B, Difference, Borrow );

input A, B;
output  Difference, Borrow;
reg Difference, Borrow;

always @( A or B )
  begin
       Difference = A ^ B;
       Borrow = (~A)&(B);
  end 
  
endmodule

module Full_Adder_HS( A, B, C, Sum, Carry);

input A, B, C;
output Sum, Carry;
wire w1, w2, w3, w4, w5;

not bf1(w4,A);
not bf4(Sum,w5);

Half_Subtractor hs1(.A(w4), .B(B), .Difference(w1), .Borrow(w2));
Half_Subtractor hs2(.A(w1), .B(C), .Difference(w5), .Borrow(w3));

or or1(Carry,w3,w2);

endmodule
