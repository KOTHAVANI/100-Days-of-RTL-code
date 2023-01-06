module Bidirectional_shift_register_tb();        
   parameter MSB = 4;
   reg data;                  
   reg clk;                   
   reg en;                    
   reg dir;                   
   reg rstn;                  
   wire [MSB-1:0] out;        
   
   
   Bidirectional_shift_register  #(MSB) sr0  ( .d (data), .clk (clk), .en (en), .dir (dir), .rstn (rstn), .out (out));

   // Generate clock time period = 20ns, freq => 50MHz
   always #10 clk = ~clk;

   initial
   begin
      clk <= 0;
      en <= 0;
      dir <= 0;
      rstn <= 0;
      data <= 4'b1001;
   end

   
   initial
   begin     
	  rstn <= 0;     			 // 1. Apply reset and deassert reset after some time
      #20 
	  rstn <= 1;
      en <= 1;
          
	  
      repeat (7) @ (posedge clk) // 2. For 7 clocks, drive alternate values to data pin
      data <= ~data;
   
     
      #10   					// 4. Shift direction and drive alternate value to data pin for another 7 clocks
	  dir <= 1;
      repeat (7) @ (posedge clk)
      data <= ~data;

      
      repeat (7) @ (posedge clk); // 5. Drive nothing for next 7 clocks, allow shift register to simply shift based on dir
      
      
      $finish;
   end

   
   initial
      $monitor ("rstn=%0b data=%b, en=%0b, dir=%0b, out=%b", rstn, data, en, dir, out);
endmodule
