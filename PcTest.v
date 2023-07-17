`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:35:27 07/08/2023 
// Design Name: 
// Module Name:    PcTest 
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
module PcTest;

	// Inputs
	reg [15:0] Operand1;
	reg [15:0] Operand2;
	reg [2:0] Alu_Opcode;
	reg Shift;

	// Outputs
	wire [15:0] Result;
	wire Zero_Out;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.Operand1(Operand1), 
		.Operand2(Operand2), 
		.Alu_Opcode(Alu_Opcode), 
		.Shift(Shift), 
		.Result(Result), 
		.Zero_Out(Zero_Out)
	);

	initial begin
		// Initialize Inputs
		Operand1 = 0;
		Operand2 = 0;
		Alu_Opcode = 0;
		Shift = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule
