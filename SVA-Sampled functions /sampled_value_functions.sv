// Code your testbench here
// or browse Examples

module sampled_value_functions;  
  
  bit clk,a;  
  
  always #5 clk = ~clk; //clock generation 
  
  // $rose(expression)
  property p1;
    @(posedge clk) $rose(a);
  endproperty  
  
  // $fell(expression)
  property p2;
    @(posedge clk) $fell(a);
  endproperty
  
  // $stable(expression)
  property p3;
    @(posedge clk) $stable(a);
  endproperty  
  
  // $changed(expression)
  property p4;
    @(posedge clk) $changed(a);
  endproperty  
  
  //calling assert property
  a_1: assert property(p1);
    a_2: assert property(p2);
      a_3: assert property(p3);
        a_4: assert property(p4);   
          
  initial begin 
        a=0;
    #10 a=1;
    #10 a=0;
    #20 a=1;
    #10 a=0;
    #13 a=1;
    #10 a=0;
    #7  a=1;
    #10 a=0;
    #13 a=1;
    #2  a=0;
    #20 a=0;
    $finish;
  end  
          
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end    
          
endmodule
