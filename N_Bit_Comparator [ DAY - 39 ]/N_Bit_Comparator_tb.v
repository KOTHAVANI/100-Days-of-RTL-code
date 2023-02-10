////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Kotha Vani
//
// Create Date:   17:56:03 02/10/2023
// Design Name:   N_Bit_Comparator
// Module Name:   /home/ise/Desktop/N_Bit_Comparator/N_Bit_Comparator_tb.v
// Project Name:  N_Bit_Comparator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: N_Bit_Comparator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module N_Bit_Comparator_tb;

	// Inputs
	reg [4:0] in_1;
	reg [4:0] in_2;

	// Outputs
	wire Equal;
	wire Greater;
	wire Lesser;

	// Instantiate the Unit Under Test (UUT)
	N_Bit_Comparator uut (
		.in_1(in_1), 
		.in_2(in_2), 
		.Equal(Equal), 
		.Greater(Greater), 
		.Lesser(Lesser)
	);

	initial begin
		// Initialize Inputs
		in_1 = 0;
		in_2 = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
in_1 = 2;
in_2 = 25;
#10;
in_1 = 6;
in_2 = 18;
#10;
in_1 = 31;
in_2 = 16;
#10;
in_1 = 9;
in_2 = 9;
#10;
in_1 = 1;
in_2 = 7;
#10;
end

initial
begin
$monitor ("in_1 = %d, in_2 = %d, Lesser = %b, Greater = %b, Equal = %b", in_1, in_2, Lesser, Greater, Equal);
end
      
endmodule

