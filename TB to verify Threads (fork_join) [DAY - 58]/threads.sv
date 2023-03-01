// Code your testbench for Threads ( fork_join )
module tb;
  
    task first();
        $display("Task 1 Started at %0t",$time);
      #20;      
        $display("Task 1 Completed at %0t",$time);     
    endtask  
    
    task second();
      $display("Task 2 Started at %0t",$time);
      #30;      
     $display("Task 2 Completed at %0t",$time);     
    endtask
    
    task third();
      $display("Task 3 started & completed at %0t",$time);     
    endtask
   
  initial begin
       
    fork      
      first();
      second();      
    join      
      third();
    
  end
  
endmodule
