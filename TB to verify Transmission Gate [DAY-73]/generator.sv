class generator;
transaction tr;
mailbox mbox;
function new(mailbox mbox);
this.mbox= mbox;
endfunction
task run();
  repeat(20) begin
tr=new();
tr.randomize();

    $display("A=%b Control=%b", tr.a,tr.control);
    
mbox.put(tr);
end
endtask
endclass
