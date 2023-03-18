//generator.sv
class generator;
  
transaction tr;
mailbox mbox;
  
function new(mailbox mbox);
this.mbox= mbox;
endfunction
  
task run();
  repeat(6) begin
tr=new();
tr.randomize();
$display("A=%d B=%d", tr.a, tr.b);
mbox.put(tr);
end
endtask
  
endclass
