`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:43:02 07/08/2023 
// Design Name: 
// Module Name:    Test_Pc 
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
module Test_Pc;

	// Inputs
	reg Clk;
	reg [15:0] PcInput;
	integer i;

	// Outputs
	wire [15:0] PcOutput;

	// Instantiate the Unit Under Test (UUT)
	Pc uut (
		.Clk(Clk), 
		.PcInput(PcInput), 
		.PcOutput(PcOutput)
	);
   always begin
    # 10 Clk = ~Clk;
	end

	initial begin
		// Initialize Inputs
		Clk = 0;
		PcInput = 0;

		// Wait 100 ns for global reset to finish
		  #10;
     
		for( i=0 ; i< 10; i = i+1)begin
        PcInput= i;
        #20;
    end
  end 
endmodule
