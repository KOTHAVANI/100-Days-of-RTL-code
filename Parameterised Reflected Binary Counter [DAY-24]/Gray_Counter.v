module Gray_Counter(Clock, Clear, q, q_bar );

parameter N_Bits = 5;
input Clock, Clear;
output [1:N_Bits] q, q_bar;
reg [1:N_Bits] Counter, GrayCount;
integer i;

always@(posedge Clock)
begin
if (Clear == 1)
Counter <= 1'b0;
else
Counter <= Counter+1'b1;
end

always@(Counter)
begin
GrayCount[1] <= Counter[1];
for ( i=2; i<=N_Bits;i=i+1)
GrayCount[i] <= Counter[i-1] ^ Counter[i];
end

assign q = GrayCount;
assign q_bar = ~q;

endmodule
