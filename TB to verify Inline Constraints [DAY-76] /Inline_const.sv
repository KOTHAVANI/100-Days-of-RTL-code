// Code your testbench here
class packet;
  
  rand bit [3:0] addr;
  rand bit [3:0] data;
  
  constraint data_range { data == 0; }                          
  constraint addr_range {addr > 7 ; 
                         addr < 70;}
endclass

module inline_constraint_ex;
  
  initial begin
    packet pkt;
    pkt = new();
    repeat(5) begin
      pkt.randomize();
      $display("Before inline constraint: addr = %0d, data = %0d", pkt.addr, pkt.data);
      
      if(pkt.randomize with { addr == 10;})
        $display("randomization success");
     // if(!pkt.randomize() with { data == 9;})
     // $display("randomization failed"); 
      
      $display("After inline constraint: addr = %0d, data = %0d", pkt.addr, pkt.data);
    end
    end
  
endmodule
