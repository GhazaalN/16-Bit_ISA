`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:34:10 07/08/2023 
// Design Name: 
// Module Name:    Mux2_1_16bit 
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
module Mux2_1_16bit(
    input [15:0] Operand1,
    input [15:0] Operand2,
    input SelectorInput,
    output [15:0] Result
);
assign Result = SelectorInput ? Operand2 : Operand1; 

endmodule

