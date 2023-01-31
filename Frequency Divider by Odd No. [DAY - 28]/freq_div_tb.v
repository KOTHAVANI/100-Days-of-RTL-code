module freq_div_odd_tb();

 reg clk_in;
 wire clk_out;

freq_div_odd dut(.clk_in(clk_in), .clk_out(clk_out));

initial
begin
  clk_in=1;
end
 
always #10 clk_in= ~clk_in;
      
endmodule
