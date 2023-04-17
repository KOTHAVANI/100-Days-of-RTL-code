//test.sv
`include "environment.sv"

program test(Seven_Segment_Display_if vif);
environment env;
  
initial begin
  env=new(vif);
  env.run();
end
  
endprogram
