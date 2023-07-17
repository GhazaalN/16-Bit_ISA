`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:44:22 07/08/2023 
// Design Name: 
// Module Name:    Test_SignExtend 
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
module Test_SignExtend;

	// Inputs
	reg [4:0] Immediate;

	// Outputs
	wire [15:0] Extended;

	// Instantiate the Unit Under Test (UUT)
	SignExtend uut (
		.Immediate(Immediate), 
		.Extended(Extended)
	);

	initial begin
		// Initialize Inputs
		Immediate = 5'b10010;

		// Wait 100 ns for global reset to finish
		#100;
       
		 Immediate = 5'b00010;
		// Add stimulus here

	end
      
endmodule
