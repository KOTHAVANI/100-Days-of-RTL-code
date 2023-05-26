module go_to_repetition;
  
  bit clk,a,b,c;
  
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
    #10 b=0;
    #20 b=1;
    #10 b=0;
    $finish;
  end
  
  //Go to Repetition operator [->min:max] / [->]
  property p;
    @(posedge clk) $rose(a) |=> ##1 (b[-> 2:4]) ##1 c;
  endproperty
  
  //calling assert property
  a_1: assert property(p);
    
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
    
endmodule
