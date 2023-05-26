//Write the assertions for D-Flipflop with clock and reset

module SVA_Example;  

  bit clk,d,q,rst;  
  
  always #5 clk = ~clk; //clock generation  
  
  initial begin 
        d=0; q=0; rst=1;
    #10 d=1; q=0; 
    #10 d=0; q=0;
    #10 rst=0;
    #10 d=1; q=1; 
    #10 d=0; q=1;
    #10 d=1; q=0;
    #10 d=0; q=0;
    #10;
    $finish;
end

  property d_ff;				// 	d-ff condition
    @(posedge clk) disable iff (rst) !d |=> q == ($past(q,1));
  endproperty
  
  //calling assert property
  a_1: assert property(d_ff); 
  
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end    
  
endmodule
