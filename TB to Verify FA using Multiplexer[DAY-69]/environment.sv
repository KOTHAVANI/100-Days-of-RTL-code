//environment.sv
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"

class environment;

generator gen;
driver drv;
mailbox mbox;
virtual fulladder_if vif;

  function new(virtual fulladder_if vif);
this.vif=vif;
mbox =new();
gen=new(mbox);
drv=new(vif,mbox);
endfunction


task run();
fork
gen.run();
drv.run();
join
endtask
endclass
