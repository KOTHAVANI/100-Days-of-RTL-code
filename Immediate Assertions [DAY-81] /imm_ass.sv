module imm_ass;
  
  bit clk,a,b;  
  //clock generation
  
  always #5 clk = ~clk;   
  
  initial begin 
    a=1;
    b=1;
    #10 a=0;
    #10 a=1;
        b=0;
    #30 b=1;
    #10;
    $finish;
  end 
  
  //Immediate assertion
  //always @(posedge clk) assert (a && b);
  always @(posedge clk)
    begin 
    	assert (a && b); 
    end   
  
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end 
  
endmodule
