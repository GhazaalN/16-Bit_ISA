`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:43:33 07/08/2023 
// Design Name: 
// Module Name:    Test_RegisterFile 
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
module Test_RegisterFile;

	// Inputs
	reg [3:0] Read_Register1; //rs
	reg [3:0] Read_Register2; //rt
	reg [3:0] Write_Reg; // rd
	reg [15:0] Write_Data;
	reg Clk;
	reg RegWrite; //we

	// Outputs
	wire [15:0] Read_Data1;
	wire [15:0] Read_Data2;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.Read_Register1(Read_Register1), 
		.Read_Register2(Read_Register2), 
		.Write_Reg(Write_Reg), 
		.Write_Data(Write_Data), 
		.Clk(Clk), 
		.RegWrite(RegWrite), 
		.Read_Data1(Read_Data1), 
		.Read_Data2(Read_Data2)
	);

	initial begin
		// Initialize Inputs
		Read_Register1 = 0;
		Read_Register2 = 0;
		Write_Reg = 0;
		Write_Data = 0;
		Clk = 0;
		RegWrite = 0;

		// Wait 100 ns for global reset to finish
		#100;
      Read_Register1 = 4'b0001;
		Read_Register2 = 4'b0010;
		Write_Reg = 4'b0011;
		Write_Data = 0;
		Clk = 1;
		RegWrite = 0;
		
		#100;
      Read_Register1 = 4'b0001;
		Read_Register2 = 4'b0010;
		Write_Reg = 4'b0011;
		Write_Data = 0;
		Clk = 0;
		RegWrite = 0;
		
		#100;
      Read_Register1 = 4'b0001;
		Read_Register2 = 4'b0010;
		Write_Reg = 4'b0011;
		Write_Data = 16'h0020;
		Clk = 1;
		RegWrite = 1;
		
		#100;
      Read_Register1 = 4'b0001;
		Read_Register2 = 4'b0010;
		Write_Reg = 4'b0011;
		Write_Data = 16'h0020;
		Clk = 0;
		RegWrite = 1;
		
		#100;
      Read_Register1 = 4'b0001;
		Read_Register2 = 4'b0011;
		Write_Reg = 4'b0011;
		Write_Data = 16'h0020;
		Clk = 1;
		RegWrite = 0;
		
		// Add stimulus here

	end
      
endmodule