module Minority_Detector_tb();
reg a,b,c;
wire f;
integer i;
Minority_Detector dut(a,b,c,f);
initial
begin 
a=1'b0;
b=1'b0;
c=1'b0;
end
initial
begin
for(i=0;i<8;i=i+1)
begin
{a,b,c}=i;
#10;
end
end
initial
$monitor(" input a=%b b=%b c=%b  f=%b",a,b,c,f);
initial #100 $finish();
endmodule
