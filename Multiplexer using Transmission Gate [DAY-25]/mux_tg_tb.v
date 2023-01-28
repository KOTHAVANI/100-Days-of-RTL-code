module mux_tg_tb();

reg I0, I1, Sel;
wire y_out;
integer i;

mux_tg dut(.I0(I0), .I1(I1), .Sel(Sel), .y_out(y_out));

initial
begin
{I0, I1, Sel} = 0;
end

initial
begin
for(i=0; i<=8; i=i+1)
begin 
{I0, I1, Sel} = i;
#10;
end
end

initial
begin
$monitor (" I0 = %b, I1 = %b, Sel = %b, y_out = %b", I0, I1, Sel, y_out);
end


endmodule
