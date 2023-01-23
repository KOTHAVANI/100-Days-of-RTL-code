module D_FF( d_in, clock, reset, q, q_bar );
input clock, reset, d_in;
output q, q_bar;
reg q;

assign q_bar = q;

always @ ( posedge clock )
begin
if ( reset == 1'b1 )
begin
q <= 1'b0;
end
else
begin
q <= d_in;
end
end

endmodule
 

module Johnson_Counter( clock, reset, q);
input reset, clock;
output [3:0]q;
wire w1;

not a(w1,q[3]);

D_FF d1(.clock(clock), .reset(reset), .d_in(w1), .q(q[0]) );
D_FF d2(.clock(clock), .reset(reset), .d_in(q[0]), .q(q[1]) );
D_FF d3(.clock(clock), .reset(reset), .d_in(q[1]), .q(q[2]) );
D_FF d4(.clock(clock), .reset(reset), .d_in(q[2]), .q(q[3]) );

endmodule
