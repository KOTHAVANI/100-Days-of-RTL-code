module Sync_Counter_tb();

reg clock, reset, Up_Down;
wire [3:0] Count;

Sync_Counter dut(.clock(clock), .reset(reset), .Up_Down(Up_Down), .Count(Count));

initial
begin
clock = 0;
reset = 0;
Up_Down = 1;
#150;
Up_Down = 0;
#150;
reset = 1;
end

always #5 clock = ~clock;

initial
begin
$monitor (" reset = %b, Up_Down = %b, Count = %b", reset, Up_Down, Count);
end

endmodule
