module buffer_register(d,clock,q0,q1,q2,q3);
input [0:3]d;
input clock;
output  wire q0,q1,q2,q3;
wire qb0,qb1,qb2,qb3;
d_ff df0(d[0],clock,q0,qb0);
d_ff df1(d[1],clock,q1,qb1);
d_ff df2(d[2],clock,q2,qb2);
d_ff df3(d[3],clock,q3,qb3);
endmodule

module d_ff(d,clock,q,qb);
input d,clock;
output reg q;
output qb;

always@(posedge clock)
begin
q <= d;
end
assign qb = ~q;
endmodule
