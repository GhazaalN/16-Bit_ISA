`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:41:45 07/08/2023 
// Design Name: 
// Module Name:    Test_DataMemoryUnit 
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
module Test_DataMemoryUnit;

	// Inputs
	reg [15:0] Address;
	reg [15:0] Write_Data; //value
	reg Clk;
	reg MemWrite; //we

	// Outputs
	wire [15:0] Read_Data;

	// Instantiate the Unit Under Test (UUT)
	DataMemoryUnit uut (
		.Address(Address), 
		.Write_Data(Write_Data), 
		.Clk(Clk), 
		.MemWrite(MemWrite), 
		.Read_Data(Read_Data)
	);

	initial begin
		// Initialize Inputs
		Address = 16'h0002;
		Write_Data = 16'h0009;
		Clk = 0;
		MemWrite = 1;

		// Wait 100 ns for global reset to finish
		  #20;
    
		   Address = 16'h0002;
			Write_Data = 16'h0009;
			Clk = 1;
			MemWrite = 1;
			
		  #20;
		   Address = 16'h0002;
			Write_Data = 16'h0009;
			Clk = 0;
			MemWrite = 1;
    
	 
        #20;
		   Address = 16'h0002;
			Write_Data = 16'h0009;
			Clk = 1;
			MemWrite = 0;
			
			
		  #20;
		   Address = 16'h0003;
			Write_Data = 16'h0009;
			Clk = 1;
			MemWrite = 0;
        
		// Add stimulus here

	end
      
endmodule

