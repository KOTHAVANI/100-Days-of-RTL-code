module mux_tg ( I0, I1, Sel, y_out );

input I0, I1, Sel;
output  y_out;
wire w1;
not (w1,Sel);

Transmission_Gate f1( .A(I0), .Control(w1), .out(y_out) );
Transmission_Gate f2( .A(I1), .Control(Sel), .out(y_out) );

endmodule



module Transmission_Gate ( A, Control, out );

input A, Control;
output reg out;

always @ (A or Control )
begin
if (Control == 1)
out = A;
else
out = 1'bz;
end

endmodule
