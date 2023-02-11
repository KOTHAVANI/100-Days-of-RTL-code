`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Kotha Vani
//
// Create Date:   19:05:54 02/11/2023
// Design Name:   Carry_Skip_Adder
// Module Name:   /home/ise/Desktop/CarrySkipAdder/Carry_Skip_Adder_tb.v
// Project Name:  CarrySkipAdder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Carry_Skip_Adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Carry_Skip_Adder_tb;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;

	// Outputs
	wire [7:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	Carry_Skip_Adder uut (
		.sum(sum), 
		.cout(cout), 
		.a(a), 
		.b(b)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#10;
  
		// Add stimulus here
a=8'b10100000; b=8'b10100100;
#10 a=8'b01011000; b=8'b11110100;
#10 a=8'b00110101; b=8'b00001111;
#10 a=8'b01001010; b=8'b11001000;
#10 a=8'b10100110; b=8'b11010100;
#10 a=8'b01110011; b=8'b11001100;
#10 a=8'b11110011; b=8'b01010011;
	end
  
initial
begin
$monitor(" a=  %d | b=  %d || cout=  %d |sum=  %d ", a[7:0], b[7:0], cout, sum[7:0]);
end
      
endmodule

