module Bidirectional_shift_register  #( parameter MSB = 4)
 ( input d,                      
	input clk,                    
	input en,                    
	input dir,                    
	input rstn,                   
	output reg [MSB-1:0] out); 
     	

   always @ (posedge clk)
      if (!rstn)
         out <= 0;
      else begin
         if (en)
            case (dir)
               0 :  out <= {out[MSB-2:0], d};
               1 :  out <= {d, out[MSB-1:1]};
            endcase
         else
            out <= out;
      end
endmodule
