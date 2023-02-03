module Factorial (in, factorial_out);

parameter N = 5;

input [N:0] in;
output [N*8:0] factorial_out;
reg [N*8:0] temp; // count the value until it decrease to 1 
reg [N*8:0] fact;

always@(in)
begin

if(in == 1'b1)
begin
fact = 1'b1;
end

else
begin
fact = in;
for( temp = in-1; temp != 1; temp = temp-1 )
fact = fact*temp;
end

end

assign factorial_out = fact;

endmodule
