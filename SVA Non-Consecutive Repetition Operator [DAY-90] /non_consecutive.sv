module non_consecutive_repetition_operator;   
  
  bit clk, a, b, c;  
  
  always #5 clk = ~clk; //clock generation  
  
  initial begin 
        a=1; b=0; c=0;
    #10 a=0;
    #10 b=1;
    #10 b=0;
    #10 b=1;
    #10 b=0; c=1;
    #10 a=1; c=0;
    #10 a=0;
    #10 b=1;
    #10 b=0;
    #10 b=1;
    #20 a=1; b=0;
    #10 a=0; c=1;
    #10 b=1; c=0;
    $finish;
  end
  
  //  non-consecutive_repetition_operator [*n]
  property p;
    @(posedge clk) $rose(a) |=> ##1 (b[=2]) ##1 c;
  endproperty    
  
  //	calling assert property
  a_1: assert property(p);
    
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end    
    
endmodule
