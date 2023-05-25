module sva_seq_ex;
  
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
  
  //assertion sequence with timing relationship
  sequence seq_1;
    @(posedge clk) a ##2 b;
  endsequence  
  
  //assertion sequence with logical relationship 
  sequence seq_2;
    @(posedge clk) a||b;
  endsequence  
  
   //Clock defined in the property definition
  sequence seq_3;
    a == 1 ;
  endsequence 
  property ppt;
    @(posedge clk) seq_3;
  endproperty
  
  //calling assert property
  a_1: assert property(seq_1);
  a_2: assert property(seq_2);
  a_3: assert property(ppt);  
    
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end   
    
endmodule
