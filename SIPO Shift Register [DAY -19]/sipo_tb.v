module sipo_tb();

reg clk,sin;
wire [3:0] pout;

sipo dut(.clk(clk), .sin(sin),.pout(pout) );

initial
begin
$monitor($time,"sin = %b, pout = %b",sin,pout);
end

initial 
begin

clk = 0;
sin = 0;

#10 sin=1'b1;

#10 sin=1'b0;

#10 sin=1'b1;

#10 sin=1'b0;

#10 sin=1'b1;

#10 sin=1'b0;

end

always #5 clk = ~clk;

endmodule

