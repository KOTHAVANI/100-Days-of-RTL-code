//driver.sv
class driver;
virtual fulladder_if vif;
mailbox mbox;
transaction tr;
  function new(virtual fulladder_if vif, mailbox mbox);
tr=new();
this.vif = vif;
this.mbox = mbox;
endfunction

task run();
forever begin
mbox.get(tr);
vif.A=tr.A;
  vif.B=tr.B;
  vif.Cin=tr.Cin;

# 5;
tr.SUM=vif.SUM;
  tr.CARRY=vif.CARRY;

  $display("SUM = %b CARRY =%b ", tr.SUM, tr.CARRY);
end
endtask
endclass
