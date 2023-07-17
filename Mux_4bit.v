`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:33:34 07/08/2023 
// Design Name: 
// Module Name:    Mux_4bit 
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
module Mux_4bit(
    input SelectorInput,
	 input [3:0] Operand1,
    input [3:0] Operand2,
    output [3:0] Result
    );

assign Result = SelectorInput ? Operand2 : Operand1; 

endmodule

