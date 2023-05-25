module impli_ass;
  
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
    
  property ppt;
    @(posedge clk) a |=> ##1 b;
  endproperty
  
  //calling assert property
  a_1: assert property(ppt);
     
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
    
endmodule
