//Write the assertions fot T-Flipflop with no reset or preset inputs

module SVA_Example;  
  
  bit clk,t,q;  
  
  always #5 clk = ~clk; //clock generation  
  
  initial begin 
        t=1; q=0;
    #10 t=0; q=0;
    #10 t=1; q=1;
    #10 t=0; q=0;
    #10 t=1; q=0;
    $finish;
end
  
  property no_change;				// 	No Change condition
    @(posedge clk) (t==0) |=> q==$past(q,1);
  endproperty
  
  property toggle;					//	Toggle condition
    @(posedge clk) (t==1) |=> q==~($past(q,1));
  endproperty
  
  //calling assert property
  NC: assert property(no_change);   
  Toggle: assert property(toggle);   
    
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end    
    
endmodule
