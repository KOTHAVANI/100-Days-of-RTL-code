//driver.sv
class driver;
  
virtual hs_if vif;
mailbox mbox;
transaction tr;
 
  function new(virtual hs_if vif, mailbox mbox);
tr=new();
this.vif = vif;
this.mbox = mbox;
endfunction

task run();
forever begin
mbox.get(tr);
vif.a=tr.a;
vif. b=tr.b;
# 5;
tr.borrow = vif.borrow;
tr.difference = vif.difference;
  $display("borrow = %d difference = %d ", tr.borrow, tr.difference);
end
endtask
  
endclass
