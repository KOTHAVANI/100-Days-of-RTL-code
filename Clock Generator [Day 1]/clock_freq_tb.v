`timescale 1ps/1ps
module clock_freq_tb();
  reg clock;
 
initial 
begin
clock = 0;
//repeat(10) #10 clock = ~clock;

end

always #10 clock = ~clock;


initial #500 $finish();
endmodule
