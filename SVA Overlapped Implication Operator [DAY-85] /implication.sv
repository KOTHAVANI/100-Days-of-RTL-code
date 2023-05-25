module impli_aser;
  
  bit clk,a,b;  
  
  always #5 clk = ~clk; //clock generation  
  
  initial begin 
        a=1; b=1; 
    #15 a=0; b=0;
    #10 a=1; b=0; 
    #10 a=0; b=0;
    #10 a=1; b=1;
    #10;
    $finish;
  end  
  
  sequence seq_1;
    a ##1 b;
  endsequence  
  
  sequence seq_2;
     ##1 a;
  endsequence
  
  property p;
    @(posedge clk) seq_1 |-> seq_2;
  endproperty
  
  a_1: assert property(p);     
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
    
endmodule
