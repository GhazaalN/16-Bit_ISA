`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:39:46 07/08/2023 
// Design Name: 
// Module Name:    Test_ControlUnit 
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
module Test_ControlUnit;

	// Inputs
	reg [2:0] Opcode;

	// Outputs
	wire Alu_Src;
	wire Branch;
	wire Mem_Write;
	wire Reg_Write;
	wire Jump;
	wire Mem_To_Reg;
	wire Reg_Dst;

	// Instantiate the Unit Under Test (UUT)
	ControlUnit uut (
		.Opcode(Opcode), 
		.Alu_Src(Alu_Src), 
		.Branch(Branch), 
		.Mem_Write(Mem_Write), 
		.Reg_Write(Reg_Write), 
		.Jump(Jump), 
		.Mem_To_Reg(Mem_To_Reg), 
		.Reg_Dst(Reg_Dst)
	);

	initial begin
		// Initialize Inputs
		Opcode = 111;

		// Wait 100 ns for global reset to finish
		#100;  
		Opcode = 110;
		
		#100;
		Opcode = 101;
		
		#100;
		Opcode = 100;
		
		#100;
		Opcode = 011;
		
		#100;
		Opcode = 010;
		
		#100;
		Opcode = 001;
		
		#100;
		Opcode = 000;
		// Add stimulus here

	end
      
endmodule

