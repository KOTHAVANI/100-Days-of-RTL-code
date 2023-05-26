module consecutive_repetition_operator;
  
  bit clk,start,stop,a;
  
  always #5 clk = ~clk; //clock generation
  
  initial begin 
      start=1; stop=0; a=0;
    #10 start=0;
    #10 a=1; 
    #30 stop=1; a=0; 
    #10 stop=0;
    #10 start=1;
    #10 start=0;
    #10 a=1; 
    #30 start=1; stop=1; a=0;
    #10 start=0; stop=0;
    #10 a=1;
    #20 stop=1; a=0;
    #10 stop=0;
    $finish;
  end
  
  property p;
    @(posedge clk) $rose(start) |=> ##1 (a[*3]) ##1 stop;
  endproperty
    
  //calling assert property
  a_1: assert property(p);
      
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
    
endmodule
