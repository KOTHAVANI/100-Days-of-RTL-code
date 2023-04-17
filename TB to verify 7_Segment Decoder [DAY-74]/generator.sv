class generator;
//instantiating this transaction
transaction tr;
mailbox mbox;
function new(mailbox mbox);
this.mbox= mbox;
endfunction
task run();
  repeat(20) begin
tr=new();
tr.randomize();

    $display("Input = %b ", tr.bcd);
    
mbox.put(tr);
end
endtask
endclass
