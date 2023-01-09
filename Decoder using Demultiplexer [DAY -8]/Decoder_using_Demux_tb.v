module Decoder_using_Demux_tb();
reg a,b,c;
wire [0:7]out;
integer i;
  
Decoder_using_Demux dut(a,b,c,out);

initial
$monitor(" a= %b, b = %b, c = %b, out = %b", a, b, c, out );

initial
begin
for(i=0;i<8;i=i+1)
begin
{a,b,c}=i;
#10;
end
#100 $finish;
end
endmodule
