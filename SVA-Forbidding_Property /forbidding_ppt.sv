module forbidding_property;  
  
  bit clk, p, q ;      
  
  always #5 clk = ~clk; //clock generation  
  
  initial begin
   		p=1; q=0; 
    #10 q=1;
    #10 p=0; q=0;
    #10 p=1;
    #20 q=1;
    #10 p=0;
    #10 p=1; q=0;
    #10 p=0;
    $finish;
  end  
  
  sequence seq;
    @(posedge clk) p ##1 q;
  endsequence       
   
  property ppt1;         // forbidding property
   not seq;
  endproperty   
  
  //	calling assert property
  a_1: assert property(ppt1);  
    
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end         
    
endmodule
