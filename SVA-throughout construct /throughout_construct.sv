// Code your testbench for sequence composition

module throughout_construct;
  
  bit clk, a, b, c, d;     
  
  always #5 clk = ~clk; //clock generation    
  
  initial begin
   		a=1; b=0; c=0; d=0;
    #10 a=0; d=1;
    #10 b=1;
    #10 b=0;
    #10 b=1;
    #10 b=0;c=1;
    #10 a=1; c=0; d=0;
    #10 a=0; d=1;
    #10 b=1;
    #10 b=0;
    #10 b=1;
    #20 a=1; b=0; d=0;
    #10 a=0; c=1; d=1;
    #10 b=1; c=0;   
    $finish;
  end 
  
  sequence s1;
    ##1 (b[=2:4]) ##1 c;
  endsequence   
  
  //  throughout construct
  property p;
    @(posedge clk) $rose(a) |=> d throughout s1;
  endproperty   
  
  //	calling assert property
  a_1: assert property(p);  
    
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end        
    
endmodule
