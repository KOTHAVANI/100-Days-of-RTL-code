module binary2gray (b1, b2, b3, b4, g1, g2, g3, g4);

input b1, b2, b3, b4;
output g1, g2, g3, g4;

buf gate1 (g1, b1);
xor gate2 (g2, b1, b2);
xor gate3 (g3, b2, b3);
xor gate4 (g4, b3, b4);

endmodule
