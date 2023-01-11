module binary2gray_tb;

reg b1, b2, b3, b4;
wire g1, g2, g3, g4;
integer i;


binary2gray b2g(.b1(b1),.b2(b2),.b3(b3),.b4(b4),.g1(g1),.g2(g2),.g3(g3),.g4(g4));

initial
$monitor("{binary}=%b, {gray}=%b", {b1, b2, b3, b4}, {g1, g2, g3, g4});

initial
begin
   for (i=0; i<16; i=i+1)
    begin
    {b1, b2, b3, b4} = i ;
    #10;
end
end
endmodule
