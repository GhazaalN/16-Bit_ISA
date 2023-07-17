`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:42:26 07/08/2023 
// Design Name: 
// Module Name:    Test_Mux21 
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
module Test_Mux21;

	// Inputs
	reg [15:0] Operand1;
	reg [15:0] Operand2;
	reg SelectorInput;

	// Outputs
	wire [15:0] Result;

	// Instantiate the Unit Under Test (UUT)
	Mux2_1_16bit uut (
		.Operand1(Operand1), 
		.Operand2(Operand2), 
		.SelectorInput(SelectorInput), 
		.Result(Result)
	);

	initial begin
		// Initialize Inputs
		Operand1 = 0;
		Operand2 = 0;
		SelectorInput = 0;

		// Wait 100 ns for global reset to finish
		#100;
		Operand1 = 1;
		Operand2 = 0;
		SelectorInput = 1;
        
		// Add stimulus here

	end
      
endmodule

