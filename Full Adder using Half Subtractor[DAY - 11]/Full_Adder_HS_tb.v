module Full_Adder_HS_tb();
reg A,B,C;
wire Sum, Carry;
integer i;

Full_Adder_HS dut(.A(A), .B(B), .C(C), .Sum(Sum), .Carry(Carry));

task initialize;
{A, B, C} = 0;
endtask

task stimulus;
begin
for(i=0; i<=8; i=i+1)
begin
#10; 
{A, B, C} = i;
end
end
endtask

initial
begin
initialize;
stimulus;
$finish();
end

initial
$monitor($time, " A = %b, B = %b, C = %b, Sum = %b, Carry = %b", A, B, C, Sum, Carry);

endmodule

