module Shift_Operators_tb();

reg [3:0] in;
reg [1:0] sel;
wire [3:0] out;
integer i;

Shift_Operators dut(.in(in), .sel(sel), .out(out));

initial
$monitor("in = %b, sel = %b, out = %b ", in, sel, out);

initial
begin
{ in } = 1'b0;
#2;
{ in } = 4'b0110;
end

initial 
begin
for( i = 0; i < 4; i = i+1 )
begin
sel = i;
#5;
end
end

initial #100 $finish();

endmodule
