module Modulo_N_Counter (clock, clear, q, q_bar);

parameter N = 4;
parameter count = 16;

input clock, clear;

output [N-1:0] q, q_bar;
reg [N-1:0] counter;

always @ (posedge clock )
begin
if (clear )
begin
counter <= 0;
end
else
begin
counter <= (counter + 1) % count;
end
end

assign q = counter;
assign q_bar = ~counter;

endmodule
