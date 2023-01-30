module BCD_Adder ( Addend, Augend, Carry_in, Sum, Carry_out );

parameter N = 4;

input [N-1:0] Addend, Augend;
input Carry_in;
output reg [N-1:0] Sum;
output reg Carry_out;
reg [N+1:0] temp;

always @ ( Addend | Augend | Carry_in )
begin
temp = Addend + Augend + Carry_in;

if (temp > 4'b1001)
begin
temp = temp+4'b0110;
Carry_out = 1'b1;
Sum = temp [N-1:0];
end

else 
begin
Carry_out = 1'b0;
Sum = temp[N-1:0];
end

end

endmodule 
