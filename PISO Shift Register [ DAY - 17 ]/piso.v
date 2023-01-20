module piso(clock,pin,sout,load);
input [3:0]pin;
input clock,load;
output reg sout;
reg [3:0]temp = 0;
always @(posedge clock)
begin
if(load)
temp<=pin;
else
begin
sout<=temp[3];
temp<={temp[2:0],1'b0};
end
end
endmodule
