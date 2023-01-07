module Minority_Detector(a,b,c,f);
input a,b,c;
output f;
wire w1,w2,w3;
//assign w1=~a&~b;
//assign w2=~b&~c;
//assign w3=~c&~a;
//assign f=w1|w2|w3;

assign w1=a&b;
assign w2=b&c;
assign w3=c&a;
assign f=~(w1|w2|w3);
endmodule
