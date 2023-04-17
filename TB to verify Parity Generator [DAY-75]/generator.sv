class generator;
transaction tr;
mailbox mbox;
function new(mailbox mbox);
this.mbox= mbox;
endfunction
task run();
  repeat(10) begin
tr=new();
tr.randomize();

    $display("X=%d Y=%d Z=%d", tr.x, tr.y, tr.z);
    
mbox.put(tr);
end
endtask
endclass
