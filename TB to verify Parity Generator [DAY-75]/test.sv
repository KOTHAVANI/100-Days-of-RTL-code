//test.sv
`include "environment.sv"

program test(par_gen_if vif);
environment env;
  
initial begin
  env=new(vif);
  env.run();
end
  
endprogram
