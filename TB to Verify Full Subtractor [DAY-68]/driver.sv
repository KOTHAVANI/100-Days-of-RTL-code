//driver.sv
class driver;
virtual fs_if vif;
mailbox mbox;
transaction tr;
  function new(virtual fs_if vif, mailbox mbox);
tr=new();
this.vif = vif;
this.mbox = mbox;
endfunction

task run();
forever begin
mbox.get(tr);
vif.a=tr.a;
vif. b=tr.b;
vif.bin=tr.bin;
# 5;
tr. difference=vif. difference;
tr.borrow=vif.borrow;
  $display("difference=%d borrow=%d ", tr.difference, tr.borrow);
end
endtask
endclass
