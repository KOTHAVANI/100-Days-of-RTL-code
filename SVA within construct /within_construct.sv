// Code your testbench for sequence composition

module within_construct;     
  
  bit clk, a, b, c, d;  
  
  always #5 clk = ~clk; //clock generation    
  
  initial begin
   		a=0; b=0; c=0; d=0;
    #10 d=1;
    #10 b=1;
    #10 a=1; d=0;
    #20 a=0; c=1;
    #20 c=0; d=1;
    #10 d=0;
    #10 c=1;
    #10 c=0;
    #10 c=1;
    #10 b=0;
    #10 a=1; c=0; 
    #10 d=1;    
    $finish;
  end 
  
  sequence s1;
    ##[1:2] a;
  endsequence 
  
  sequence s2;
    b ##[3:5]c;
  endsequence 
  
  //  within construct
  property p;
    @(posedge clk) $rose(d) |=> s1 within s2;
  endproperty  
  
  //	calling assert property
  a_1: assert property(p);    
    
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end   
    
endmodule
