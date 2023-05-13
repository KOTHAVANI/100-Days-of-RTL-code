// Code your testbench here
class packet;
  
  rand bit [3:0] addr;
  rand bit [3:0] data;
  
  constraint data_range {soft data > 0; data < 10 ; }                          
  
endclass

module inline_constraint_ex;
  
  initial begin
    packet pkt;
    pkt = new();
    repeat(5) begin
      pkt.randomize();
      $display("Before inline constraint:  data = %0d", pkt.data);
     
      if(!pkt.randomize() with { data == 9;})
     $display("randomization failed"); 
      
      $display("After inline constraint:  data = %0d", pkt.data);
    end
    end
  
endmodule
