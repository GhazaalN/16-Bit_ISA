`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:40:41 07/08/2023 
// Design Name: 
// Module Name:    Test_CPU 
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
module Test_CPU;

	// Inputs
	reg Clk;

	// Outputs
	wire [15:0] Temp;
	wire [15:0] Finalextend;
	wire [15:0] ReadData1;
	wire [15:0] ReadData2;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.Clk(Clk), 
		.Temp(Temp), 
		.Finalextend(Finalextend), 
		.Zero(Zero),
		.ReadData1(ReadData1),
		.ReadData2(ReadData2)
	);
	
initial begin 
		Clk=0;
		#100;
		forever #10 Clk = ~Clk;
		end

//	initial begin
		// Initialize Inputs
	//	Clk = 0;

		// Wait 100 ns for global reset to finish
		//#100;
        
		// Add stimulus here

	//end
      
endmodule

