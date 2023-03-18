//code your test case for half subtractor
//test.sv
`include "environment.sv"

program test(hs_if vif);
environment env;
  
initial begin
  env=new(vif);
  env.run();
end
  
endprogram
