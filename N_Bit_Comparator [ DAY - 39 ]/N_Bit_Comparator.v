//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Kotha Vani
// 
// Create Date:    17:55:02 02/10/2023 
// Design Name: 
// Module Name:    N_Bit_Comparator 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module N_Bit_Comparator ( in_1, in_2, Equal, Greater, Lesser );

parameter N = 5;

input [N-1:0] in_1, in_2;
output Equal, Greater, Lesser;
reg [2:0] out;

always @ ( in_1 or in_2 )
begin
if ( in_1 == in_2 )
begin
out = 3'b001;
end
else if ( in_1 < in_2 )
begin
out = 3'b100;
end
else                    // ( in_1 > in_2 )
begin
out = 3'b010;
end
end

assign { Lesser, Greater, Equal } = out ;

endmodule
