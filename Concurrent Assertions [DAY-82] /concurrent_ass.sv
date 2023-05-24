module concurrent_ass;
  
      bit a, b;
      bit clk;
  
		//clock generation
      always #10 clk = ~clk;
  
      initial begin
          for (int i = 0; i < 10; i++)
            begin
              @(posedge clk);
              a <= $random;
              b <= $random;
              $display("[%0t] a=%0b b=%0b", $time, a, b);
            end
          #10 $finish;
      end
  
    //Concurrent Assertion  
    // This assertion runs for entire duration of simulation
    // Ensure that atleast 1 of the two signals is high on every clk
    assert property (@(posedge clk) !(!a ^ b));   
      
      initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
      end 
      
endmodule
