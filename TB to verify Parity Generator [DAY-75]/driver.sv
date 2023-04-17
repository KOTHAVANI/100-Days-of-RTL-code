class driver;
virtual par_gen_if vif;
mailbox mbox;
transaction tr;
  function new(virtual par_gen_if vif, mailbox mbox);
tr=new();
this.vif = vif;
this.mbox = mbox;
endfunction

task run();
forever begin
mbox.get(tr);
vif.x=tr.x;
vif. y=tr.y;
  vif. z=tr.z;
# 5;
tr. result=vif. result;
  $display("result=%d", tr.result);
end
endtask
endclass
