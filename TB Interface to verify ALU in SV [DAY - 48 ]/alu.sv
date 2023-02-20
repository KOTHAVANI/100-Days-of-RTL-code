// deesign for alu
module alu(
  input  [3:0] a  ,
  input  [3:0] b  ,
  output [6:0] c    ,
  output [6:0] d    ,
  output [6:0] e  ,
  output [6:0] f  ,
  output [6:0] g  ,
  output [6:0] h  ,
  output [6:0] i  ,
  output [6:0] j  ,
  output [6:0] k  ,
  output [6:0] l   ,
  output [6:0] m  ,
  output [6:0] n    ); 
    
  assign c = a + b;
  assign d = a - b;
  assign e = a * b;
  assign f = a / b;
  assign g = a << 1;
  assign h = a >> 1;
  assign i = a & b;
  assign j = a | b;
  assign k = a ^ b;
  assign l = ~(a | b);
  assign m = ~(a & b);
  assign n = ~(a ^ b);

endmodule
