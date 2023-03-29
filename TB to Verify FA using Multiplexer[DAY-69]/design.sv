
// Code your design for full adder using multiplexer
module multiplexer(a,b,s,y);
input a,b,s;
output y;
assign y=~s&a|s&b;
endmodule

module fulladder(A,B,Cin,SUM,CARRY);
input A,B,Cin;
output SUM,CARRY;
wire w1,w2,w3;
  multiplexer mu1(A,(~A),B,w1);
  multiplexer mu2(Cin,(~Cin),w1,SUM);
  multiplexer mu3(1'b0,w1,Cin,w2);
  multiplexer mu4(1'b0,A,B,w3);
  multiplexer mu5(w2,w3,w3,CARRY);
endmodule
