module T_FF(clk,t,q,qb);
input t,clk;
output reg q;
output qb;

always@(posedge clk)
begin
q <= (~t);
end
assign qb = ~q;
endmodule
