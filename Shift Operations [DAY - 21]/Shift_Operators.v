module Shift_Operators ( in, sel, out );

input [3:0] in;
input [1:0] sel;
output reg [3:0] out;
wire [3:0] in;
wire [1:0] sel;

always @ (in or sel)
begin
case ( sel )
  2'b00 : out = in << 1;  //Logical left shift
  2'b01 : out = in >> 1;  //Logical right shift
  2'b10 : out = in <<< 1; //Arithmetic left shift
  2'b11 : out = in >>> 1; //Arithmetic right shift
default : out = 4'b0000;
endcase
end
endmodule  
