// Code your testbench here
module first_match_construct;
  
  bit clk, p, q, r, s;     
  
  always #5 clk = ~clk; //clock generation    
  
  initial begin
   		p=0; q=0; r=0; s=0;
    #10 p=1;
    #10 p=0; q=1;
    #30 q=0; r=1;
    #10 r=0; s=1;
    #20 s=0;
    #20 p=1;
    #10 p=0; q=1;
    #10 r=1;
    #10 s=1;
    #10 q=0; r=0;
    #10 s=0; 
    #10 p=0; q=0; r=0; s=0;
    $finish;
  end 
  
  sequence s1;
    q[*1:3] ##1 r;
  endsequence   
  
  //  without using first_match construct
  property p1;
    @(posedge clk) p ##1 (s1) |=> s[*2];
  endproperty
  
  // using first_match construct
  property p2;
    @(posedge clk) p ##1 first_match(s1) |=> s[*2];
  endproperty  
  
  //	calling assert property
  a_1: assert property(p1);
  a_2: assert property(p2);
    
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end        
    
endmodule
