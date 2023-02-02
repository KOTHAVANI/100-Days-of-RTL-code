module Greatest_Common_Divisor ( A, B, GCD );

parameter W = 7;
input [W-1:0] A, B;
output  [W-1:0] GCD;
reg [W-1:0] Ain, Bin, GCD;

always @(A or B)
begin
Ain = A; Bin = B;
while( Ain != Bin)
begin
if ( Ain < Bin )
Bin = Bin-Ain;
else
Ain = Ain - Bin;
end
GCD = Ain;
end

endmodule
