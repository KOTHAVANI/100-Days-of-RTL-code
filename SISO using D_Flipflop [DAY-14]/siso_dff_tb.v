module siso_dff_tb();
reg clk;
reg sin;
wire sout;

siso_dff dut(.clk(clk), .sin(sin), .sout(sout));

initial
begin
$monitor("sin = %b, sout = %b",sin,sout);
end

initial
begin
clk = 0;
sin =0;
#10 sin=1'b1;
#10 sin=1'b0;
#10 sin=1'b1;
end

always #5 clk = ~clk;

initial $finish();

endmodule
