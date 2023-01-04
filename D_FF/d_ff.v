module d_ff(clock,d_in,q,qb);
input d_in,clock;
output reg q;
output qb;

always@(posedge clock)
begin
q <= d_in;
end
assign qb = ~q;
endmodule
