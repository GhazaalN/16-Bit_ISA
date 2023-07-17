`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:38:40 07/08/2023 
// Design Name: 
// Module Name:    Test_Alu 
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
module Test_Alu;

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
		Operand1 = 16'h0004;
		Operand2 = 16'h0004;
		Alu_Opcode = 000;
		Shift = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		Operand1 = 16'h0004;
		Operand2 = 16'h0002;
		Alu_Opcode = 010;
		Shift = 0;
		// Add stimulus here
		#100;
        
		Operand1 = 16'h0004;
		Operand2 = 16'h0002;
		Alu_Opcode = 011;
		Shift = 1;
		
		
		#100;
        
		Operand1 = 16'h0004;
		Operand2 = 16'h0004;
		Alu_Opcode = 100;
		Shift = 0;
		

	end
      
endmodule
