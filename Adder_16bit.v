`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:28:23 07/08/2023 
// Design Name: 
// Module Name:    Adder_16bit 
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
module Adder_16bit(
	input [15:0] Operand1,
	input [15:0] Operand2,
	output [15:0] Sum
    );

assign Sum = Operand1 + Operand2;

endmodule