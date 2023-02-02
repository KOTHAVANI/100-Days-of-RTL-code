module Greatest_Common_Divisor_tb();

parameter W=7;
reg [W-1:0] A;
reg [W-1:0] B;
wire [W-1:0] GCD;
integer i;

Greatest_Common_Divisor dut(.A(A), .B(B), .GCD(GCD));

initial
begin
{A, B} = 0;
#10;
for(i = 0; i<30; i =i+1)
begin
A = $random;
B = $random;
#10;
end
end

initial
begin
$monitor("A= %d, B=%d, GCD=%d", A, B, GCD);
#200 $finish;
end

endmodule
