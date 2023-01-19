module Sync_Counter( clock, reset, Up_Down, Count );

input clock, reset, Up_Down;
output [3:0] Count;
reg [3:0] Count = 0;

always @ ( posedge clock )
begin
if(reset == 1)
Count <= 0;
else
if (Up_Down == 1)  //Up Counter
Count <= Count + 1'b1;
else               //Down Counter
Count <= Count - 1'b1;
end

endmodule 
