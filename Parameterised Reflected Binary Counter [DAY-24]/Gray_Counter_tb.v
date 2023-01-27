module Gray_Counter_tb();

parameter N_Bits = 5;
reg Clock, Clear;
wire [1:N_Bits] q, q_bar;

Gray_Counter dut(.Clock(Clock), .Clear(Clear), .q(q), .q_bar(q_bar));

always #5 Clock = ~Clock;

initial
begin
Clock = 1'b0;
Clear = 1'b1;
#10;
Clear = 1'b0;
end

initial
begin
$monitor (" Clear = %b, q = %b, q_bar = %b", Clear, q, q_bar);
end

endmodule
