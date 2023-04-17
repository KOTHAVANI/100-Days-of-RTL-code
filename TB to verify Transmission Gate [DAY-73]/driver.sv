class driver;
virtual transmissiongate_if vif;
mailbox mbox;
transaction tr;
  function new(virtual transmissiongate_if vif, mailbox mbox);
tr=new();
this.vif = vif;
this.mbox = mbox;
endfunction

task run();
forever begin
mbox.get(tr);

vif.a=tr.a;
vif.control=tr.control;
# 5;
tr.y=vif.y;

  $display("Output =%b ", tr.y);
end
endtask
endclass
