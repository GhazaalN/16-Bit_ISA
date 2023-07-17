`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:34:44 07/08/2023 
// Design Name: 
// Module Name:    Pc 
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
module Pc(
		input Clk,
		input [15:0] PcInput,
		output [15:0] PcOutput
    );
	 
reg [15:0] Counter;

initial begin
      Counter = 0;
end

assign PcOutput = Counter;
	always@ (posedge Clk) begin //old pc or new pc
		Counter = PcInput;
	end

endmodule

