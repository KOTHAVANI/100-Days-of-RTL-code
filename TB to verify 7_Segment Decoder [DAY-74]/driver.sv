class driver;
virtual Seven_Segment_Display_if vif;
mailbox mbox;
transaction tr;
  function new(virtual Seven_Segment_Display_if vif, mailbox mbox);
tr=new();
this.vif = vif;
this.mbox = mbox;
endfunction

task run();
forever begin
mbox.get(tr);
vif.bcd=tr.bcd;

# 5;
tr.segment=vif.segment;

  $display("Output = %b ", tr.segment);
end
endtask
endclass
