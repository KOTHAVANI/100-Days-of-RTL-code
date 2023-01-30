module BCD_Adder_tb();

parameter N = 4;

reg [N-1:0] Addend, Augend;
reg Carry_in;
wire [N-1:0] Sum;
wire Carry_out;
integer i;
   
BCD_Adder dut(.Addend(Addend), .Augend(Augend), .Carry_in(Carry_in), .Sum(Sum), .Carry_out(Carry_out));
   
initial
begin
{Addend, Augend, Carry_in} = 0;
#10;
for(i = 0; i<8; i =i+1)
begin
{Addend} = {$random}%8;
{Augend} = {$random}%8;
#10;
end
end

initial
begin
$monitor (" Addend = %d, Augend = %d, Carry_in = %d, Carry_out = %d, Sum = %d,", Addend, Augend, Carry_in, Carry_out, Sum);
end
 
endmodule
