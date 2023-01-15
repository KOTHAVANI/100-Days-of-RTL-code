module Decimal2Binary_Encoder( Decimal, Binary );
         
    input [9:0] Decimal;
    output [3:0] Binary;
    reg [3:0] Binary;

always @(Decimal)
    begin
        case (Decimal) 
            10'b0000000001 : Binary = 4'b0000;   
            10'b0000000010 : Binary = 4'b0001;   
            10'b0000000100 : Binary = 4'b0010;  
            10'b0000001000 : Binary = 4'b0011;   
            10'b0000010000 : Binary = 4'b0100;  
            10'b0000100000 : Binary = 4'b0101;  
            10'b0001000000 : Binary = 4'b0110;
            10'b0010000000 : Binary = 4'b0111;   
            10'b0100000000 : Binary = 4'b1000;
            10'b1000000000 : Binary = 4'b1001;                
			
            default: Binary = 4'b0000;
        endcase
    end
    
endmodule

