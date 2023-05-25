// Write an Assertion for the following condition
//The signal A should change on every posedge of the clock and  it should be stable during negedge of the clock
module ass;
  
  bit clk, a;  
  always #5 clk = ~clk; //clock generation 
  
  initial begin 
         a = 1; 
    #25; a = 0;
    #10; a = 1;
    #20; a = 1;
    #10;
    $finish;
  end 
  
  sequence seq_1;
    @(posedge clk) $changed(a);
  endsequence  
  
  sequence seq_2;
    @(negedge clk) $stable(a);
  endsequence  
      
  //calling assert property
    a_1 : assert property(seq_1);
    a_2: assert property(seq_2);
      
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end    
      
endmodule
